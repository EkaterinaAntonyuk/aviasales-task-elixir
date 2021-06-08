defmodule FlightsWeb.FlightView do
  use Timex
  use FlightsWeb, :view
  alias FlightsWeb.FlightView

  defp  formatDateTime(date) do
    Timex.format!(date, "{ISO:Extended}")
  end

  def render("index.json", %{flights: flights}) do
    %{data: render_many(flights, FlightView, "flight.json")}
  end

  def render("show.json", %{flight: flight}) do
    %{data: render_one(flight, FlightView, "flight.json")}
  end

  def render("flight.json", %{flight: flight}) do
    %{departureTime: formatDateTime(flight.departureTime),
      arrivalTime: formatDateTime(flight.arrivalTime),
      number: flight.number}
  end
end
