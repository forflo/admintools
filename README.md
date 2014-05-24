admintools
==========

A useful set of shell scripts providing basic functionality for maintaining a cluster

## File structure

### admin_tools

Contains the base toolchain.

* dcmd => distributed command execution
* dcopy => distributed file copy
* dnames => fetches names from the machine.list file
* donline => fetches the names of available computers 
* dwake => wakes up a number of specified computers using wakeonlan

### admin_scripts

Contains script that use the base toolchain. These scripts are commented.

### legacy

Contains old scripts.

### admin_scripts_cyg

Contains scripts that use the base toolchain and only are meant to
run on cygwin hosts.

## Usage

All tools within the base toolchain package provide a --help option.
Calling them without any parameters results in the same behaviour.

The scripts in the folder admin_scripts provide the same help mechanism
as mentioned above.

## Dependencies 

The tool donline depends on the tools basem and bashm. Both tools are
available at the following URIs

* basem => https://github.com/forflo/basem
* bashm => https://github.com/forflo/bashm
