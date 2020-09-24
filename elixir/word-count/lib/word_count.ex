defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split(~r/([^\w\-]|_)+/u, trim: true)
    |> Enum.group_by(&(&1))
    |> Enum.into(%{}, fn {k, v} -> {k, length(v)} end)
  end
end
