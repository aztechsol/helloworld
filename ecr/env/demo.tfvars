region = "eu-west-1"

tags = {
  "Environment" = "Dev"
  "Github" = "aztechsol-helloworld"
}

ecr_name = [
  "brightside/helloworld",
  "brightside/dotnetapp" # example if we have more 
]

image_tag_mutability = "IMMUTABLE"