#!/usr/bin/env bash

#------------------------------------------------------------------------------
# @file
# Defines function: lib::str_repeat().
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# @function
# Repeats a string.
#
# @param string $input
#   The string to be repeated.
# @param int $multiplier
#   Number of times the string will be repeated.
#
# @return string $result
#   The repeated string.
#------------------------------------------------------------------------------
lib::str_repeat() {
  lib::validate_arg_count "$#" 2 2 || return 1
  declare -r input="$1"
  declare -r multiplier="$2"
  declare result

  if ! lib::is_integer "${multiplier}"; then
    lib::err "Error: \$multiplier is not a positive integer."
    return 1
  fi

  # Create a string of spaces that is $multiplier long.
  result=$(printf "%${multiplier}s")
  # Replace each space with the $input.
  result=${result// /"${input}"}

  printf "%s" "${result}"
}
