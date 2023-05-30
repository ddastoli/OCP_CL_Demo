#/bin/bash
echo "Received params $1 and $2"
ansible-playbook -i ansible-hosts.ini aci-create-epg.yaml --extra-vars "epgName=$1"
oc login dom cisco
oc new-project $1
oc annotate namespace $1 opflex.cisco.com/endpoint-group='{"tenant":"openshift462","app-profile":"annotated","name":"'$1'"}'
python3 template-replace.py $1 $2
oc create -f hello-rendered.json
oc create -f hello-service-rendered.yaml
oc expose svc/hello-$1-service

