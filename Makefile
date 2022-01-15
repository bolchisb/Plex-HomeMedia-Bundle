include volumes.mk
include env.mk
include router.mk
include install_dependencies.mk

prepare: network-prereqs create-volumes

clean: clean-volumes network-clean

network-prereqs:
	docker network create backend-network --driver bridge

network-clean:
	docker network rm backend-network

start:
	docker-compose up -d
stop:
	docker-compose down
build:
	docker-compose build
pull:
	docker-compose pull

