.PHONY: deploy

REGION="us-east-1"
CODE_BUCKET="jkt-serverless-packages"
AWS_PROFILE=$(shell echo $(AWS_LP))

build: template.yaml requirements.txt 
	sam build --skip-pull-image --use-container --region $(REGION) \
	--profile $(AWS_PROFILE) && touch $@

requirements.txt: Pipfile.lock
	pipenv lock -r > $@

package.yaml: build requirements.txt
	sam package --output-template-file $@ --s3-bucket $(CODE_BUCKET)

deploy: package.yaml
	sam deploy --template-file $< --stack-name $(STACK_NAME) \
		--capabilities CAPABILITY_IAM --no-fail-on-empty-changeset \
		--region $(REGION) --profile $(AWS_PROFILE)
