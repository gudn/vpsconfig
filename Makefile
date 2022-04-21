.PHONY: run

up:
	docker-compose -f docker-compose.yml -f static/docker-compose.yml up --build -d

down:
	docker-compose -f docker-compose.yml -f static/docker-compose.yml down
