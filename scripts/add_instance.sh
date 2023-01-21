if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` instance-name | instance-id"
  exit 0
fi

source <(cat config.env | sed -e '/^#/d;/^\s*$/d' -e "s/'/'\\\''/g" -e "s/=\(.*\)/='\1'/g")

INSTANCE_ID=$1

INSTANCE_SUBNET_ID=$(yc compute instance get $INSTANCE_ID | grep subnet | awk '{split($0,a,": "); print a[2]}')

INTERNAL_ADDRESS=$(yc compute instance get $INSTANCE_ID | grep address | awk '{split($0,a,": "); print a[2]} ' | awk 'NR==3')

yc load-balancer target-group add \
    --name $TARGET_GROUP \
    --target subnet-id=$INSTANCE_SUBNET_ID,address=$INTERNAL_ADDRESS
