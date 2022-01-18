
start-router:
	docker-compose -f ./docker-compose/router.yml -p Plex-HomeMedia up -d
stop-router:
	docker-compose -f ./docker-compose/router.yml -p Plex-HomeMedia down
pull-router:
	docker-compose -f ./docker-compose/router.yml -p Plex-HomeMedia pull