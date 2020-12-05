#!/usr/bin/env python3
import pyperclip
import subprocess

github = "https://raw.githubusercontent.com/CyrusYip/blog-static/main/"
jsdeliver = "https://cdn.jsdelivr.net/gh/CyrusYip/blog-static/"
copy_path = "fzf | tr -d '\n' | xclip -selection c"

def get_url():
    subprocess.call(copy_path, shell=True)
    path = pyperclip.paste()
    print(f"\n![]({github+path})\n")
    print(f"![]({jsdeliver+path})\n")
    pyperclip.copy(f"![]({jsdeliver+path})")

while True:
    if input("Press Enter to continue. Type something else to quit. ") == "":
        get_url()
    else:
        break
