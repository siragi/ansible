#!/bin/sh
usage() {
	echo "usage: bump-version <version-id>"
}

if [ $# -ne 1 ]; then
	usage
	exit 1
fi

if ! sed 's/^VERSION=.*$/VERSION='$1'/g' version > .version.new; then
	echo "Could not replace VERSION variable." >&2
	exit 2
fi

mv .version.new version
git add version
git commit -m "Bumped version number to $1" version
