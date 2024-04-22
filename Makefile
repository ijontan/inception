NAME = inception
srcs = $(shell find srcs -type f)
HOME=/home/itan
dirs = $(HOME)/data/ $(HOME)/data/db_data $(HOME)/data/wp_data

up: $(dirs)
	cd srcs && docker-compose -p $(NAME) up --build
down:
	cd srcs && docker-compose -p $(NAME) down

watch:
	@echo "$(srcs)" | sed "s/ /\n/g" | entr -r -s "make up"

$(dirs):
	@mkdir $@

clean_volume:
	docker volume rm inception_db_data inception_wp_data
	rm $(HOME)/data

.PHONY: up down watch
