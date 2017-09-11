#!/bin/bash

KEY_BASE=/root/.ssh
KEY_FILE=$KEY_BASE/outrigger.key

# First check to see if a volume mounted keyfile with a specific name exists.
# If the source on a bind mount does not exist it will be created as an empty directory.
if [ -e $KEY_FILE ] && [ ! -d $KEY_FILE ]
then

  echo "KEY_FILE found. Setting up key..."

else

  echo "##############################################################"
  echo "Outrigger Private Key was not set. You will not be able to  "
  echo "clone private repositories. "
  echo " "
  echo "You can import a private key by volume mounting a key at "
  echo " "
  echo " $KEY_FILE"
  echo " "
  echo "##############################################################"
  exit  

fi

# Determine the proper name for the file based on key type
KEY_DATA="$(cat $KEY_FILE)"
if [[ "$KEY_DATA" =~ "BEGIN DSA" ]]; then
  PRIVATE_KEY="$KEY_BASE/id_dsa"
elif [[ "$KEY_DATA" =~ "BEGIN RSA" ]]; then
  PRIVATE_KEY="$KEY_BASE/id_rsa"
fi

# Create the key file with the proper permissions
cp $KEY_FILE $PRIVATE_KEY
chown root:root $PRIVATE_KEY
chmod 600 $PRIVATE_KEY

# Make sure that commands don't need to prompt for host keys
ssh-keyscan -H bitbucket.org 2>/dev/null >> $KEY_BASE/known_hosts
ssh-keyscan -H github.com 2>/dev/null >> $KEY_BASE/known_hosts
