define echo-green
	@tput setaf 2
	@echo $1
	@tput sgr0
endef

define echo-red
	@tput setaf 1
	@echo $1
	@tput sgr0
endef