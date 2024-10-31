# Makefile for update git modules

This Makefile provides two simple commands for update or init your modules into git project.

## Quick Start

1. Ensure you have `make` installed on your system.
2. You have to move the `Makefile` to your project's root directory.

## Usage

Update all modules located in the folder that you indicate:
```
make update-all [MODULES_DIR=<path>]
```

Init or update your project modules:
```
make init-update [MODULES_DIR=<path>]
```

If you need help to use the command:
```
make help
```

## Argument

- `MODULES_DIR`: It's the directory where your modules are located in your project. For me, the default folder is `modules` convention.

## Some exmaples

Update all modules in the project location:
```
make update-all
```

Update modules if you need a specific location:
```
make update-all MODULES_DIR=custom/modules/path
```

Init or update modules (assume the default variable MODULES if your don't modify it):
```
make init-update
```

## Note

This Makefile assumes that your modules are git modules. You must ensure your project is set up (`.gitmodules` file) correctly with git modules before using these commands.
