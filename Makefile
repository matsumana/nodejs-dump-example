.PHONY: clean-build
clean-build:
	yarn clean && yarn fix && yarn lint && yarn build

.PHONY: docker-run-with-bash
docker-run-with-bash:
	docker container run --name nodejs-dump-example --rm -it -p 8080:8080 -v "$(PWD)":/app node:12.22.6-bullseye /bin/bash

.PHONY: docker-login-with-bash
docker-login-with-bash:
	docker exec -it $$(docker container ls | grep 'nodejs-dump-exampl[e]' | awk '{print $$1}') /bin/bash

.PHONY: install-gdb
install-gdb:
	apt update && apt install -y gdb

.PHONY: run-app
run-app:
	# ref: https://nodejs.org/dist/latest-v14.x/docs/api/report.html
	node --report-on-signal ./dist/bundle.js
