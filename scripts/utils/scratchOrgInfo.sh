if [ -z "$1" ]
  then
    echo "No argument for a dev hub alias supplied. Recommended set sfdx force:config:set defaultdevhubusername=me@myhub.org"
    exit 1
fi

sfdx force:data:soql:query -q "SELECT Pooltag__c, Allocation_status__c, LastModifiedBy.FirstName, ExpirationDate, CreatedDate, Id from ScratchOrgInfo where Status = 'Active' order by CreatedDate" -u $1