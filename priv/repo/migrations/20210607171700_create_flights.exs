defmodule Flights.Repo.Migrations.CreateFlights do
  use Ecto.Migration

  def change do
    create table(:flights) do
      add :departureTime, :string
      add :arrivalTime, :string
      add :name, :string

      timestamps()
    end

  end
end
