# Getting Started
Welcome to Swift Template, an useful project structure for creating effectively swift applications.

[![Carthage compatible](https://img.shields.io/badge/Carthage-Compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
![Xcode 10.2+](https://img.shields.io/badge/Xcode-10.2%2B-blue.svg)
![iOS 12.2+](https://img.shields.io/badge/iOS-12.2%2B-blue.svg)
![Swift 5.0+](https://img.shields.io/badge/Swift-5.0%2B-orange.svg)

- Requirements:
  - macOS: 10.14.5 (or higher)
  - Xcode: 10.3 +
  - Xcodegen: 2.5.0
  - Carthage: 0.33.0

# Features
- An Advanced template
- An Generic Template for macosx App
- An Generic template for Command Line Tool
  
# Installation
- Clone  repository: `$ git clone https://github.com/htq287/swift-template.git`
- Install your project:
  - Point to template folder: `$ cd swift-template`
  - Before installing the project, make sure [XCodegen](https://github.com/yonaskolb/XcodeGen) and [Carthage](https://github.com/Carthage/Carthage#installing-carthage) installed. If not yet installed, just run `$ make init-env`
  - To create your project, just run: 
    - Advanced template
      ```sh
      $ make install
      ```
    - Generic template for Command Line Tool 
      ```sh
      $ make install_commandlinetool_template
      ```
    - Generic template for macosx 
      ```sh
      $ make install_macosx_generic_template
      ```
  - After created project, we'll need some the following steps
    - Jump to your project folder
      ```sh
      $ cd [Your Project]
      ```
    - Re-generating the new `[Your Project].xcodeproj`
      ```sh
      $ xcodegen
      ```
    - To install the necessary dependencies:
      ```sh
      $ carthage update --no-use-binaries
      ```
  - Well Done! let's start building your fantastic project.

# License
The MIT License (MIT)

Copyright (C) 2019, Hung Q. Truong. https://htq287.com. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

