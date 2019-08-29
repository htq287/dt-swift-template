SHELL := /bin/bash
CWD := $(shell cd -P -- '$(shell dirname -- "$0")' && pwd -P)

echo:
	@echo WELLCOME
	@echo $(CWD)
install:
	swift -target x86_64-apple-macosx10.14 install.swift