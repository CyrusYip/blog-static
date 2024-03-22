#!/usr/bin/env bash

# Get raw file links from current GitHub repository
# Dependencies: fzf and xclip
# This file should be placed at the root of a repository
# Guide (Chinese): https://cyrusyip.org/zh-cn/post/2020/12/05/host-images-on-github/

username="CyrusYip"
repo_name="blog-static"
branch_name="main"

get_url() {
  path=$(fzf)
  github="https://raw.githubusercontent.com/${username}/${repo_name}/${branch_name}/${path}"
  jsdelivr="https://cdn.jsdelivr.net/gh/${username}/${repo_name}/${path}"
  jsdelivr_purge="https://purge.jsdelivr.net/gh/${username}/${repo_name}/${path}"

  # copy all links so I can get them later
  copy_count=0
  echo "$github" | xclip -selection clipboard && copy_count=$((copy_count + 1))
  echo "$jsdelivr_purge" | xclip -selection clipboard && copy_count=$((copy_count + 1))
  echo "$jsdelivr" | xclip -selection clipboard && copy_count=$((copy_count + 1))
  [ $copy_count -eq 3 ] && echo "Links were successively copied."

  echo -e "\nLinks for the file:"
  echo "  $github"
  echo "  $jsdelivr"
  echo "  $jsdelivr_purge"
  echo -e "\nPress Ctrl-C to exit, Enter to contine..."
}

while true; do
  get_url
  read -r
done
