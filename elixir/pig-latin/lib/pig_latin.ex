defmodule PigLatin do
  @vowels [
    "a",
    "e",
    "i",
    "o",
    "u",
  ]

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&translate_word(&1))
    |> Enum.join(" ")
  end

  @spec translate_word(phrase :: String.t()) :: String.t()
  def translate_word(<<first::binary-size(1), second::binary-size(1), rest::binary>>) do
    cond do
      first <> second == "qu" -> rest <> first <> second <> "ay"
      first in @vowels -> first <> second <> rest <> "ay"
      first == "y" and second not in @vowels -> first <> second <> rest <> "ay"
      first == "x" and second not in @vowels -> first <> second <> rest <> "ay"
      true -> translate(second <> rest <> first)
    end
  end
end
