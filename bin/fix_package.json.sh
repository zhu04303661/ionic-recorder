#!/bin/bash

NLINES="`wc -l package.json | awk '{print $1}'`"
NLINES_MINUS2="`echo $NLINES - 2 | bc`"
TMPFILE=.tmp$RANDOM

head -n $NLINES_MINUS2 package.json > $TMPFILE

cat << EOF >> $TMPFILE
  "description": "ionic-recorder: Ionic2 / WebAudio project",
  "license": "GPL-2.0",
  "repository": {
    "type": "git",
    "url": "https://github.com/tracktunes/ionic-recorder.git"
  },
  "scripts": {
    "start": "ionic serve --browser chromium-browser",
    "test": "gulp --gulpfile test/gulpfile.ts --cwd ./ test"
  }
}
EOF

mv $TMPFILE package.json