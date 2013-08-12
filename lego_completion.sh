#!/bin/bash

# This script handles bash completion for the lego script
_lego_completion()
{
	local cur prev opts
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	# Override the default WORDBREAKS variable to NOT include the = character, since that is probably in a chroot name.
	COMP_WORDBREAKS="\"'><;|&(: "
	
	case $prev in
		lego)
			reply="list new run end promote demote permit prohibit"
			;;
		new)
			reply=$(lego list template | sed 's|=|\\=|g')
			;;
		promote|demote)
			reply=$(lego list working | sed 's|=|\\=|g')
			;;
		end|permit|prohibit|run)
			reply=$(lego list all | sed 's|=|\\=|g')
			;;
		*)
			return 0;
			;;
	esac
	
	COMPREPLY=( $(compgen -W "${reply}" -- ${cur}) )
}
complete -F _lego_completion lego