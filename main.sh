#!/bin/bash
flatref="$1"
repo="flathub"
remotename=""
pkgname=""
while read line ; do
    if [[ "$line" =~ "RuntimeRepo=" ]] ; then
        repo=${line/*=/}
    elif [[ "$line" =~ "SuggestRemoteName=" ]] ; then
        remotename=${line/*=/}
    elif [[ "$line" =~ "Name=" ]] ; then
        pkgname=${line/*=/}
    fi
done < $flatref

if [[ "$pkgname" == "" ]] ; then
    echo "Failed to read flatref. Press any key to exit"
    read -n 1
    exit 1
fi

if flatpak remote-add --user --if-not-exists "$remotename" "$repo" && \
flatpak install --user "$remotename" "$pkgname" ; then
    echo "Installation done. Press any key to exit"
    read -n 1
    exit 0
else
    echo "Installation failed. Press any key to exit"
    read -n 1
    exit 1

fi