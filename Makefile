GIT_COMMIT := $(shell git rev-parse --short HEAD)
all:	create_version build tag publish
create_version:
	echo ${GIT_COMMIT} > app_version
build:
	docker build . -t nginx-helloworld:${GIT_COMMIT}
tag:
	docker tag nginx-helloworld:${GIT_COMMIT} mijack/nginx-helloworld:${GIT_COMMIT}
	docker tag nginx-helloworld:${GIT_COMMIT} nginx-helloworld:latest
	docker tag nginx-helloworld:latest mijack/nginx-helloworld:latest
login:
	docker login
publish:
	docker push mijack/nginx-helloworld:latest
	docker push mijack/nginx-helloworld:${GIT_COMMIT}
