build:
	docker build --tag actix_demo .

create-db:
	./scripts/init_db.sh