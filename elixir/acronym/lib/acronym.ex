defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r{[\s|\-]}, trim: true)
    |> Enum.map(&first_char(&1))
    |> Enum.join()
  end

  defp first_char(word) do
    word
    |> String.replace("_", "")
    |> String.first()
    |> String.upcase()
  end
end
