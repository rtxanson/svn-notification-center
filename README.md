Based partly on https://github.com/amitsnyderman/svn-growl

# Usage

    notify-svn.sh /path/to/repo LABEL

# Installing

Requires [this](https://github.com/alloy/terminal-notifier): 

    brew install terminal-notifier
    brew linkapps terminal-notifier


# crontab

Fire up crontab in your editor, then add the following lines.

    crontab -e

Run every minute, always.

    * * * * * /path/to/notify-svn.sh /path/to/repo USEFUL_LABEL 2>/dev/null

Or, run every 15 minutes:

    */15 * * * * /path/to/notify-svn.sh /path/to/repo USEFUL_LABEL 2>/dev/null

