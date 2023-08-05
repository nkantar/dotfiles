#!/usr/bin/env python3


"""
This script cleans up my Desktop.

It's meant to be run hourly, and takes all files modified more than than 48 hours ago
and stores them into ~/Desktop/Autoclean/{TIMESTAMP}/.
"""


from datetime import datetime
from pathlib import Path
import shutil


CUTOFF = 48 * 60 * 60  # 48 hours in seconds
NOW = datetime.now()
TIMESTAMP = NOW.strftime("%Y_%m_%d_%H")
DESKTOP = Path("/Users/nik/Desktop")
ARCHIVE_ROOT = DESKTOP / "Autoclean"
ARCHIVE = ARCHIVE_ROOT / TIMESTAMP


def main():
    print("Starting...")

    # list everything in Desktop dir
    all_items = list(DESKTOP.glob("*"))

    # remove hidden and Archive root
    items = [
        item
        for item in all_items
        if not item.name.startswith(".") and item != ARCHIVE_ROOT
    ]

    print(f"Found {len(items)} items")

    # iterate through remaining items
    for item in items:
        print(f"Processing {item}")

        # find item modified date
        modified = datetime.fromtimestamp(item.stat().st_mtime)

        # calculate delta
        delta = NOW - modified

        # if it was modified more than 48 hours ago
        if delta.total_seconds() > CUTOFF:
            print("Archiving")

            # ensure archive dir exists
            ARCHIVE.mkdir(parents=True, exist_ok=True)

            # generate destination path
            destination = ARCHIVE / item.name

            # move item into archive
            shutil.move(item, destination)

            print("Archived")

        else:
            print("Skipped")

    print("Done.")


if __name__ == "__main__":
    main()
