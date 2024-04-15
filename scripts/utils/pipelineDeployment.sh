#!/usr/bin/env sh
# Run check-only deployment command only if the generated package contains new or changed metadata
if grep -q '<types>' ./changed-sources/package/package.xml ; then
  echo "Deploying new/changed metadata"
  sfdx force:source:deploy -x "changed-sources/package/package.xml" --testlevel RunLocalTests --verbose -w 300 -u $1 || exit 1
else
  echo "No new or changed metadata to deploy"
fi

# Run check-only destructive deployment command only if the generated package contains destructive metadata
if grep -q '<types>' ./changed-sources/destructiveChanges/destructiveChanges.xml ; then
  echo "❗Deploying destructive metadata"
  sfdx force:mdapi:deploy -d "changed-sources/destructiveChanges" --ignorewarnings --verbose -w 300 -u $1 --apiversion 59.0 || exit 1
else
  echo "No destrutive metadata to deploy"
fi