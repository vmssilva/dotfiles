#!/usr/bin/env bash

# shellcheck disable=SC1090
{
  [ -n "${DOTFILES}" ] && {
    filters_path="${DOTFILES}/sources/functions"
    filters=(strings)

    for filter in "${filters[@]}"; do
      [ -f "${filters_path}/${filter}" ] && . "${filters_path}/${filter}"
    done
  }
}
