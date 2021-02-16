defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    a_set = MapSet.new(a)
    b_set = MapSet.new(b)

    cond do
      a == b -> :equal
      MapSet.subset?(a_set, b_set) and Enum.count(a) < Enum.count(b) -> :sublist
      MapSet.subset?(b_set, a_set) and Enum.count(b) < Enum.count(a) -> :superlist
      true -> :unequal
    end

  end
end
