NAME = inception
srcs = $(shell find srcs -type f)

up:
	cd srcs && sudo docker-compose -p $(NAME) up --build
down:
	cd srcs && sudo docker-compose down

watch:
	@echo "$(srcs)" | sed "s/ /\n/g" | entr -r -s "make up"
