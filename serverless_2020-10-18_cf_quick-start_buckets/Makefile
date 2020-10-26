.PHONY: deploy

REGION="us-east-1"
STACK_NAME="jkt-stack-operating-buckets"
AWS_PROFILE=$(shell echo $(AWS_LP))

deploy: template.yaml 
	aws cloudformation create-stack --stack-name $(STACK_NAME) \
		--template-body file://template.yaml --profile $(AWS_PROFILE) --region $(REGION)

delete-stack: 
	aws cloudformation delete-stack --stack-name $(STACK_NAME) \
	--profile $(AWS_PROFILE) --region $(REGION)


