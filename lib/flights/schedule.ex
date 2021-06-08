NimbleCSV.define(MyParser, separator: ",", escape: "\"")

defmodule Flights.Schedule do
  use Timex

  alias Flights.Schedule.Flight

  defp  formatDateTime(date, time) do
    Timex.parse!(date <> time <> "+0000", "{YYYY}{0M}{0D}{h24}{m}{Z}")
  end

  def get_flight!(flight_id) do
    stream = "flights.csv"
      |> File.stream!
      |> MyParser.parse_stream
      |> Stream.filter(fn [id, origin, destination, departureDate, departureTime,
                          arrivalDate, arrivalTime, number] -> flight_id = id end)
      |> Stream.map(fn [id, origin, destination, departureDate, departureTime,
                       arrivalDate, arrivalTime, number] ->
      departureDateTime = formatDateTime(departureDate, departureTime)
      arrivalDateTime = formatDateTime(arrivalDate, arrivalTime)
      %Flights.Schedule.Flight{departureTime: departureDateTime, arrivalTime: arrivalDateTime,
        number: number}
    end)
    Enum.at(stream, 0)
  end

  def store_flight(attrs \\ %{}) do
    %Flight{}
    |> Flight.changeset(attrs)
    |> Repo.insert()
  end
end
