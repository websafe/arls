#!/bin/bash

touch test-empty-file.txt

echo "non-empty file" > test-nonempty-file.txt

echo "File with white space" > "test-file with whitespace.txt"

echo "File with tab" > "test-file with 	tab.txt"

rm -rf "test-symlink-to-a-file.txt"

ln -s "test-nonempty-file.txt" "test-symlink-to-a-file.txt"
