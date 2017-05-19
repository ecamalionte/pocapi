# Pocapi
An (Elixir/Phoenix) proof of concept (POC), the purpose of which is to verify that certain functional concepts have the potential for real-world application.

To configure:

  * `mix deps.get`
  * `mix ecto.create & ecto.migrate`
  * `mix test`

To start your Phoenix app:

  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Commands History

How this app was created:

  * Create the app `mix phoenix.new pocapi`
  * Create a Database on Postgres `mix ecto.create`
  * I had to access the postgres `psql postgres`
  * And alter the role of the postgres user as `ALTER USER postgres SUPERUSER;`
  * Create a Database on Postgres `mix ecto.create`
  * Create a CRUD for Products `mix phoenix.gen.html Product products name:string description:string rating:integer price:float`
  * Run Database migration `mix phoenix.migrate`

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
