build:
	docker build . -t wtfood

run:
	docker run -p 8080:8080 --env-file .env wtfood
