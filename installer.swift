#!/usr/bin/env xcrun swift

import Foundation

var TPLProjectName = ""

let arguments: Array = CommandLine.arguments
let templateName = arguments[2]

switch templateName {
case "Template":
    TPLProjectName = "TPLProjectName"
    break
case "CLT_GenericTemplate":
    TPLProjectName = "CLTProjectName"
    break
case "macOS_GenericTemplate":
    TPLProjectName = "GRTPLProjectName"
    break
default:
    break
    
}


// let TPLProjectName = "TPLProjectName"
let TPLAuthor = "TPLAuthor"
var TPLBundleIdentifier = "TPLBundleIdentifier"
let TPLAuthorWebsite = "TPLAuthorWebsite"
let TPLUserName = "TPLUserName"
let TPLOrganizationName = "TPLOrganizationName"
let TPLCopyright = "Copyright © 2019"

var projectName = "SampleProject"
var bundleIdentifier = "com.rilthot.SampleProject"
var author = "Hung Q. Truong"
var authorWebsite = "https://htq287.github.io"
var userName = "hungtq"
var organizationName = "Rilthot"
var copyright = "Copyright © 2019"

let fileManager = FileManager.default

let runScriptPathURL = NSURL(fileURLWithPath: fileManager.currentDirectoryPath, isDirectory: true)
let currentScriptPathURL = NSURL(fileURLWithPath: NSURL(fileURLWithPath: CommandLine.arguments[0], relativeTo: runScriptPathURL as URL).deletingLastPathComponent!.path, isDirectory: true)
let projectTemplateForlderURL = NSURL(fileURLWithPath: templateName, relativeTo: currentScriptPathURL as URL)
var newProjectFolderPath = ""
let ignoredFiles = [".DS_Store", "UserInterfaceState.xcuserstate", "Pods", "Carthage", "build"]

extension NSURL {
    var fileName: String {
        var fileName: AnyObject?
        try! getResourceValue(&fileName, forKey: URLResourceKey.nameKey)
        return fileName as! String
    }
    
    var isDirectory: Bool {
        var isDirectory: AnyObject?
        try! getResourceValue(&isDirectory, forKey: URLResourceKey.isDirectoryKey)
        return isDirectory as! Bool
    }
    
    func renameIfNeeded() {
        if let _ = fileName.range(of: TPLProjectName) {
            let renamedFileName = fileName.replacingOccurrences(of: TPLProjectName, with: projectName)
            try! FileManager.default.moveItem(at: self as URL, to: NSURL(fileURLWithPath: renamedFileName, relativeTo: deletingLastPathComponent) as URL)
        }
    }
    
    func updateContent() {
        guard let path = path, let content = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) else {
            print("ERROR READING: \(self)")
            return
        }
        var newContent = content.replacingOccurrences(of: TPLProjectName, with: projectName)
        newContent = newContent.replacingOccurrences(of: TPLBundleIdentifier, with: bundleIdentifier)
        newContent = newContent.replacingOccurrences(of: TPLAuthor, with: author)
        newContent = newContent.replacingOccurrences(of: TPLUserName, with: userName)
        newContent = newContent.replacingOccurrences(of: TPLAuthorWebsite, with: authorWebsite)
        newContent = newContent.replacingOccurrences(of: TPLOrganizationName, with: organizationName)
        newContent = newContent.replacingOccurrences(of: TPLCopyright, with: copyright)
        try! newContent.write(to: self as URL, atomically: true, encoding: String.Encoding.utf8)
    }
}

func printLogs<T>(_ message: T)  {
    print("Logs: \(message)")
}

func printErrorLogsAndExit<T>(logs message: T) {
    print("ErrorLogs: \(message)")
    exit(1)
}

func checkThatProjectForlderCanBeCreated(projectURL: NSURL){
    var isDirectory: ObjCBool = true
    if fileManager.fileExists(atPath: projectURL.path!, isDirectory: &isDirectory) {
        printErrorLogsAndExit(logs: "\(String(describing:projectName)) \(String(describing:(isDirectory.boolValue ? "folder already" : "file"))) exists in \(String(describing:runScriptPathURL.path)) directory, please delete it and try again")
    }
}

func shell(args: String...) -> (output: String, exitCode: Int32) {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.currentDirectoryPath = newProjectFolderPath
    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    task.waitUntilExit()
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(decoding: data, as: UTF8.self)
    //let output = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as? String ?? ""
    return (output, task.terminationStatus)
}

func prompt(_ message: String, _ defaultValue: String) -> String {
  print("\n> \(message) (or press Enter to use \(defaultValue))")
  let line = readLine()
  return line == nil || line == "" ? defaultValue : line!
}

projectName = prompt("Project Name", projectName)
bundleIdentifier = prompt("Bundle Identifier", bundleIdentifier)
author = prompt("Author", author)
organizationName = prompt("Organizer", organizationName)
copyright = prompt("Copyright", copyright)

// Check if folder already exists
let newProjectFolderURL = NSURL(fileURLWithPath: projectName, relativeTo: runScriptPathURL as URL)
newProjectFolderPath = newProjectFolderURL.path!
checkThatProjectForlderCanBeCreated(projectURL: newProjectFolderURL)

// Copy template folder to a new folder
do {
    try fileManager.copyItem(at: projectTemplateForlderURL as URL, to: newProjectFolderURL as URL)
} catch let error as NSError {
    printErrorLogsAndExit(logs: error.localizedDescription)
}

// rename files/Folders and update content
let enumerator = fileManager.enumerator(at: newProjectFolderURL as URL, includingPropertiesForKeys: [.nameKey, .isDirectoryKey], options: [], errorHandler: nil)!
var directories = [NSURL]()
print("\nCreating \(projectName) ...")
while let fileURL = enumerator.nextObject() as? NSURL {
    guard !ignoredFiles.contains(fileURL.fileName) else { continue }
    if fileURL.isDirectory {
      directories.append(fileURL)
    }
    else {
      fileURL.updateContent()
      fileURL.renameIfNeeded()
    }
}

for fileURL in directories.reversed() {
  fileURL.renameIfNeeded()
}

