#!/usr/bin/env bash

##
# IMPORTANT: This file must be sourced with the ‘source’ (also ‘.’)
# command. DO NOT run this file as ‘./env.sh’ or ‘bash ./env.sh’
# because the exported variables will not be on your main shell after
# the script finishes executing.
##

script_name=env.sh

##
# Save the file name parameter.
#
env_file="$1"
#
# And skip file name parameter.
#
shift 1

usage () {
	cat <<-EOF
	  INFO:
	  Provide a file with FOO=bar like env vars.
		
		NOTE: Do not add spaces around the ‘=’ character.

	  SYNTAX:
	    source $script_name FILE [--print | -p]

	  EXAMPLE:
	    source $script_name ./config/dev.api.env

	    source $script_name ./config/dev.api.env -p
	EOF
}

##
# By default, do NOT print the env vars being sourced.
#
print=

for p in "$@"; do
	case "$p" in
		--print|-p)
			print=1
			;;
	esac
done

if ! [[ -r "$env_file" ]]; then
	usage
else
	##
	# Iterate over each line of the file path passed
	# as argument.
	#
	while read -r line; do
		##
		# If the line starts with a comment or is empty, we
		# skip it.
		#
		if [[ "$line" =~ ^# ]] || [[ "$line" =~ ^$ ]]; then
			continue
		fi

		##
		# Let's also make sure we only source lines that contain
		# a ‘=’ character. Like ‘FOO=bar’ or ‘FOO=’.
		#
		if [[ "$line" =~ = ]]; then
			if [[ -n "$print" ]]; then
				printf '%s\n' "$line"
			fi

			export "$line"
		fi
	done < "$env_file"

	printf 'SUCCESS: Env vars from %s have been exported.\n' "$env_file"
fi

#
# vim: set tw=72 noet sts=2 sw=2:
#
