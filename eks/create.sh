eksctl create cluster -f definition.yaml --profile demo

export KUBECONFIG=~/.kube/demo
aws eks update-kubeconfig --region eu-west-1 --name private-eks
