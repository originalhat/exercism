defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    sentence
    |> String.replace(~r/\d|\s|_|\./, "")
    |> String.graphemes()
    |> Enum.map(&String.downcase/1)
    |> MapSet.new()
    |> Enum.count() == 26
  end
end
