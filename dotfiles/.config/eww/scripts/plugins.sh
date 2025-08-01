#!/usr/bin/env bash

hyprpm list | awk '
  BEGIN { b="start" } 
  {
    if($0~/Plugin \w+/){ b=$3; a[b]=0}; 
      if($0~/enabled: /){ a[b]=$3}
  }
  END { 
    printf "["
    i=0;
    for (key in a) {
      i++; 
      printf "{" 
      printf "\"name\":" "\""key"\", \"value\": " (index(a[key], "true") > 1 ? "true" : "false")
      if (length(a) == i) {
        printf "}"
      }else {
        printf "},"
      }
    }
    printf "]"
  }'
