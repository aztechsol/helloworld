super simple basic install of istio.  this is not the way to to it..

Things that are wrong..

*) I would install prometheus seperately with the prometheus-operator
*) I would install kiali seperately with the kiali-operator
*) I would install jaeger seperately with the tracing chart
*) I would create 2 gways one for internal one for external and annotate them correctly eg add cert arns
*) As I would use ALBs not ELBs the instal would be modified to use service type == nodeport 

+ kubectl label namespace default istio-injection=enabled
+ curl -L https://istio.io/downloadIstio | sh -
+ cd istio-1.16.2                                              
+ istioctl install --set profile=demo -y   
+ kubectl apply -f samples/addons     
+ istioctl dashboard kiali 

 