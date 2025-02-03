#!/bin/bash

usage() {
  echo "Usage $0 [OPTIONS]"
  echo "Monkeybox a little freinsly tool to keep linux configured just the way monkey likes."
  echo " -h, --help"
  echo " -i, --install Installs the monkemacs environment."
  echo " -u, --update Unly updates the environment with the current files."
  echo " -v, --verbose Make the helper yap a lot."
}

has_argument() {
  [[ ("$1" == *=* && -n ${1#*=}) || (! -z "$2" && "$2" != -*) ]]
}

extract_argument() {
  echo "${2:-${1#*=}}"
}

handle_options() {
  while [ $# -gt 0 ]; do
    case $1 in
    -h | --help)
      usage
      exit 0
      ;;
    -v | --verbose)
      verbose_mode=true
      ;;
    -i | --install)
      install=true
      ;;
    -u | --update)
      update=true
      ;;
    esac
    shift
  done
}

handle_options "$@"

if [ "$verbose_mode" = true ]; then
  echo "Verbose mode enabled."
  exit 1
fi

if [ "$update" = true ]; then
  ln ~/.monkeybox/.zshrc ~
fi

if [ "$install" = true ]; then
  sudo pacman -S nvim zsh emacs-wayland
  sudo pacman -Rs vim
  exit 1
fi
