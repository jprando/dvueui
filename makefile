.DEFAULT_GOAL := help

help:  ## Exibe esta ajuda (opcao padrao)
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Docker Vue UI

build: ## Gera a docker imagem jprando/vueui 
	docker build -t jprando/vueui -t jprando/vueui:4.1.2 --pull --rm .

start: ## Roda a imagem docker jprando/vueui
	docker run --name vueUI --rm --detach \
		--volume vueui_data:/home/node \
		--publish 8000:8000 \
		--publish 8080:8080 \
		-v "$(pwd)/app:/app" \
	jprando/vueui

stop: ## Para a execucao do container vueUI
	docker stop vueUI

log: ## Exibe o log da execucao do container vueUI
	docker logs --follow vueUI

alias: ## Cria alias para o comando vueui no terminal
	alias vueui='docker run --name vueUI --rm \
		--volume vueui_data:/home/node \
		--publish 8000:8000 \
		--publish 8080:8080 \
		--mount type=bind,source=$PWD,target=/app \
		--detach \
	jprando/vueui $@'

push: ## Envia a imagem jprando/vueui para o docker hub (necessario login)
	docker login
	docker push jprando/vueui:4.1.2

pull: ## Baixa a imagem jprando/vueui do docker hub
	docker pull jprando/vueui:4.1.2