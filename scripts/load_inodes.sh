START=`date +%s`
AVAILABLE_INODES=`df -i /data | awk '{ print $4}' | tail -n1`
while [ $AVAILABLE_INODES -gt 3000 ]
do
    touch /data/${AVAILABLE_INODES}.tmp
    let "AVAILABLE_INODES=AVAILABLE_INODES-1"
done
END=`date +%s`
RUNTIME=$((END-START))
df -i /data
echo "Loaded inodes in $RUNTIME sec"
