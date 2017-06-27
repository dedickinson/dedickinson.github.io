#!/bin/bash -xe

rm -rf output
jbake --reset --bake
git clone git@github.com:dedickinson/dedickinson.github.io.git publish
cp -r output/* publish/
cd publish
git add -A
git commit -a -m 'publish'
git push
cd -
rm -rf publish