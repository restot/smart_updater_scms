# echo "hi $1 ..."

#timenow=`date +%s`
timenow=`date` #macos
#human_time_now=`date -d @$timenow`

# echo $human_time_now

git add .
git commit -m "$1 $timenow"
read -p "Press enter to continue"
