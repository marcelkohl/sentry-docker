DK = docker
DC = docker-compose
EXEC = exec -it sentry

init: initialize-database secret-key

start:
	${DC} up -d

stop:
	${DC} down -v --remove-orphans

secret-key:
	@echo "\033[1;32m------------------- SECRET KEY -------------------\e[0m"
	@echo $$(${DC} run --rm sentry config generate-secret-key)
	@echo "\nGet the generated key above and set on your .env file"
	@echo "\033[1;32m--------------------------------------------------\e[0m"

initialize-database:
	${DC} run --rm sentry bash -c "sentry upgrade --noinput && sentry createuser --email admin@admin.com --password admin --superuser"

bash:
	${DK} ${EXEC} bash
