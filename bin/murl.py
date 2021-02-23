#!/usr/bin/env python3


import re
import subprocess
import sys
from urllib.request import urlopen


def parse_title(url):
    page = urlopen(url).read().decode()
    title_regex = re.compile("<title>(.*?)</title>")
    result = re.search(title_regex, page)
    title = result.groups()[0]
    return title


def generate_md(url, title):
    md = f'[TODO]({url} "{title}")'
    return md


def main(url):
    title = parse_title(url)
    md = generate_md(url, title)
    return md


if __name__ == "__main__":
    md = main(sys.argv[1])
    subprocess.run("pbcopy", universal_newlines=True, input=md)
    print(f"Copied to clipboard: {md}")
