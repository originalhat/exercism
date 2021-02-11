defmodule StringSeries do

  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_s, size) when size < 1, do: []

  @doc """
  Takes a string and splits into overlaping chunks.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    s
    |> to_charlist()
    |> Enum.chunk_every(size, 1, :discard)
    |> Enum.map(&to_string/1)
  end
end
