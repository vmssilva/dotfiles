#!/usr/bin/env bash

## @description Display all configured aliases grouped by file with descriptions and notes in a colorized, readable format
main() {

  # Check DOTFILES
  [ -z "$DOTFILES" ] && {
    echo -e "\e[31m[ERROR]\e[0m DOTFILES variable is not set."
    return 1
  }

  local dir file_count
  dir="${DOTFILES}/sources/aliases"

  # Check directory
  [ ! -d "$dir" ] && {
    echo -e "\e[31m[ERROR]\e[0m Aliases directory not found: $dir"
    return 1
  }

  # Count files
  file_count=$(find "$dir" -maxdepth 1 -type f | wc -l)

  # Iterate over files
  while IFS= read -r file; do
    local filename
    filename=$(basename "$file")

    # Print file header in bold cyan
    echo -e "\n\e[1;36m${filename^}:\e[0m"

    awk -v GREEN='\033[32m' -v BLUE='\033[34m' -v YELLOW='\033[33m' -v RESET='\033[0m' '
      # Capture description
      /^## @description/ { desc = substr($0, 17); next }

      # Capture note
      /^## @note/ { note = substr($0, 10); next }

      # Match alias
      /^alias / {
        name = $2
        sub(/=.*/, "", name)

        if (desc == "") { desc = "No description found" }

        # Format output
        if (name != "") {
          if (note != "") {
            printf "  - %s%-15s%s - %s%s%s [Note: %s%s%s]\n", GREEN, name, RESET, BLUE, desc, RESET, YELLOW, note, RESET
          } else {
            printf "  - %s%-15s%s - %s%s%s\n", GREEN, name, RESET, BLUE, desc, RESET
          }
        }

        desc = ""
        note = ""
      }
    ' "$file" | sort

    ((file_count--))
    [ "$file_count" -gt 0 ] && echo

  done < <(find "$dir" -maxdepth 1 -type f | sort)

}

main

