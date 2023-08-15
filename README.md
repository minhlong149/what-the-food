# What the Food

## Getting Started

### Prerequisites

In the `server` directory, create a `.env` file with the following contents:

```bash
PORT=8080
SECRET_KEY=secret
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DB=postgres
```

Then, you can run `make db` to start the PostgreSQL database in a Docker container.

### Building the App

In the `app` directory, run `yarn` to install dependencies and `yarn build` to build the app. Then, copy the `app/dist` directory to the `server/web` directory. Finally, in the `server` directory, run `make run` to start the server.

```bash
cd app
yarn
yarn build
cp -r dist ../server/web
cd ../server
make run
```
