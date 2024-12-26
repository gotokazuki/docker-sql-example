.PHONY: up-postgres, up-mysql, down, clean, ps

up:
	docker compose up -d

up-postgres:
	docker compose up -d postgres adminer

up-mysql:
	docker compose up -d mysql adminer

down:
	docker compose down

clean:
	docker compose down -v

ps:
	docker compose ps
