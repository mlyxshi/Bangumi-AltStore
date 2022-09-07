#!/bin/sh
latestVersion=$(curl --silent "https://api.github.com/repos/czy0729/Bangumi/releases/latest" | jq ."tag_name")
latestIPAUrl=$(curl --silent "https://api.github.com/repos/czy0729/Bangumi/releases/latest"| jq ."assets[].browser_download_url" | grep ipa)
        
date=$(curl --silent "https://api.github.com/repos/czy0729/Bangumi/releases/latest" | jq ."published_at")
size=$(curl --silent --head -L $(echo $latestIPAUrl|tr -d '"') | grep -i content-length | tail -1 | awk '{print $2}' | tr -d '\r')
whatsnew=$(curl --silent "https://api.github.com/repos/czy0729/Bangumi/releases/latest" | jq ."body")

curl --silent https://raw.githubusercontent.com/mlyxshi/Bangumi-AltStore/main/bangumi.json \
| jq ".apps[0].version|=$latestVersion" \
| jq ".apps[0].versionDate|=$date" \
| jq ".apps[0].versionDescription|=$whatsnew" \
| jq ".apps[0].size|=$size" \
| jq ".apps[0].downloadURL|=$latestIPAUrl" > out.json
    
