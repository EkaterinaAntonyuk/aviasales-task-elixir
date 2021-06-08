defmodule FlightsWeb.FlightController do
  use FlightsWeb, :controller

  alias Flights.Schedule
  alias Flights.Schedule.Flight

  action_fallback FlightsWeb.FallbackController

  def show(conn, %{"id" => id}) do
    case Schedule.get_flight!(id) do
      nil -> send_resp(conn, 404, "Not Found")
      flight -> render(conn, "show.json", flight: flight)
    end
  end

end
