defmodule Sublist do
  @spec compare(a :: [integer()], b :: [integer()]) :: atom()
  def compare(a, b) do
    cond do
      a == b -> :equal
      sublist?(b, a) -> :sublist
      sublist?(a, b) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?([], _), do: false
  defp sublist?(l1 = [_ | t], l2), do: List.starts_with?(l1, l2) or sublist?(t, l2)
end
