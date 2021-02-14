defmodule RunLengthEncoder do
  @spec encode(String.t()) :: String.t()
  def encode(string \\ "") do
    string
    |> String.graphemes()
    |> Enum.chunk_by(&Function.identity/1)
    |> Enum.map(&encode_chunks/1)
    |> Enum.join()
  end

  @spec encode_chunks([String.t()]) :: [String.t()]
  defp encode_chunks([chunk]), do: chunk

  @spec encode_chunks([String.t()]) :: [String.t()]
  defp encode_chunks(chunks), do: to_string(Enum.count(chunks)) <> List.first(chunks)

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    string
    |> String.split(~r/(\d*)[[:alpha:]]/, include_captures: true, trim: true)
    |> Enum.map(&decode_chunks/1)
    |> Enum.join()
  end

  @spec encode_chunks([String.t()]) :: [String.t()]
  def decode_chunks(chunks) do
    case Integer.parse(chunks) do
      :error ->
        chunks

      {count, letter} ->
        String.duplicate(letter, count)
    end
  end
end
