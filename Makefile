build:
	docker build --tag actix_demo .

run:
	docker run -p 8000:8000 actix_demo 

create-db:
	./scripts/init_db.sh

migrate-cloud:
	DATABASE_URL=YOUR-DIGITAL-OCEAN-DB-CONNECTION-STRING sqlx migrate run

