# Blog RoR App

## Useful Commands

Starts services defined in `docker-compose.yml`:

```shell-session
$ docker compose up
```

Gracefully stops services defined in `docker-compose.yml`:

```shell-session
$ docker compose down
```

Connect to the database with psql:

```shell-session
$ docker exec -it db_ror_blog1_dev psql -U blog1 -d blog1_dev -W
```

Or with `docker compose`:

```shell-session
$ docker compose exec db psql -U blog1 -d blog1_dev -W
```

Run rails commands from the running container (not from local shell):

```shell-session
$ docker compose run web \
    bin/rails generate scaffold Article \
		title:string{128} \
		location:string{512} \
		excerpt:string{2024} \
		body:text \
		published_at:datetime \
    --no-migration
```

```shell-session
development:
  <<: *default
  host: <%= ENV.fetch("DB_BLOG1_HOST") %>
  port: <%= ENV.fetch("DB_BLOG1_PORT") %>
  username: <%= ENV.fetch("DB_BLOG1_USERNAME") %>
  password: <%= ENV.fetch("DB_BLOG1_PASSWORD") %>
  database: <%= ENV.fetch("DB_BLOG1_DATABASE") %>
```

## Configuration References

- [Quickstart: Compose and Rails (docker docs)](https://docs.docker.com/samples/rails/)
