#!/bin/bash

backup_volume=$2
user_dir="/Volumes/Macintosh\ HD/Users/$1"

directories=( "Documents" "Downloads" "Desktop" "Movies" "Music" "Pictures" "Public" )

for directory in "${directories[@]}"
do
  dir_to_copy="$user_dir/$directory"
  tar_destination=$backup_volume/$directory.gz
  tar cf - "$dir_to_copy" -P | pv -s "$(du -sb "$dir_to_copy" | awk '{print $1}')" | gzip > "$tar_destination"
  echo "Copying $dir_to_copy to $tar_destination"
done
