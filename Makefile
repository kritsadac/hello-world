GIT_COMMIT := $(shell git rev-parse --short HEAD)
all:	create_version build tag publish
create_version:
	echo ${GIT_COMMIT} > app_version
build:
	docker build . -t nginx-helloworld:${GIT_COMMIT}
tag:
	docker tag nginx-helloworld:${GIT_COMMIT} kritsadadocker/nginx-helloworld:${GIT_COMMIT}
	docker tag nginx-helloworld:${GIT_COMMIT} nginx-helloworld:latest
	docker tag nginx-helloworld:latest kritsadadocker/nginx-helloworld:latest
login:
	docker login
publish:
	docker push kritsadadocker/nginx-helloworld:latest
	docker push kritsadadocker/nginx-helloworld:${GIT_COMMIT}
