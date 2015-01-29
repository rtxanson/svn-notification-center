Based partly on https://github.com/amitsnyderman/svn-growl

# Usage

    notify-svn.sh /path/to/repo LABEL

# Installing

Requires [this](https://github.com/alloy/terminal-notifier): 

    brew install terminal-notifier
    brew linkapps terminal-notifier


# crontab

    * * * * * /path/to/notify-svn.sh /path/to/repo USEFUL_LABEL 2>/dev/null

NB: you probably want to specify a nice interval


