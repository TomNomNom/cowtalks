#!/bin/bash

thoughts=(
  "That was great"
  "That was lovely, that was"
  "Cheers for that"
  "Very informative"
  "Why do you want my opinion? I'm just a cow."
  "My thoughts exactly"
  "Who'd have thought?"
)

IFS=$'\n'
for talk in $(cat talks); do
  clear
  name=$(cut -d';' -f1 <<< "${talk}")
  desc=$(cut -d';' -f2 <<< "${talk}")
  file=$(cut -d';' -f3 <<< "${talk}")
  cowsay "Next up it's ${name} talking about ${desc}"
  read -p ""

  impressive --nologo --duration 5m --auto-auto --auto-progress --autoquit ${file} &> /dev/null

  clear
  cowthink ${thoughts[$RANDOM % ${#thoughts[@]} ]}
  read -p ""
done

clear
cowsay "Now let's all go to the pub!"
read -p ""
