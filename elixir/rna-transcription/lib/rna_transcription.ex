defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map( &transcribe_seq(&1) )
  end

  @doc """
  Transcribe a single ASCII charater code to it's corresponding value
  """
  def transcribe_seq(seq) do
    case seq do
      71 -> 67
      67 -> 71
      84 -> 65
      65 -> 85
   end
  end
end
