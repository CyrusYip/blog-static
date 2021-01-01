#!/usr/bin/env python3
import pyperclip
import subprocess

username = "CyrusYip"
repo_name = "blog-static"
branch_name = "main"

github = f"https://raw.githubusercontent.com/{username}/{repo_name}/{branch_name}/"
jsdeliver = f"https://cdn.jsdelivr.net/gh/{username}/{repo_name}/"
purge = f"https://purge.jsdelivr.net/gh/{username}/{repo_name}/"
copy_path = "fzf | tr -d '\n' | xclip -selection c"

def get_url():
    subprocess.call(copy_path, shell=True)
    path = pyperclip.paste()
    print(f"\n![]({github+path})\n")
    print(f"![]({jsdeliver+path})\n")
    print(f"{purge+path}\n")
    pyperclip.copy(f"![]({jsdeliver+path})")

while True:
    if input("Press Enter to continue. Type something else to quit: ") == "":
        get_url()
    else:
        break
