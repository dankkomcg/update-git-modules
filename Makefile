# Makefile for update your git modules
# Author: José Meira
# Email: dankkomcg
# Version: 1.0
# Date: 2024/10/31
# Description: This Makefile run commands to update or init your git modules in a project.
# License: MIT

# Route to the folder where the modules are located, in my case is modules, you can replace it: MODULES_DIR = your_path
MODULES_DIR = modules
MODULES := $(wildcard $(MODULES_DIR)/*)

# Default option, all modules updated to the last commit
.PHONY: all
all: help

# Show the use guide
.PHONY: help
help:
	@echo "Use case:"
	@echo "  make update-all [MODULES_DIR=<location>]   - Update all your modules to last commit into master"
	@echo "  make init-update [MODULES_DIR=<location>]  - Init is doesn't exists or update your modules"
	@echo ""
	@echo "  MODULES_DIR: modules location."

# Validate if modules are located in correct location it exists
check-modules-dir:
	@if [ -z "$(MODULES_DIR)" ]; then \
		echo "Error: You have to indicate a correct location where your modules are located."; \
		exit 1; \
	fi
	@if [ ! -d "$(MODULES_DIR)" ]; then \
		echo "Error: '$(MODULES_DIR)' is not found."; \
		exit 1; \
	fi

# Update all your modules
.PHONY: update-all
update-all: check-modules-dir
	@echo "Updating the modules found in '$(MODULES_DIR)'..."
	@if [ -z "$(MODULES)" ]; then \
		echo "There aren't modules in '$(MODULES_DIR)'."; \
		exit 1; \
	fi
	@for module in $(MODULES); do \
		if [ -d $$module ]; then \
			echo "Updating $$module..."; \
			cd $$module && git checkout master && git pull origin master && cd ../..; \
		else \
			echo "The module $$module doesn't exists. You can use 'make init-update' to init it."; \
		fi; \
	done

# Init or update your modules
.PHONY: init-update
init-update: check-modules-dir
	@echo "Init or updating your modules into '$(MODULES_DIR)'..."
	@if [ -z "$(MODULES)" ]; then \
		echo "There aren't modules in '$(MODULES_DIR)'."; \
		exit 1; \
	fi
	@for module in $(MODULES); do \
		if [ -d $$module ]; then \
			echo "Updating $$module..."; \
			cd $$module && git checkout master && git pull origin master && cd ../..; \
		else \
			echo "Init $$module..."; \
			git submodule init $$module; \
			git submodule update $$module; \
			cd $$module && git checkout master && cd ../..; \
		fi; \
	done
