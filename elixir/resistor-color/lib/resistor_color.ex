defmodule ResistorColor do
  @moduledoc false

  @color_map %{
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9,
  }

  @spec colors() :: list(String.t())
  def colors do
    @color_map
    |> Map.keys
    |> Enum.sort_by(&code(&1))
  end

  @spec code(String.t()) :: integer()
  def code(color), do: Map.get(@color_map, color)
end
