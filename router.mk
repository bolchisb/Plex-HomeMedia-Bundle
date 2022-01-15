
start-router:
	docker-compose -f router.yml up -d
stop-router:
	docker-compose -f router.yml down