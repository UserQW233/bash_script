#!/bin/bash
sudo dnf autoremove && sudo dnf clean all
flatpak uninstall --delete-data
exit
