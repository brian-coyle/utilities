#!/bin/bash

backup_volume=$2
user_dir="/Volumes/Macintosh\ HD/Users/$1"

directories=( "Documents" "Downloads" "Desktop" "Movies" "Music" "Pictures" "Public" )

for directory in "${directories[@]}"
do
  dir_to_copy="$user_dir/$directory"
  tar_destination=$backup_volume/$directory.gz
  tar -czvf "$tar_destination" "$dir_to_copy"
  echo "Copying $dir_to_copy to $tar_destination"
done
