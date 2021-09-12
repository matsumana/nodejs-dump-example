# Node.js taking dump example

## How to build

```
$ make yarn-install
$ make clean-build
```

## How to run this app with Docker

```
$ make docker-run-with-bash

# cd /app
# make run-app
```

## How to setup a Docker container

```
$ make docker-login-with-bash

# cd /app
# make install-gdb
# make install-llnode
```

## How to take dumps

```
$ make docker-login-with-bash

# cd /app
# make take-diagnostic-report
# make take-heap-dump
```

## How to take a core dump then load it with llnode

```
$ make docker-login-with-bash

# cd /app
# make take-core-dump
# make load-core-dump-with-llnode
```
