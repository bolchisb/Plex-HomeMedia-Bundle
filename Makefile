include volumes.mk
include env.mk
include router.mk
include install_dependencies.mk
include auth.mk
include common.mk

prepare: network-prereqs create-volumes

clean: clean-volumes network-clean

network-prereqs:
	@if [ ! $$(docker network ls | awk '{print $$2}' | grep backend-network) ]; then \
		docker network create backend-network --driver bridge; \
		echo "Docker network  backend-network created"; \
	fi

network-clean:
	@if [ $$(docker network ls | awk '{print $$2}' | grep backend-network) ]; then \
		docker network rm backend-network; \
		echo "Docker network  backend-network removed"; \
	fi

start-media:
	docker-compose -f ./docker-compose/mediarr.yml -p Plex-HomeMedia up -d
stop-media:
	docker-compose -f ./docker-compose/mediarr.yml -p Plex-HomeMedia down
build-media:
	docker-compose -f ./docker-compose/mediarr.yml -p Plex-HomeMedia build
pull-media:
	docker-compose -f ./docker-compose/mediarr.yml -p Plex-HomeMedia pull


start: start-media start-router start-auth
stop: stop-media stop-router stop-auth
build: build-media
pull: pull-media pull-router pull-auth
