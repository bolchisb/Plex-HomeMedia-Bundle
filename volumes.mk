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
		${TRAEFIK_VOLUME}

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

remove-volumes:
	docker volume rm \
		overseerr-data \
		prowlarr-data \
		tautulli-data \
		jackett-data \
		sonarr-data \
		radarr-data \
		transmission-data \
		downloads \
		plex-tvshows \
		plex-movies \
		traefik-data

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
		${TRAEFIK_VOLUME}