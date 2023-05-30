#/bin/bash
echo "Received params $1 and $2"
oc new-project $1
python3 template-replace.py $1 $2
oc create -f hello-rendered.json
oc create -f hello-service-rendered.yaml
oc expose svc/hello-$1-service

