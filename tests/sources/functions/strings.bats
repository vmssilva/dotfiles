#!/usr/bin/env bats

load "${DOTFILES}/sources/functions/strings"

# --------------------------------------------------
# strlen
# --------------------------------------------------

@test "strlen: Retrieves the total number of characters in the string" {
  local given="John Doe"
  local expected=8

  [ "$(strlen "$given")" -eq "$expected" ]
  [ "$(echo "$given" | strlen)" -eq "$expected" ]
}

@test "strlen: Handles empty string" {
  local given=""
  local expected=0

  [ "$(strlen "$given")" -eq "$expected" ]
  [ "$(echo "$given" | strlen)" -eq "$expected" ]
}

@test "strlen: Handles UTF-8 characters correctly" {
  local given="ação"
  local expected=4

  [ "$(strlen "$given")" -eq "$expected" ]
  [ "$(echo "$given" | strlen)" -eq "$expected" ]
}


# --------------------------------------------------
# strtrim
# --------------------------------------------------

@test "strtrim: Removes leading and trailing spaces" {
  local given="  Hello World  "
  local expected="Hello World"

  [ "$(strtrim "$given")" = "$expected" ]
  [ "$(echo "$given" | strtrim)" = "$expected" ]
}

@test "strtrim: Handles string with only spaces" {
  local given="     "
  local expected=""

  [ "$(strtrim "$given")" = "$expected" ]
}


# --------------------------------------------------
# strstrip
# --------------------------------------------------

@test "strstrip: Removes extra internal spaces and trims edges" {
  local given=" Hello    World   "
  local expected="Hello World"

  [ "$(strstrip "$given")" = "$expected" ]
  [ "$(echo "$given" | strstrip)" = "$expected" ]
}

@test "strstrip: Handles multiple internal space groups" {
  local given="  One   Two     Three  "
  local expected="One Two Three"

  [ "$(strstrip "$given")" = "$expected" ]
}


# --------------------------------------------------
# strupper
# --------------------------------------------------

@test "strupper: Converts ASCII to uppercase" {
  local given="hello world"
  local expected="HELLO WORLD"

  [ "$(strupper "$given")" = "$expected" ]
  [ "$(echo "$given" | strupper)" = "$expected" ]
}

@test "strupper: Converts UTF-8 characters to uppercase" {
  local given="ação"
  local expected="AÇÃO"

  [ "$(strupper "$given")" = "$expected" ]
}


# --------------------------------------------------
# strlower
# --------------------------------------------------

@test "strlower: Converts ASCII to lowercase" {
  local given="HELLO WORLD"
  local expected="hello world"

  [ "$(strlower "$given")" = "$expected" ]
  [ "$(echo "$given" | strlower)" = "$expected" ]
}

@test "strlower: Converts UTF-8 characters to lowercase" {
  local given="AÇÃO"
  local expected="ação"

  [ "$(strlower "$given")" = "$expected" ]
}


# --------------------------------------------------
# strrev
# --------------------------------------------------

@test "strrev: Reverses a string" {
  local given="hello"
  local expected="olleh"

  [ "$(strrev "$given")" = "$expected" ]
  [ "$(echo "$given" | strrev)" = "$expected" ]
}


# --------------------------------------------------
# strrepeat
# --------------------------------------------------

@test "strrepeat: Repeats string N times" {
  local given="abc"
  local count=3
  local expected="abcabcabc"

  [ "$(strrepeat "$count" "$given")" = "$expected" ]
}


# --------------------------------------------------
# strcontains
# --------------------------------------------------

@test "strcontains: Detects substring present" {
  local string="Hello World"
  local substring="World"

  [ "$(strcontains "$string" "$substring")" = "true" ]
}

@test "strcontains: Detects substring absent" {
  local string="Hello World"
  local substring="Foo"

  [ "$(strcontains "$string" "$substring")" = "false" ]
}


# --------------------------------------------------
# strreplace
# --------------------------------------------------

@test "strreplace: Replaces substring" {
  local string="Hello World"
  local search="World"
  local replace="BATS"
  local expected="Hello BATS"

  [ "$(strreplace "$string" "$search" "$replace")" = "$expected" ]
}


# --------------------------------------------------
# strsub
# --------------------------------------------------

@test "strsub: Extract substring by position" {
  local string="Hello World"
  local expected="World"

  [ "$(strsub "$string" 6 5)" = "$expected" ]
}


# --------------------------------------------------
# strpad_right and strpad_left
# --------------------------------------------------

@test "strpad_right: Pads string to the right" {
  local string="Hello"
  local expected="Hello****"

  [ "$(strpad_right "$string" 9 '*')" = "$expected" ]
}

@test "strpad_left: Pads string to the left" {
  local string="Hello"
  local expected="****Hello"

  [ "$(strpad_left "$string" 9 '*')" = "$expected" ]
}


# --------------------------------------------------
# Multi-line behavior
# --------------------------------------------------

@test "strupper: Works with multiple lines via stdin" {
  local given=$'hello\nworld'
  local expected=$'HELLO\nWORLD'

  [ "$(echo "$given" | strupper)" = "$expected" ]
}

@test "strlower: Works with multiple lines via stdin" {
  local given=$'HELLO\nWORLD'
  local expected=$'hello\nworld'

  [ "$(echo "$given" | strlower)" = "$expected" ]
}

