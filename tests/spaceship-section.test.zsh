#!/usr/bin/env zsh

# Required for shunit2 to run correctly
CWD="${${(%):-%x}:A:h}"
setopt shwordsplit
SHUNIT_PARENT=$0

# Use system Spaceship or fallback to Spaceship Docker on CI
typeset -g SPACESHIP_ROOT="${SPACESHIP_ROOT:=/spaceship}"

# Mocked jj CLI
mocked_bookmark="main"
jj() {
  case "$1" in
    "status")
      if [[ -f "$SHUNIT_TMPDIR/.jj/store" ]]; then
        echo "The working copy has no changes."
        echo "Working copy  (@) : twnxwzvz 0d609da9 $mocked_bookmark* | (empty) (no description set)"
        echo "Parent commit (@-): mmspsltm f0918114 Updates README"
      else
        return 1
      fi
      ;;
    *)
      return 1
      ;;
  esac
}

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

setUp() {
  # Enter the test directory
  cd $SHUNIT_TMPDIR
}

oneTimeSetUp() {
  export TERM="xterm-256color"

  source "$SPACESHIP_ROOT/spaceship.zsh"
  source "$(dirname $CWD)/spaceship-section.plugin.zsh"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(jj)

  echo "Spaceship version: $(spaceship --version)"
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_ASYNC
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_incorrect_env() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "do not render system version" "$expected" "$actual"
}

test_mocked_jj_status() {
  # Prepare the environment - create mock .jj directory
  mkdir -p $SHUNIT_TMPDIR/.jj
  touch $SHUNIT_TMPDIR/.jj/store

  local prefix="%{%B%}$SPACESHIP_JJ_PREFIX%{%b%}"
  local content="%{%B%F{$SPACESHIP_JJ_COLOR}%}$SPACESHIP_JJ_SYMBOL$mocked_bookmark%{%b%f%}"
  local suffix="%{%B%}$SPACESHIP_JJ_SUFFIX%{%b%}"

  local expected="$prefix$content$suffix"
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "render mocked jj status" "$expected" "$actual"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/tests/shunit2/shunit2"
