#!/bin/bash
date=`date +%F`
host=`hostname`

function mail() {
        echo -e "$diff \n\nPlease verify, commit and push necessary changes to Backup repository." |\
        mailx -s "7003 $host High Sensitive File Monitor is Down" \
        's.mohanapiriyan@gmail.com'
        sleep 600
}

function main() {
n=0; while (( n++ < 3 )); do  
        diff=`git diff --exit-code`  
        if [ ! -z "$diff" ]; then  
                mail
       
## Auto-push

        if [ $(git status | grep -E 'modified:|file:' |wc -l) -gt 0 ] ; then

        git commit -a -m "Autoupdate `date +%F-%T`" # date and time for reference

        git push

        fi

        fi
done
}

main # Caling main function

## End 
