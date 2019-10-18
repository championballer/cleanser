#!/bin/sh

COLOR_GREEN="\033[1;32m"
COLOR_BLUE="\033[0;34m"
COLOR_RED="\033[1;31m"
COLOR_NONE='\033[0m'
COUNT_TRASH_FOLDERS_FOUND=$(find "$HOME" -iname trash \
                                         -type d \
                                         2> /dev/null | \
                                         wc -l)

_print_directories_found () {
  printf "${COLOR_RED}ATTENTION! $COUNT_TRASH_FOLDERS_FOUND folders found:${COLOR_NONE}\n\n"
  local option=1
  for i in $(find "$HOME" -iname trash -type d 2> /dev/null); do
    printf "${COLOR_GREEN}[$option]${COLOR_NONE} - ${COLOR_BLUE}$i${COLOR_NONE}\n"
    option=$(($option+1))
  done
  printf "\n"
}

_remove_files_specific_directory_selected () {
  find "$HOME" -iname trash \
               -type d \
               2> /dev/null |\
               sed "$1!d" |\
               xargs rm -rf 1> /dev/null 2>&1
}

_remove_files_only_directory () {
  find "$HOME" -iname trash \
               -type d \
               2> /dev/null |\
               xargs rm -rf 1> /dev/null 2>&1
}

if [ $COUNT_TRASH_FOLDERS_FOUND -gt 1 ]; then
  _print_directories_found
  read -p "Type the number of the correct Trash folder: " folder_number
  _remove_files_specific_directory_selected $folder_number
else
  _remove_files_only_directory
fi
