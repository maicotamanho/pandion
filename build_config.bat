:: This file is part of Pandion instant messenger
:: Copyright (c) 2010 Sebastiaan Deckers
:: License: GNU General Public License version 3 or later

@ECHO OFF
SET BUILD_CONFIG=1

:: Notes:
:: - Hudson parametrized builds can specify these options automatically.
:: - All settings can be overridden by setting them before this script is executed.
:: - The safe job name is used for files and directories so it cannot contain \ / : * ? " < > |
:: - The build number defaults to 0 if unspecified through the command line or Hudson.

:: Name and Version
IF NOT DEFINED JOB_NAME SET JOB_NAME=Pandion
IF NOT DEFINED JOB_NAME_SAFE SET JOB_NAME_SAFE=Pandion
IF NOT DEFINED VERSION_MAJOR SET VERSION_MAJOR=2
IF NOT DEFINED VERSION_MINOR SET VERSION_MINOR=6
IF NOT DEFINED VERSION_BUILD IF DEFINED BUILD_NUMBER SET VERSION_BUILD=%BUILD_NUMBER%
IF NOT DEFINED VERSION_BUILD SET VERSION_BUILD=0

:: VC++
IF NOT DEFINED HOST_COMMENTS SET HOST_COMMENTS=http://pandion.im/
IF NOT DEFINED HOST_COMPANY SET HOST_COMPANY=%JOB_NAME% Contributors
IF NOT DEFINED HOST_DESCRIPTION SET HOST_DESCRIPTION=%JOB_NAME%
IF NOT DEFINED HOST_COPYRIGHT SET HOST_COPYRIGHT=%HOST_COMPANY%

:: WiX
IF NOT DEFINED VERSION SET VERSION=%VERSION_MAJOR%.%VERSION_MINOR%.%VERSION_BUILD%
IF NOT DEFINED PACKAGE SET PACKAGE=%JOB_NAME_SAFE%_%VERSION%.msi
IF NOT DEFINED MSI_GUID SET MSI_GUID=9F661F94-F17F-4F5C-B1C8-2955C85C8FE9
IF NOT DEFINED MSI_HELP_URL SET MSI_HELP_URL=http://pandion.im/support
IF NOT DEFINED MSI_INFO_URL SET MSI_INFO_URL=http://pandion.im/about
IF NOT DEFINED MSI_MANUFACTURER SET MSI_MANUFACTURER=%HOST_COMPANY%

:: Appcaster
IF NOT DEFINED HUDSON_URL SET HUDSON_URL=http://build.pandion.im/
IF NOT DEFINED APPCAST_LOCAL_FILE SET APPCAST_LOCAL_FILE=../WiX/%PACKAGE%
IF NOT DEFINED APPCAST_DOWNLOAD_URL SET APPCAST_DOWNLOAD_URL=http://downloads.sourceforge.net/project/pandion/builds/%PACKAGE%
IF NOT DEFINED APPCAST_INFO_URL SET APPCAST_INFO_URL=%HUDSON_URL%job/%JOB_NAME%/%VERSION_BUILD%/changes
IF NOT DEFINED APPCAST_FEED_URL SET APPCAST_FEED_URL=http://feeds.feedburner.com/pandionupdates
IF NOT DEFINED APPCAST_TRACK SET APPCAST_TRACK=development