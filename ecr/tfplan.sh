case $1 in
    demo)     env="demo";;
    *) echo "usage $0 { demo }"
       exit 1 ;;
esac

 # swap to workspace
terraform workspace select $env

# generate a plan
terraform plan -var-file ./env/$env.tfvars -out tfplan 

echo "generated with [terraform show -no-color tfplan]" > tfplan.txt && terraform show -no-color tfplan >> tfplan.txt
