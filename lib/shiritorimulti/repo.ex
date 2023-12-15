defmodule Shiritorimulti.Repo do
  use Ecto.Repo,
    otp_app: :shiritorimulti,
    adapter: Ecto.Adapters.Postgres
end
