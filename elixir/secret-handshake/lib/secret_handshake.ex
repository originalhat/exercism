defmodule SecretHandshake do
  use Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    []
    |> append_if(band(code, 1) != 0, "wink")
    |> append_if(band(code, 2) != 0, "double blink")
    |> append_if(band(code, 4) != 0, "close your eyes")
    |> append_if(band(code, 8) != 0, "jump")
    |> reverse_if(band(code, 16) != 0)
  end

  defp append_if(list, condition, item) do
    if condition, do: list ++ [item], else: list
  end

  defp reverse_if(list, condition) do
    if condition, do: Enum.reverse(list), else: list
  end
end
