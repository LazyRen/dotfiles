# Only run the main (left) prompt asynchronously.
# Leaving fish_right_prompt out keeps fish's native right-alignment intact;
# otherwise the async plugin re-emits the right prompt left-aligned.
set -g async_prompt_functions fish_prompt
set -g async_prompt_inherit_variables status pipestatus SHLVL CMD_DURATION fish_bind_mode COLUMNS
