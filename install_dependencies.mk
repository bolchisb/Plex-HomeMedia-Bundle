install:
	sudo curl https://get.docker.com | bash \
	&& sudo usermod -aG docker $$USER \
	&& sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$$(uname -s)-$$(uname -m)" -o /usr/local/bin/docker-compose \
	&& sudo chmod +x /usr/local/bin/docker-compose \
	&& sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

prepare-hosts:
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} jackett.${DOMAIN_NAME}" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} jackett.${DOMAIN_NAME}" >> /etc/hosts
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} sonarr.${DOMAIN_NAME}" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} sonarr.${DOMAIN_NAME}" >> /etc/hosts
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} radarr.${DOMAIN_NAME}" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} radarr.${DOMAIN_NAME}" >> /etc/hosts
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} prowlarr.${DOMAIN_NAME}" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} prowlarr.${DOMAIN_NAME}" >> /etc/hosts
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} transmission.${DOMAIN_NAME}" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} transmission.${DOMAIN_NAME}" >> /etc/hosts
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} services.${DOMAIN_NAME}" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} services.${DOMAIN_NAME}" >> /etc/hosts
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} tautulli.${DOMAIN_NAME}" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} tautulli.${DOMAIN_NAME}" >> /etc/hosts
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} overseerr.${DOMAIN_NAME}" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} overseerr.${DOMAIN_NAME}" >> /etc/hosts
	grep -qxF "${IP_ADDRESS_LOCAL_MACHINE} auth.${DOMAIN_NAME}" /etc/hosts || echo "${IP_ADDRESS_LOCAL_MACHINE} auth.${DOMAIN_NAME}" >> /etc/hosts