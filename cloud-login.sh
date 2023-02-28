#!/usr/bin/env bash

#    Copyright (C) 2022 Xmogrify LLC
#
#    This library is free software; you can redistribute it and/or
#    modify it under the terms of the GNU Lesser General Public
#    License as published by the Free Software Foundation; either
#    version 2.1 of the License, or (at your option) any later version.
#
#    This library is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#    Lesser General Public License for more details.
#
#    You should have received a copy of the GNU Lesser General Public
#    License along with this library; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
#    USA
#
#    For questions regarding this notice, please email: "Xmogrify Open Source
#    Software Licensing" <oslicense@xmogrify.com>.


ARG1=$(echo "${1}" | tr '[:upper:]' '[:lower:]')
ARG2=$(echo "${2}" | tr '[:upper:]' '[:lower:]')
CLOUDPROFILE=${ARG2}
export BROWSER=${0}

if [[ ${ARG1} =~ ^https?://.+$ ]]; then
	BROWSERCMD="open -na 'Google Chrome' --args --new-window --profile-directory='${BROWSERPROFILE}' '${1}'"
	echo "Browser Command: '${BROWSERCMD}'"
	eval "${BROWSERCMD}"
elif [[ ${ARG1} =~ (aws|az) ]]; then
	case ${ARG1} in
		aws)
			CLOUDCMD="aws sso login --profile $CLOUDPROFILE"
			;;
		
		az)
			CLOUDCMD="az login"
			;;
	esac

# Associate your cloud profiles with Chrome Profiles here.
	case ${ARG2} in
		cloud_profile-1)
			export BROWSERPROFILE="Default"
			;;
		cloud_profile-2)
			export BROWSERPROFILE="Profile 1"
			;;
		cloud_profile-3)
			export BROWSERPROFILE="Profile 2"
			;;
	esac
	
eval "${CLOUDCMD}"

else
	echo "Usage: <aws|az> <profile>"
fi
