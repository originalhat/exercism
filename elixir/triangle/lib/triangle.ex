defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @spec kind(number, number, number) :: {:error, String.t()}
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0,
    do: {:error, "all side lengths must be positive"}

  @spec kind(number, number, number) :: {:error, String.t()}
  def kind(a, b, c) when a + b <= c or a + c <= b or b + c <= a,
    do: {:error, "side lengths violate triangle inequality"}

  @spec kind(number, number, number) :: {:ok, kind}
  def kind(a, b, c) do
    case Enum.count(Enum.uniq([a, b, c])) do
      1 -> {:ok, :equilateral}
      2 -> {:ok, :isosceles}
      3 -> {:ok, :scalene}
    end
  end
end
