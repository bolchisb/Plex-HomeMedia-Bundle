install:
	sudo curl https://get.docker.com | bash \
	&& sudo usermod -aG docker $$USER \
	&& sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$$(uname -s)-$$(uname -m)" -o /usr/local/bin/docker-compose \
	&& sudo chmod +x /usr/local/bin/docker-compose \
	&& sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

prepare-hosts:
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} jackett.localhost" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} jackett.localhost" >> /etc/hosts
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} sonarr.localhost" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} sonarr.localhost" >> /etc/hosts
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} radarr.localhost" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} radarr.localhost" >> /etc/hosts
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} prowlarr.localhost" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} prowlarr.localhost" >> /etc/hosts
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} transmission.localhost" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} transmission.localhost" >> /etc/hosts
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} services.localhost" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} services.localhost" >> /etc/hosts
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} tautulli.localhost" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} tautulli.localhost" >> /etc/hosts
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} overseerr.localhost" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} overseerr.localhost" >> /etc/hosts