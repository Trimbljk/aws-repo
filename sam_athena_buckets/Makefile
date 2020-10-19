.PHONY: deploy

REGION="us-east-1"
STACKNAME="jkt-stack-operating-buckets"
AWS_PROFILE=$(shell echo $(AWS_LP))

deploy: template.yaml 
	aws cloudformation create-stack --stack-name $(STACKNAME) \
		--template-body file://template.yaml --profile $(AWS_PROFILE) --region $(REGION)


