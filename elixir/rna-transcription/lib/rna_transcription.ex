defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna |> Enum.map( &transcribe_seq(&1) )
  end

  defp transcribe_seq(?G), do: ?C
  defp transcribe_seq(?C), do: ?G
  defp transcribe_seq(?T), do: ?A
  defp transcribe_seq(?A), do: ?U
end
