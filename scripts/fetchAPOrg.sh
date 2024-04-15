function explainParams {
    echo "How to use the Skript"
    echo "$(tput setaf 3) $ sh scripts/fetchScratchOrg.sh Org-SC-2222 prod nopush"
    echo "$(tput setaf 3)  - 1. Param: new ScratchOrg alias (required)"
    echo "$(tput setaf 3)  - 2. Param: alias of ifm prod environment (required)"
    echo "$(tput setaf 3)  - 3. Param: [nopush] Flag to disable force:source:push (optional)"
    echo "$(tput setaf 3)       If no value is provided the current Branch will be pushed to your ScratchOrg"
}


if [ -z "$1" ]
  then
    echo "No argument for a scratch org alias supplied. Recommended format is <initials of developer>.<User story id>"
    explainParams
    exit 1
fi
if [ -z "$2" ]
  then
    echo "No argument for a dev hub alias supplied. Recommended set sfdx force:config:set defaultdevhubusername=me@myhub.org"
    explainParams
    exit 1
fi

# deprecated command to fetch a pool org / sfpowerscripts addon
#sfdx sfpowerscripts:pool:fetch -a $1 -t empty -v $2 -d

# fetch new org from AP Hub / new npm modul command
sfp pool:fetch -t AP -a $1 -v $2

#push force-app from current branch
#echo "$(tput setaf 200) push metadata"

#sfdx force:source:push -u $1 -f  -w 60


