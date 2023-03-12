#!/bin/bash
sudo dnf update -y && sudo dnf upgrade
sleep 3
flatpak update -y
sleep 5 
sudo dnf autoremove && sudo dnf clean all
flatpak uninstall --delete-data
exit
