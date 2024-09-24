#!/bin/bash
#
#########################
# Author: Adnan Asif
# Date: 18 Sept 2024
#
# Version: v1
#
#
# This script will report the AWS resource usage
# ########################
#
#
#  AWS S3
#  AWS EC2
#  AWS lambda
#  AWS IAM Users
#
# List s3 buckets
echo "s3 buckets lists"
aws s3 ls

# list EC2 Instances
echo "ec2 instances ids and names"
aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId, Tags[?Key=='Name'].Value | [0]]" --output table

# list lambda
echo "List of lambda functions"
aws lambda list-functions --query "Functions[*].FunctionName" --output table

# list IAM users
echo "IAM users list"
aws iam list-users --query "Users[*].[UserName, CreateDate, PasswordLastUsed]" --output table
