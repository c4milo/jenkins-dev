
help: ## Shows this help text
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Builds container image
	docker build -t myjenkins .

run: ## Runs the container
	docker run -p 8080:8080 -p 50000:50000 -v `pwd`/data:/var/jenkins_home myjenkins

.PHONY: build