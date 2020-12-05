#!/usr/bin/env python3
import pyperclip
github = "https://raw.githubusercontent.com/CyrusYip/blog-static/main/"
jsdeliver = "https://cdn.jsdelivr.net/gh/CyrusYip/blog-static/"
while True:
    path = input("Enter file path:")
    print(f"\n![]({github+path})\n")
    print(f"![]({jsdeliver+path})\n")
    pyperclip.copy(f"![]({jsdeliver+path})")
