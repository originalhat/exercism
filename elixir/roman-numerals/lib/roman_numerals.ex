defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()

  # def numeral(number) do
  #   cond do
  #     div(number, 40) > 0 -> numeral(rem(number, 40)) <> scribe(div(number, 40), "L")
  #     div(number, 10) > 0 -> scribe(div(number, 10), "X") <> numeral(rem(number, 10))
  #     div(number, 9) > 0 -> numeral(div(number, 9)) <> scribe(div(number, 9), "X")
  #     div(number, 5) > 0 -> scribe(div(number, 5), "V") <> numeral(rem(number, 5))
  #     div(number, 4) > 0 -> numeral(div(number, 4)) <> scribe(div(number, 4), "V")
  #     number > 0 -> scribe(number, "I")
  #     true -> ""
  #   end
  # end


  def numeral(number, acc), do: acc <> "I"
  def numeral(1, acc), do: acc <> "I"
  def numeral(number), do: numeral(number, "")

  # def numeral(number) when number >= 10, do: scribe(1, "X")
  # def numeral(number) when number >= 9, do: scribe(1, "I") <> scribe(1, "X")
  # def numeral(number) when number >= 6, do: scribe(1, "V") <> scribe(number - rem(5, number), "I")
  # def numeral(number) when number >= 5, do: scribe(1, "V")
  # def numeral(number) when number >= 4, do: scribe(1, "I") <> scribe(1, "V")
  # def numeral(number), do: scribe(number, "I")

  def scribe(number, sym) do
    1..number
    |> Enum.map(fn _ -> sym end)
    |> Enum.join
  end
end
