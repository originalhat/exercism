defmodule Raindrops do
  @sounds %{ 3 => "Pling", 5 => "Plang", 7 => "Plong" }

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    Map.keys(@sounds)
    |> Enum.filter_map(&(factor?(number, &1)), &(@sounds[&1]))
    |> to_string_with_default(number)
  end

  @spec factor?(n :: [String.t()], factor :: integer) :: boolean()
  defp factor?(n, factor), do: rem(n, factor) == 0

  defp to_string_with_default([], default), do: Integer.to_string(default)
  defp to_string_with_default(list, _default), do: Enum.join(list)
end
