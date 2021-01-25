set -x
IID=$1
if [ "${1}" = "" ];then
        echo "User should not be empty" ;
        echo "Please check the user name and try again";
        exit 99 ;
fi


USER_OF_COUNT=$(lsof -u ${IID} | wc -l)


echo "${IID}_`hostname | cut -d"-" -f2`_open_file_count ${USER_OF_COUNT}"  
