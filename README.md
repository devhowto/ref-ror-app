# Blog RoR App

## Useful Commands

```shell-session
$ docker exec -it db_ror_blog1_dev psql -U blog1 -d blog1_dev;
```

development:
  <<: *default
  host: <%= ENV.fetch("DB_BLOG1_HOST") %>
  port: <%= ENV.fetch("DB_BLOG1_PORT") %>
  username: <%= ENV.fetch("DB_BLOG1_USERNAME") %>
  password: <%= ENV.fetch("DB_BLOG1_PASSWORD") %>
  database: <%= ENV.fetch("DB_BLOG1_DATABASE") %>

## Configuration References

- [Quickstart: Compose and Rails (docker docs)](https://docs.docker.com/samples/rails/)
