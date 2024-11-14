DOCKER_COMPOSE_FILE = docker-compose.yml

build:
	docker-compose -f $(DOCKER_COMPOSE_FILE) build

up:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) stop

restart: down up

logs:
	docker-compose -f $(DOCKER_COMPOSE_FILE) logs -f

scan:
	docker-compose -f $(DOCKER_COMPOSE_FILE) run nuclei

nuclei-logs:
	cat nuclei-logs/output.json

clean:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down --rmi all --volumes --remove-orphans
	rm -rf nuclei-logs/output.json
