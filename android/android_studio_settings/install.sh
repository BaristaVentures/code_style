#!/usr/bin/env bash
#
# Install settings
#


PREFIX="-->"
CONFIGS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/configs"
DESTINATION_PATH=$HOME/Library/Preferences/AndroidStudio*

echo "$PREFIX Installing Barista Ventures IntelliJ configs..."
if [ -d $DESTINATION_PATH ]; then
    mkdir -p $DESTINATION_PATH/codestyles
    cp -frv "$CONFIGS/codestyles"/barista*.xml $DESTINATION_PATH/codestyles

    mkdir -p $DESTINATION_PATH/templates
    cp -frv "$CONFIGS/templates"/barista*.xml $DESTINATION_PATH/templates

    cp -frv "$CONFIGS/studio.vmoptions" $DESTINATION_PATH
fi

echo "$PREFIX Done."
echo ""
echo "$PREFIX Restart IntelliJ and/or AndroidStudio, go to preferences, and apply 'Barista' or 'BaristaAndroid'."