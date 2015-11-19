#!/bin/bash

# Reference: `https://github.com/Valloric/YouCompleteMe#full-installation-guide`

# Step 1: Ensure you have vim with version >= 7.3.598 & has python2 support.
  # Just type `vim --version`
# Step 2: Install ycm with vundle
  # Add `Plugin 'Valloric/YouCompleteMe'` to your vimrc or bundle file.
# Step 3: Download & install `clang` or `libclang` (should be 3.3 or higher)
  # It's `clang` on ArchLinux, and `libclang` elsewhere.
  # Just type `clang --version`
  # and perhaps, `llvm`? (I think `clang` will suffice for me...)
# go to '~/builds/ycm'
cd $HOME/builds/ycm-build/

# You may or may not want to delete everything in '$HOME/builds/ycm-build/'
promptDelete()
{
  echo "Do you want to remove everything in this directory? ($PWD)"
  echo "  choices are: 'yes', 'no', 'ls'"
  read RES

  case $RES in
    yes | y)
      rm -rfv
      ;;
    no | n)
      echo "you chose no"
      ;;
    ls)
      echo "you chose ls"
      ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F
      ;;
  esac
}

promptDelete

# Step 4: Generate a Makefile while using the system-provided `clang` library
cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp

# compile support libraries for YouCompleteMe
make ycm_support_libs

# now, just wait for it to build...
