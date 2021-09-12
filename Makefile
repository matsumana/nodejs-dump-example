.PHONY: clean-build
clean-build:
	yarn clean && yarn fix && yarn lint && yarn build

.PHONY: docker-run-with-bash
docker-run-with-bash:
	docker container run --rm -it -p 8080:8080 -v "$(PWD)":/app node:12.22.6-bullseye /bin/bash
