# Pocapi
An (Elixir/Phoenix) proof of concept (POC), the purpose of which is to verify that certain functional concepts have the potential for real-world application.

To configure:

  * `mix deps.get`
  * `mix ecto.create`
  * `ecto.migrate`
  * `mix test`

To start your Phoenix app:

  * Start Phoenix endpoint with `mix phoenix.server`
  * Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To pack this application:

  * Run `MIX_ENV=prod mix release --env=prod`. [See Distillery for more information](https://github.com/bitwalker/distillery)
  * Ready to run in production!
  * [check deployment guides](http://www.phoenixframework.org/docs/deployment).

To deploy on AWS:
  * `scp -i ~/.ssh/MyKeyPair.pem package ec2-user@instance.compute.amazonaws.com:~\`

To hack as DevOps on AWS:
  * `ssh -i ~/.ssh/MyKeyPair.pem ec2-user@instance.compute.amazonaws.com`



## Commands History

How this app was created:

  * Create the app `mix phoenix.new pocapi`
  * Create a Database on Postgres `mix ecto.create`
  * I had to access the postgres `psql postgres`, and alter the role `ALTER USER postgres SUPERUSER;`
  * It could be done with `createuser -s postgres` for creating and setting Superuser role.
  * Create a Database on Postgres `mix ecto.create`
  * Create a CRUD for Products `mix phoenix.gen.html Product products name:string description:string rating:integer price:float`
  * Run Database migration `mix ecto.migrate`

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
