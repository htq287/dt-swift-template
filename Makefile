SHELL := /bin/bash
CWD := $(shell cd -P -- '$(shell dirname -- "$0")' && pwd -P)

echo:
	@echo WELLCOME
	@echo $(CWD)
init_env:
	brew install carthage
	brew install xcodegen
install:
	swift -target x86_64-apple-macosx10.14 installer.swift -template Template
install_commandlinetool_template:
	swift -target x86_64-apple-macosx10.14 installer.swift -template CLT_GenericTemplate
install_macosx_generic_template:
	swift -target x86_64-apple-macosx10.14 installer.swift -template macOS_GenericTemplate
