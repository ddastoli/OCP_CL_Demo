#/bin/bash
echo "Received params $1"
#oc login dom cisco
oc delete project $1
ansible-playbook -i ansible-hosts.ini aci-delete-epg.yaml --extra-vars "epgName=$1"
#python template-replace.py $1 $2
