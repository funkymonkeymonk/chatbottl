repo_name := "chatbottl"
project_name := "lita"
project_dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
default: list

# lists all available targets
list:
	@sh -c "$(MAKE) -p no_op__ | \
		awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {split(\$$1,A,/ /);\
		for(i in A)print A[i]}' | \
		grep -v '__\$$' | \
		grep -v 'make\[1\]' | \
		grep -v 'Makefile' | \
		sort"
# required for list
no_op__:

pull:
	@docker pull $(repo_name)/$(project_name) && \
		echo docker pull successful || \
		echo docker pull unsuccessful

build: pull
	@docker build -t $(repo_name)/$(project_name) .

run: build
	@docker run -it -P --rm \
		-h $(project_name) \
		--name $(project_name)_run \
		$(repo_name)/$(project_name)

# test your application (tests in the tests/ directory)
test: build
	bundle install --path vendor/bundle
	bundle exec rspec

term: build
	@docker run -it --rm \
		-h $(project_name) \
		-v $(project_dir):/usr/src/app \
		-v $(HOME):/root \
		--entrypoint=/bin/bash \
		--name $(project_name)_term \
		$(repo_name)/$(project_name) -i

root-term: build
	@docker run -it --rm \
		-h $(project_name) \
		-v $(project_dir):/usr/src/app \
		-v $(HOME):/root \
		--entrypoint=/bin/bash \
		--name $(project_name)_root-term \
		-u="root" \
		$(repo_name)/$(project_name) -i

deliver:
	@docker push $(repo_name)/$(project_name)

docs:
	@cat README.md
