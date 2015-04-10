#!/bin/sh

apps=(
    1password
    alfred
    bartender
    carbon-copy-cloner
    cleanmymac
    crashplan
    doxie
    dropbox
    fantastical
    firefox
    google-chrome
    hazel
    istat-menus
    iterm2
    silverlight
    skype
    teamviewer
    things
    vagrant
)

brew cask install ${apps[@]} --appdir=/Applications
