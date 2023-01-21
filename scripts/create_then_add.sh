if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` [network-folder] [instance-name]"
  exit 0
fi

source <(cat config.env | sed -e '/^#/d;/^\s*$/d' -e "s/'/'\\\''/g" -e "s/=\(.*\)/='\1'/g")

NETWORK_FOLDER=${1:-"default"}

INSTANCE_NAME=${2:-$(cat /dev/urandom | tr -dc 'a-z' | fold -w 10 | head -n 1)}

./create_instance.sh $NETWORK_FOLDER $INSTANCE_NAME
./add_instance.sh $INSTANCE_NAME
