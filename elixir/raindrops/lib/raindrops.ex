defmodule Raindrops do
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

    # conditionally append strings

    list = if factor?(number, 3), do: ["Pling"], else: []
    list = if factor?(number, 5), do: list ++ ["Plang"], else: list
    list = if factor?(number, 7), do: list ++ ["Plong"], else: list

    if Enum.count(list) > 0 do
      Enum.join(list)
    else
      Integer.to_string(number)
    end
  end

  defp factor?(n, factor), do: rem(n, factor) == 0
end
