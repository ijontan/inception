NAME = inception
srcs = $(shell find srcs -type f)
HOME=/home/itan
dirs = $(HOME)/data/ $(HOME)/data/db_data $(HOME)/data/wp_data

up: $(dirs)
	cd srcs && docker-compose -p $(NAME) up --build
down:
	cd srcs && docker-compose down

watch:
	@echo "$(srcs)" | sed "s/ /\n/g" | entr -r -s "make up"

$(dirs):
	@mkdir $@

.PHONY: up down watch
