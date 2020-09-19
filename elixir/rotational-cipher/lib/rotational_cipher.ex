defmodule Letter do
  defstruct letter: 0

  defmacro is_lowercase(char) do
    quote do: unquote(char) >= 97 and unquote(char) <= 122
  end

  defmacro is_uppercase(char) do
    quote do: unquote(char) >= 65 and unquote(char) <= 90
  end
end

defmodule RotationalCipher do
  import Letter

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
    |> Enum.map(&shift_char(&1, shift))
    |> String.Chars.to_string
  end

  defp shift_char(char, shift) when is_lowercase(char) and char + shift > 122 do
    Integer.mod(char + shift, 123) + 97
  end

  defp shift_char(char, shift) when is_uppercase(char) and char + shift > 90 do
    Integer.mod(char + shift, 91) + 65
  end

  defp shift_char(char, shift) when is_uppercase(char) or is_lowercase(char) do
    char + shift
  end

  defp shift_char(char, _), do: char
end
