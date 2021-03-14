defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    case Enum.count(MapSet.new([a, b, c])) do
      1 -> {:ok, :equilateral}
      2 -> {:ok, :isosceles}
      3 -> {:ok, :scalene}
      _ -> :error

    end
  end
end
