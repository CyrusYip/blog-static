#!/usr/bin/env sh

# Get raw file links from current GitHub repository
# Dependencies: fzf and xclip
# This file should be placed at the root of a repository

username="CyrusYip"
repo_name="blog-static"
branch_name="main"

get_url() {
  path=$(fzf)
  github="https://raw.githubusercontent.com/${username}/${repo_name}/${branch_name}/${path}"
  jsdelivr="https://cdn.jsdelivr.net/gh/${username}/${repo_name}/${path}"
  jsdelivr_purge="https://purge.jsdelivr.net/gh/${username}/${repo_name}/${path}"
  echo "$github" | xclip -selection clipboard # copy all links so I can get them later
  echo "$jsdelivr_purge" | xclip -selection clipboard 
  echo "$jsdelivr" | xclip -selection clipboard
  echo "Links for the file:"
  echo "  $github"
  echo "  $jsdelivr"
  echo "  $jsdelivr_purge"
  echo -e "\nPress Ctrl-C to exit, Enter to contine..." 
}

while true; do
  get_url
  read -r
done
