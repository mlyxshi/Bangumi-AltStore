#!/bin/sh
latestVersion=$(curl --silent "https://api.github.com/repos/czy0729/Bangumi/releases/latest" | jq ."tag_name" | tr -d '"')
latestIPAUrl=$(curl --silent "https://api.github.com/repos/czy0729/Bangumi/releases/latest"| jq ."assets[].browser_download_url" | grep ipa | tr -d '"')
        

date=$(curl --silent "https://api.github.com/repos/czy0729/Bangumi/releases/latest" | jq ."published_at" | tr -d '"')
size=$(curl --silent --head -L "$latestIPAUrl" | grep -i content-length | tail -1 | awk '{print $2}' | tr -d '\r')
whatsnew=$(curl --silent "https://api.github.com/repos/czy0729/Bangumi/releases/latest" | jq ."body")

jq --null-input \
  --arg latestVersion $latestVersion \
  --arg latestIPAUrl $latestIPAUrl  \
  --arg date $date  \
  --argjson size $size \
  '{ "name": "Bangumi Repo", "identifier": "czy0729.bangumi.AltSource", "apps": [{ "beta": false, "name": "Bangumi", "bundleIdentifier": "tv.bangumi.czy0729", "developerName": "czy0729", "subtitle": "Bangumi", "version": $latestVersion, "versionDate": $date, "versionDescription": "tmp", "downloadURL": $latestIPAUrl, "localizedDescription": "An unofficial https://bgm.tv app client for Android and iOS, built with React Native", "iconURL": "https://raw.githubusercontent.com/czy0729/Bangumi/master/src/assets/images/icon.png", "tintColor": "9b54fd", "size": $size, "screenshotURLs": ["https://user-images.githubusercontent.com/13514316/171143439-5e9c6c22-889d-4774-8c66-4316294d5019.png"] }] }' \
  >  bangumi.json

cat bangumi.json| jq  ".apps[0].versionDescription|=$whatsnew" > out.json
    
