set -gx FORGIT_STASH_FZF_OPTS '
--bind="ctrl-d:reload(git stash drop $(cut -d: -f1 <<<{}) 1>/dev/null && git stash list)"
'
