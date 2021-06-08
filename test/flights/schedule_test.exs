defmodule Flights.ScheduleTest do
  use Flights.DataCase

  alias Flights.Schedule

  describe "flights" do
    alias Flights.Schedule.Flight

    @valid_attrs %{arrivalTime: "some arrivalTime", departureTime: "some departureTime", name: "some name"}
    @update_attrs %{arrivalTime: "some updated arrivalTime", departureTime: "some updated departureTime", name: "some updated name"}
    @invalid_attrs %{arrivalTime: nil, departureTime: nil, name: nil}

    def flight_fixture(attrs \\ %{}) do
      {:ok, flight} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_flight()

      flight
    end

    test "list_flights/0 returns all flights" do
      flight = flight_fixture()
      assert Schedule.list_flights() == [flight]
    end

    test "get_flight!/1 returns the flight with given id" do
      flight = flight_fixture()
      assert Schedule.get_flight!(flight.id) == flight
    end

    test "create_flight/1 with valid data creates a flight" do
      assert {:ok, %Flight{} = flight} = Schedule.create_flight(@valid_attrs)
      assert flight.arrivalTime == "some arrivalTime"
      assert flight.departureTime == "some departureTime"
      assert flight.name == "some name"
    end

    test "create_flight/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_flight(@invalid_attrs)
    end

    test "update_flight/2 with valid data updates the flight" do
      flight = flight_fixture()
      assert {:ok, %Flight{} = flight} = Schedule.update_flight(flight, @update_attrs)
      assert flight.arrivalTime == "some updated arrivalTime"
      assert flight.departureTime == "some updated departureTime"
      assert flight.name == "some updated name"
    end

    test "update_flight/2 with invalid data returns error changeset" do
      flight = flight_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_flight(flight, @invalid_attrs)
      assert flight == Schedule.get_flight!(flight.id)
    end

    test "delete_flight/1 deletes the flight" do
      flight = flight_fixture()
      assert {:ok, %Flight{}} = Schedule.delete_flight(flight)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_flight!(flight.id) end
    end

    test "change_flight/1 returns a flight changeset" do
      flight = flight_fixture()
      assert %Ecto.Changeset{} = Schedule.change_flight(flight)
    end
  end
end
