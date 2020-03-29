#!/bin/bash
echo $1, $2
if [ $1 = 'create' ]
then
    aws cloudformation\
        create-stack \
        --stack-name $2\
        --template-body file:\/\/$3 \
        --parameters file:\/\/$4 --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-west-2
elif [ $1 = 'update' ]
then
    aws cloudformation\
        update-stack\
        --stack-name $2\
        --template-body file:\/\/$3 \
        --parameters file:\/\/$4 --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-west-2
elif [ $1 = 'delete' ]
then
    aws cloudformation delete-stack --stack-name $2
else
    echo "Nothing to do"
fi
