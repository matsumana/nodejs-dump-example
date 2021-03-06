# Node.js taking dump example

## How to build

```
$ make yarn-install
$ make clean-build
```

## How to run this app with Docker

```
$ make docker-run-with-bash
```

<br>

---

## How to take a diagnostic report

```
$ make docker-login-with-bash

# cd /app
# make take-diagnostic-report
```

## How to take a heap dump

```
$ make docker-login-with-bash

# cd /app
# make take-heap-dump
```

## How to take a core dump then load it with llnode

```
$ make docker-login-with-bash

# cd /app
# make install-gdb
# make install-llnode
# make take-core-dump
# make load-core-dump-with-llnode
```

<br>

---

## References

### Node.js

-   [V8 | Node.js v14.17.6 Documentation](https://nodejs.org/dist/latest-v14.x/docs/api/v8.html)
-   [Diagnostic report | Node.js v14.17.6 Documentation](https://nodejs.org/dist/latest-v14.x/docs/api/report.html)

### llnode

-   [llnode](https://github.com/nodejs/llnode)
