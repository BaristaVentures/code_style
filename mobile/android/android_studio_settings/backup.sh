#!/usr/bin/env bash
#
# Backup settings and push them to repo
#

PREFIX="-->"
echo "$PREFIX Backing up Barista Ventures IntelliJ configs..."

DATE_TIME=$(date '+%d/%m/%Y %H:%M:%S');
CONFIGS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/configs"
DESTINATION_PATH=$HOME/Library/Preferences/AndroidStudio2.3

if [ -d $DESTINATION_PATH ]; then
    cp -frv $DESTINATION_PATH/codestyles/barista*.xml "$CONFIGS/codestyles"
    cp -frv $DESTINATION_PATH/templates/Barista*.xml "$CONFIGS/templates"
    cp -frv $DESTINATION_PATH/studio.vmoptions "$CONFIGS/studio.vmoptions" 
else
    echo "$PREFIX Looks like you have another version of android studio since
    we didnt find $DESTINATION_PATH folder. Please update the script with your version"
fi

echo "$PREFIX Pushing to repo with commit message 'Backup $DATE_TIME'..."
git add .
git commit -m "Backup $DATE_TIME"
#git push origin master

echo ""
echo "$PREFIX ＼（＾ ＾）／ !"
echo ""