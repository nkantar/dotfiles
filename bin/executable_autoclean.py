#!/usr/bin/env python3


"""
This script cleans up my Desktop and Downloads directories.

It's meant to be run hourly, and takes all files modified more than than 48 hours ago
and stores them into ~/[Desktop|Downloads]/Autoclean/{TIMESTAMP}/, respectively.
"""


from datetime import datetime
from pathlib import Path
import shutil


CUTOFF = 48 * 60 * 60  # 48 hours in seconds
NOW = datetime.now()
TIMESTAMP = NOW.strftime("%Y_%m_%d_%H")
ROOTS = [
    Path("/Users/nik/Desktop"),
    Path("/Users/nik/Downloads"),
]


def main():
    print("Starting...")

    for root in ROOTS:
        print(f"Processing {root}")

        # generate archive root
        archive_root = root / "Autoclean"

        # list everything in Desktop dir
        all_items = list(root.glob("*"))

        # remove hidden and Archive root
        items = [
            item
            for item in all_items
            if not item.name.startswith(".") and item != archive_root
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

                # generate archive dir path
                archive = archive_root / TIMESTAMP

                # ensure archive dir exists
                archive.mkdir(parents=True, exist_ok=True)

                # generate destination path
                destination = archive / item.name

                # move item into archive
                shutil.move(item, destination)

                print("Archived")

            else:
                print("Skipped")

    print("Done.")


if __name__ == "__main__":
    main()
