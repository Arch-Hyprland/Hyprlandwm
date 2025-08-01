#!/usr/bin/env bash

ls -l "$HOME/codelib/notes" | awk '{print $9}' | awk '
{
  if($0 !=""){
    a[$0]="~/codelib/notes/"$0
  }
}
END {
  printf "["
  i=0;
  for (key in a) {
    i++
    printf "{"
    printf "\"name\": \""key"\", \"path\": \""a[key]"\""
    if (length(a) == i) {
      printf "}"
    }else {
      printf "},"
    }
  }
  printf "]"
}'
