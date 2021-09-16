#!/bin/bash
# Android Auto Script
 
argumentAPK="$1"
d2j-apk-sign "${argumentAPK}"

IFS='.'
read -ra ADDR <<< "${argumentAPK}"
for i in "${ADDR[@]}"; do
    apkName="$i"
    break
done
IFS=' '     # reset to default

signedApk="${apkName}-signed.apk"

#mkdir "Workspace"
#echo "${signedApk}"
#mv "${signedApk}" ./Workspace

apktool d "${signedApk}"
d2j-dex2jar "${signedApk}"
