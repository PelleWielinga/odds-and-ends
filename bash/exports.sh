#!/bin/bash

if [ -d "$HOME/bin" ] ; then
  export PATH="$HOME/bin:$PATH"
fi

if [ -d "$DOTFILES_DIR/bin" ] ; then
  export PATH="$DOTFILES_DIR/bin:$PATH"
fi

for tool in $(ls "$HOME/tools")
do
  if [[ -d "$HOME/tools/$tool/bin" ]]; then
    export PATH="$PATH:$HOME/tools/$tool/bin"
  fi
done

if [ -d "$HOME/tools/android" ] ; then
  export ANDROID_HOME="$HOME/tools/android"
fi

if [ -d "$HOME/tools/java" ] ; then
  export JAVA_HOME="$HOME/tools/java"

  # Add java in front of path to make sure it comes before the default java
  export PATH="$HOME/tools/java/bin:$PATH"
fi
