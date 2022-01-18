
start-auth:
	docker-compose -f ./docker-compose/authelia.yml -p Plex-HomeMedia up -d
stop-auth:
	docker-compose -f ./docker-compose/authelia.yml -p Plex-HomeMedia down
pull-auth:
	docker-compose -f ./docker-compose/authelia.yml -p Plex-HomeMedia pull