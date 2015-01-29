#!/bin/sh

if [ -z $1 ]; then
	echo "USAGE $0 path label"
	exit
fi

NOTIFIER="/Applications/terminal-notifier.app/Contents/MacOS/terminal-notifier"

FILEPATH=`which $0`
LABEL=$2
DIRNAME=`dirname $FILEPATH`

REPO=$1
URL=`svn info $REPO 2>/dev/null | sed -ne 's#^URL: ##p'`
THERE=`svn info $URL 2>/dev/null | sed -ne 's#^Last Changed Rev: ##p'`
HERE=`svn info $REPO 2>/dev/null | sed -ne 's#^Revision: ##p'`
BLAME=`svn info $URL 2>/dev/null | sed -ne 's#^Last Changed Author: ##p'`
MSG=`svn log $REPO -r $THERE 2>/dev/null | tail -n +4 | tr '\n' '  ' | sed 's/\-\-\-*//g'`

# terminal-notifier -title '💰' -message 'Check your Apple stock!' -open 'http://finance.yahoo.com/q?s=AAPL'
if [ $THERE -gt $HERE ] ; then
    echo $MSG
	$NOTIFIER -title "svn: $2" -subtitle "$BLAME: local@$HERE -> remote@$THERE" -message "Log: $MSG"
fi
