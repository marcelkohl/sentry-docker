# sentry-docker
Sentry using docker-compose

## Building
- Copy the `.env.sample` to `.env`
- Setup `.env` file with your settings. Don't worry about the secret key now, it will be generated later
- Run `make init` from the root folder
- Update your `.env` with the secret-key generated at the end of the ***make init*** process
- Run `make start`
- Access [http://localhost:19000](http://localhost:9000) (Port depends on your .env settings)
  - Defaults to login are:
    - user: **admin@admin.com**
    - password: **admin**

## Other make commands
`make stop`: Stops the containers;\
`make secret-key`: Generates another secret key for the sentry server (usually not needed if everything was right on the make init);\
`initialize-database`: Prepares the database for the first time and also create de default user to access sentry;\
`make bash`: Enters sentry bash;

## Known Issues
- Sometimes at the first start Sentry shows a message complaining about the workers not running properly although everything is working.
  - The message will disappear after some sentry interactions;
  - If you need to remove it instantly, just try to re-run worker and cron with the following commands:
    - Open a new terminal for each. These must run in parallel with Sentry.
    - `docker-compose run sentry run cron`
    - `docker-compose run sentry run worker`
    - Reload your Sentry page and check for the complaining message (it should be gone)
    - Break these 2 processes (ctrl + c), they are not needed anymore;
