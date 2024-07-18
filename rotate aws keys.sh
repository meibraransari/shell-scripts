#!/bin/bash

# rotate ALL users, including yourself
# allUsers=$(aws iam list-users --output text | cut -f 6);

# read from a file, one username per line
# preferably set their username to their email address
allUsers=$(cat ./user-names.txt);

for userName in $allUsers; do

    # get a list of all keys
    userKeys=$(aws iam list-access-keys \
        --user-name $userName \
        --output text | \
        cut -f 2);

    # inactivate, and delete all keys
    for accessKeyId in $userKeys; do
        aws iam update-access-key \
            --access-key-id $accessKeyId \
            --user-name $userName \
            --status Inactive;

        aws iam delete-access-key \
            --access-key-id $accessKeyId \
            --user-name $userName;
    done

    # create new key
    newAccessKey=$(aws iam create-access-key \
        --user-name $userName \
        --output text | \
        cut -f 2,4);
        
    # save the new credentials into a file
    echo "$userName = $newAccessKey" >tee "$userName.txt";

    # email the user their new key
    echo "$userName = $newAccessKey";
    mail -s "New IAM Access-key" $userName < $newAccessKey

done

echo "COMPLETE!"
