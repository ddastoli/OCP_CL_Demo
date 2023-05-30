#/bin/env python
import json
import pprint
import sys

cn,lb = sys.argv[1:]
fp = open('hello-template2.json')
js = json.loads(fp.read())
tp = json.dumps(js) % (cn, cn, cn, cn, cn, cn)
fo = open('hello-rendered.json','w')
fo.write(tp)
fo.close()
svc = '''
kind: "Service"
apiVersion: "v1"
metadata:
  name: "hello-%s-service"
  labels:
    demoservice: "yes"
    owner: "ddastoli"
spec:
  selector:
    demoscript: "yes"
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  clusterIP: 172.30.95.%s
  loadBalancerIP: 172.29.155.%s
  type: LoadBalancer
status:
  loadBalancer:
    ingress:
    - ip: 146.148.147.%s
''' % (cn,lb,lb,lb)
fo = open('hello-service-rendered.yaml','w')
fo.write(svc)
fo.close()

