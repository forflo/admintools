#!/bin/bash
##

dcmd -u Administrator -r NTB008A regtool --string --wow64 set \"/HKEY_LOCAL_MACHINE/SOFTWARE/Microsoft/Windows NT/CurrentVersion/Winlogon/AutoAdminLogon\" 0
