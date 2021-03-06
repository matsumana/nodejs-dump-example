.PHONY: yarn-install
yarn-install:
	yarn install

.PHONY: clean-build
clean-build:
	yarn clean && yarn fix && yarn lint && yarn build

.PHONY: docker-run-with-bash
docker-run-with-bash:
	docker container run --name nodejs-dump-example --rm -it -p 8080:8080 -v "$(PWD)":/app node:14.17.6-bullseye /bin/bash -c 'cd /app && make run-app'

.PHONY: docker-login-with-bash
docker-login-with-bash:
	docker exec -it $$(docker container ls | grep 'nodejs-dump-exampl[e]' | awk '{print $$1}') /bin/bash

.PHONY: install-gdb
install-gdb:
	apt update && apt install -y gdb

.PHONY: install-llnode
install-llnode:
	apt update && \
	apt install -y liblldb-9 liblldb-9-dev make g++ && \
	ln -s /usr/bin/lldb-9 /usr/bin/lldb && \
	mkdir /llnode && \
	cd /llnode && \
	npm install llnode

.PHONY: run-app
run-app:
	# ref: https://nodejs.org/dist/latest-v14.x/docs/api/report.html
	node --report-uncaught-exception --report-on-signal --report-on-fatalerror ./dist/bundle.js

.PHONY: take-diagnostic-report
take-diagnostic-report:
	# ref: https://nodejs.org/dist/latest-v14.x/docs/api/report.html
	kill -USR2 $$(ps aux | grep './dist/bundle.j[s]' | awk '{print $$2}')

.PHONY: take-heap-dump
take-heap-dump:
	# https://nodejs.org/dist/latest-v14.x/docs/api/v8.html
	kill -USR1 $$(ps aux | grep './dist/bundle.j[s]' | awk '{print $$2}')

.PHONY: take-core-dump
take-core-dump:
	gcore $$(ps aux | grep './dist/bundle.j[s]' | awk '{print $$2}')

.PHONY: load-core-dump-with-llnode
load-core-dump-with-llnode:
	# ref: https://github.com/nodejs/llnode
	cd /llnode && \
	npx llnode $$(which node) -c /app/core.$$(ps aux | grep './dist/bundle.j[s]' | awk '{print $$2}')
