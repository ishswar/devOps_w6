#!/bin/bash
#https://github.com/ishswar/devOps_w1

set +x 

# Print usage information 
usage()
{
cat << EOF
In order to run this script you need to pass parameter (in format shown below)

usage: $0 jessie:<tag>
 
EOF
}

# if no parameters were passed we exit the code after printing usage
if [[ $# -eq 0 ]] ; then
    echo 'No parameters were passed'
    printf "\n"
    usage
    exit 0
fi

# We expect input to have format like jessie:<tag> if not we fail
if [[ "$1" =~ jessie\:\W* ]]; then
echo "Building image with tag $1"
else
    usage
    exit 0
fi

set -x

# Create a dir to hold docker context 
rm -rf n5 
mkdir n5

cd n5 

cat << EOF

"##########################################"
"Downloading Docker Build file FOR Jessie "
"##########################################"

EOF

wget https://raw.githubusercontent.com/docker-library/python/cf179e4a7b442b29d85f521c2b172b89ef04beef/3.6/jessie/Dockerfile


cat << EOF

"############################################"
"Done downloading Docker Build file FOR Jessie "
"############################################"

EOF

ls -la 

cat << EOF

"##########################################"
"Deleting Old Docker Jessie image "
"##########################################"

EOF

set +x

# If old jessie image is ound we delte it 

dockerimages=$(docker images)

echo "$dockerimages"

if [[ $dockerimages == *"jessie"* ]]; then
  echo ""
  echo "Deleting jessie docker image"
  docker rmi jessie
else 
  echo "No jessie image found so no need to delte it ..."
fi

cat << EOF

"##########################################"
"Building Docker image FOR Jessie "
"##########################################"

EOF

set -x

# Build a docker image from current build context ( Dockerfile in current directory)
docker build -t $1 . 

set +x

dockerimages=$(docker images)

if [[ $dockerimages == *"jessie"* ]]; then
cat << EOF

"##########################################"
"Docker build for jessie was sucessfull"
"##########################################"

EOF
docker images 
else 
cat << EOF

"??????????????????????????????????????????"
"Building Build for jessie failed check script output "
"??????????????????????????????????????????"

EOF
  exit 0
fi



cat << EOF

"##########################################"
"Running Docker container FOR Jessie image"
"##########################################"

EOF

set -x

# Just print python verion and exite ( Run jessie container)
docker run --rm -it $1 python -V

