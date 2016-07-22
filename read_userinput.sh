#!/bin/bash

echo -e "Hi, please type the word: \c"
read word
echo "The word you entered is: $word"

echo -e "What are your favorite colors ? "
read -a colors
echo "My favorite colors are : ${colors[0]} ${colors[1]} ${colors[2]} :)"
