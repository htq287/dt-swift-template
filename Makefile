SHELL := /bin/bash
CWD := $(shell cd -P -- '$(shell dirname -- "$0")' && pwd -P)

echo:
	@echo WELLCOME
	@echo $(CWD)
init-env:
	brew install carthage
	brew install xcodegen
install:
	swift -target x86_64-apple-macosx10.14 installer.swift
install-commandlinetool-template:
	swift -target x86_64-apple-macosx10.14 installer.swift -template CLT_GenericTemplate
install-macosx-generic-template:
	swift -target x86_64-apple-macosx10.14 installer.swift -template macOS_GenericTemplate
