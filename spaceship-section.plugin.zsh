#
# JJ (Jujutsu VCS)
#
# Jujutsu is a Git-compatible DVCS that is both simple and powerful.
# Link: https://jj-vcs.github.io/jj/latest/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_JJ_SHOW="${SPACESHIP_JJ_SHOW=true}"
SPACESHIP_JJ_ASYNC="${SPACESHIP_JJ_ASYNC=true}"
SPACESHIP_JJ_PREFIX="${SPACESHIP_JJ_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_JJ_SUFFIX="${SPACESHIP_JJ_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_JJ_SYMBOL="${SPACESHIP_JJ_SYMBOL="😍 "}"
SPACESHIP_JJ_COLOR="${SPACESHIP_JJ_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show jj status
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_jj() {
  # If SPACESHIP_JJ_SHOW is false, don't show jj section
  [[ $SPACESHIP_JJ_SHOW == false ]] && return

  # Check if jj command is available for execution
  spaceship::exists jj || return

  # Show jj section only when in a jj repository
  # Look for .jj directory (jj's equivalent of .git)
  local is_jj_repo="$(spaceship::upsearch .jj)"
  [[ -n "$is_jj_repo" ]] || return

  # Get current bookmark/branch information
  local jj_status="$(jj status --ignore-working-copy 2>/dev/null)"
  [[ $? -eq 0 ]] || return

  # Extract current bookmark from status
  local current_bookmark=""
  if [[ $jj_status =~ "Working copy.*: [a-z0-9]+ [a-f0-9]+ ([^|]*)" ]]; then
    current_bookmark="${match[1]// /}"
    # Remove trailing * if present
    current_bookmark="${current_bookmark%\*}"
  fi

  # Get working copy status
  local jj_info=""
  if [[ $jj_status =~ "The working copy has no changes" ]]; then
    jj_info="$current_bookmark"
  else
    # Working copy has changes
    jj_info="$current_bookmark*"
  fi

  # Check for conflicts
  if [[ $jj_status =~ "conflict" ]]; then
    jj_info="$jj_info!"
  fi

  # Display jj section
  # spaceship::section utility composes sections. Flags are optional
  spaceship::section::v4 \
    --color "$SPACESHIP_JJ_COLOR" \
    --prefix "$SPACESHIP_JJ_PREFIX" \
    --suffix "$SPACESHIP_JJ_SUFFIX" \
    --symbol "$SPACESHIP_JJ_SYMBOL" \
    "$jj_info"
}
