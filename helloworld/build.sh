# TODO . this really should be a Makefile etc or CI pipeline - but lack of time prevents me

ECR_REPO="960049661466.dkr.ecr.eu-west-1.amazonaws.com"
IMG_REPO="brightside/helloworld"
IMG_TAG="2.0-x86"
IMAGE=${ECR_REPO}/${IMG_REPO}:${IMG_TAG}

# for the current profile of "demo"
aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin ${ECR_REPO}

docker build . -t ${IMAGE} 
docker build . -t test:1

docker push ${IMAGE}


 
# test
# docker run -p 5005:5005 ${IMAGE}./h