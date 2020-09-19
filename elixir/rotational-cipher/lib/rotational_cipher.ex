defmodule RotationalCipher do
  @upper ?A..?Z
  @lower ?a..?z

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist
    |> Enum.map(&rotate_char(&1, shift))
    |> String.Chars.to_string
  end

  defp rotate_char(char, shift) do
    cond do
      char in @upper -> Integer.mod(char - ?A + shift, 26) + ?A
      char in @lower -> Integer.mod(char - ?a + shift, 26) + ?a
      true           -> char
    end
  end
end
