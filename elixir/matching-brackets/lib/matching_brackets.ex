defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str = String.replace(str, ~r/\s/, "")

    case String.length(str) do
      0 ->
        true

      2 ->
        [h | t] = str |> String.to_charlist()
        h + 2 == hd(t)

      _ ->
        false
    end
  end
end
