create-volumes-prereqs:
	sudo mkdir -p ${OVERSEER_VOLUME} \
		${TAUTULLI_VOLUME} \
		${SONARR_VOLUME} \
		${RADARR_VOLUME} \
		${TRANSMISSION_VOLUME} \
		${JACKET_VOLUME} \
		${PROWLARR_VOLUME} \
		${PLEX_TVSHOWS_VOLUME} \
		${PLEX_MOVIES_VOLUME} \
		${DOWNLOADS} \
		${TRAEFIK_VOLUME} \
		${PSQL_VOLUME}

create-traefik-data:
	sudo mkdir -p ${TRAEFIK_VOLUME}/acme \
		${TRAEFIK_VOLUME}/rules

	sudo touch ${TRAEFIK_VOLUME}/acme/acme.json

	sudo chmod -R 0600 ${TRAEFIK_VOLUME}/acme/acme.json

create-volumes: create-volumes-prereqs create-traefik-data
	docker volume create \
		--name=overseerr-data \
		--opt type=none \
		--opt device=${OVERSEER_VOLUME} \
		--opt o=bind,rw

	docker volume create \
		--name=tautulli-data \
		--opt type=none \
		--opt device=${TAUTULLI_VOLUME} \
		--opt o=bind,rw

	docker volume create \
		--name=sonarr-data \
		--opt type=none \
		--opt device=${SONARR_VOLUME} \
		--opt o=bind,rw

	docker volume create \
		--name=radarr-data \
		--opt type=none \
		--opt device=${RADARR_VOLUME} \
		--opt o=bind,rw

	docker volume create \
		--name=transmission-data \
		--opt type=none \
		--opt device=${TRANSMISSION_VOLUME} \
		--opt o=bind,rw

	docker volume create \
		--name=jackett-data \
		--opt type=none \
		--opt device=${JACKET_VOLUME} \
		--opt o=bind,rw

	docker volume create \
		--name=prowlarr-data \
		--opt type=none \
		--opt device=${PROWLARR_VOLUME} \
		--opt o=bind,rw

	docker volume create \
		--name=plex-tvshows \
		--opt type=none \
		--opt device=${PLEX_TVSHOWS_VOLUME} \
		--opt o=bind,rw

	docker volume create \
		--name=plex-movies \
		--opt type=none \
		--opt device=${PLEX_MOVIES_VOLUME} \
		--opt o=bind,rw

	docker volume create \
		--name=downloads \
		--opt type=none \
		--opt device=${DOWNLOADS} \
		--opt o=bind,rw

	docker volume create \
		--name=traefik-data \
		--opt type=none \
		--opt device=${TRAEFIK_VOLUME} \
		--opt o=bind,rw
	
	docker volume create \
		--name=psql-data \
		--opt type=none \
		--opt device=${PSQL_VOLUME} \
		--opt o=bind,rw

remove-volumes:
	@if [ $$(docker volume ls | awk '{print $$2}' | grep overseerr-data) ]; then \
		docker volume rm overseerr-data; \
		echo "Docker volume overseerr-data removed"; \
	fi

	@if [ $$(docker volume ls | awk '{print $$2}' | grep prowlarr-data) ]; then \
		docker volume rm prowlarr-data; \
		echo "Docker volume prowlarr-data removed"; \
	fi

	@if [ $$(docker volume ls | awk '{print $$2}' | grep tautulli-data) ]; then \
		docker volume rm tautulli-data; \
		echo "Docker volume tautulli-data removed"; \
	fi

	@if [ $$(docker volume ls | awk '{print $$2}' | grep jackett-data) ]; then \
		docker volume rm jackett-data; \
		echo "Docker volume jackett-data removed"; \
	fi

	@if [ $$(docker volume ls | awk '{print $$2}' | grep sonarr-data) ]; then \
		docker volume rm sonarr-data; \
		echo "Docker volume sonarr-data removed"; \
	fi

	@if [ $$(docker volume ls | awk '{print $$2}' | grep radarr-data) ]; then \
		docker volume rm radarr-data; \
		echo "Docker volume radarr-data removed"; \
	fi

	@if [ $$(docker volume ls | awk '{print $$2}' | grep transmission-data) ]; then \
		docker volume rm transmission-data; \
		echo "Docker volume transmission-data removed"; \
	fi

	@if [ $$(docker volume ls | awk '{print $$2}' | grep downloads-data) ]; then \
		docker volume rm downloads-data; \
		echo "Docker volume downloads-data removed"; \
	fi

	@if [ $$(docker volume ls | awk '{print $$2}' | grep plex-tvshows) ]; then \
		docker volume rm plex-tvshows; \
		echo "Docker volume plex-tvshows removed"; \
	fi

	@if [ $$(docker volume ls | awk '{print $$2}' | grep plex-movies) ]; then \
		docker volume rm plex-movies; \
		echo "Docker volume plex-movies"; \
	fi

	@if [ $$(docker volume ls | awk '{print $$2}' | grep traefik-data) ]; then \
		docker volume rm traefik-data; \
		echo "Docker volume traefik-data removed"; \
	fi

	@if [ $$(docker volume ls | awk '{print $$2}' | grep psql-data) ]; then \
		docker volume rm psql-data; \
		echo "Docker volume psql-data removed"; \
	fi

clean-volumes: remove-volumes
	sudo rm -rf ${OVERSEER_VOLUME} \
		${TAUTULLI_VOLUME} \
		${SONARR_VOLUME} \
		${RADARR_VOLUME} \
		${TRANSMISSION_VOLUME} \
		${JACKET_VOLUME} \
		${PROWLARR_VOLUME} \
		${PLEX_TVSHOWS_VOLUME} \
		${PLEX_MOVIES_VOLUME} \
		${DOWNLOADS} \
		${TRAEFIK_VOLUME} \
		${PSQL_VOLUME}