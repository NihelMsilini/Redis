echo "update"
sudo apt-get update -y > /dev/null 2>&1
echo "upgrade"
sudo apt-get upgrade -y  > /dev/null 2>&1
echo "redis server installation"
sudo apt-get -y install -y redis-server > /dev/null 2>&1
echo "Server status"
sudo service redis-server status
echo "Server start"
sudo service redis-server restart
#Adding data to table
echo "data insertion from a yaml file in the Redis database...."
FILE=`cat r.yml`
tab=( $( awk -F ":" '{print $1}' r.yml) ) 
tab2=( $( awk -F ":" '{print $2}' r.yml) )
chaine="SET profiles:N \""
length=${#tab[@]}
i=0
while [ "$i" -lt "$(($length -1))" ]
    do
        chaine="$chaine ${tab[$i]}: ${tab2[$i]},"
        ((i++))
    done
chaine="$chaine ${tab[$i]}: ${tab2[$i]} \""
echo "$chaine"
echo "$chaine "  | redis-cli
echo "data display from the redis database...\n"
echo "GET profiles:N " | redis-cli

