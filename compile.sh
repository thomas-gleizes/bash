#!/bin/bash sh

str="$1"
filename=""

echo "$str"

log() {
  echo "> $@"
}

if [ -f "$PWD/$str" ]; then
  for L in $(seq 1 ${#str}); do
    char=${str:$L-1:1}

    if [ $char != "." ]; then
      filename="$filename$char"
    else
      break
    fi
  done

  if [ -f "$PWD/$filename" ]; then
    rm $filename
  fi

  gcc -o "$filename" "$str"

  if [ -f "$PWD/$filename" ]; then
    "$PWD"/"$filename"
  fi
  echo ""
else
  log "wrong file path : '$PWD/$str'"
fi
