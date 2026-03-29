SHELL := /bin/bash
PHONY :=
COMMAND = openapi-generator-cli
OPENAPI_VERSION ?= v7.19.0

include .env
export

PHONY += build-client
build-client:
	docker container run --rm -v ${PWD}:/app openapitools/openapi-generator-cli:$(OPENAPI_VERSION) \
		generate \
		$(OPENAPI_GENERATE_ARGS) \
		--config /app/$(NAME).config.json \
		--input-spec /app/$(NAME).json \
		--generator-name php \
		--output /app \
		--git-host="$(GIT_HOST)" \
		--git-repo-id="$(GIT_REPO_ID)" \
		--git-user-id="$(GIT_USER_ID)"

.PHONY: $(PHONY)
