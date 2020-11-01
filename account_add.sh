#!/bin/bash
# This shell script will create amount of Linux login accounts for you.
# 1. check the "account_add.txt" file exists? you must create that file manually.
#    one account name one line in the "account_add.txt" file.
# 2. use openssl to create users password.
# 3. user must change his/her password in his/her first login.

# 0. user input
usergroup=""        # if your account need secondary group, add here.
pwmetch="openssl"   # "openssl" or "account" is needed.
homeperm="no"       # if "yes" then home dir permision will be modified to 711

# 1. check the account_add.txt file
action="${1}"
if [ ! -f account_add.txt ]; then
    echo "There is no account_add.txt file, stop here."
    exit 1
fi
[ "${usergroup}" != "" ] && groupadd -r ${usergroup}
rm -f outputpw.txt
usernames=$(cat account_add.txt)
for username in ${usernames}
do
    case ${action} in 
        "create")
            [ "${usergroup}" != "" ] && usegrp=" -G ${usergroup}" || usegrp=""
            useradd ${usegrp} ${username}
            [ "${pwmetch}" == "openssl" ] && usepw=$(openssl rand -base64 6) || usepw=${username}
            echo ${usepw} | passwd --stdin ${username}
            chage -d 0 ${username}
            [ "${homeperm}" == "yes" ] && chmod 711 /home/${username}
            echo "username=${username}, password=${usepw}" >> outputpw.txt
            ;;
        "delete")
            echo "deleting ${username}"
            userdel -r ${username}
            ;;
        *)
            echo "Usage: $0 [create|delete]"
            ;;
    esac
done
