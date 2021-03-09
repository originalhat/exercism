defmodule DndCharacter do
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  @spec modifier(pos_integer()) :: integer()
  def modifier(score) do
    ((score - 10) / 2) |> Float.floor() |> Kernel.trunc()
  end

  @spec ability :: pos_integer()
  def ability do
    [0, 0, 0, 0]
    |> Enum.map(fn _ -> Enum.random(1..6) end)
    |> Enum.sort()
    |> Enum.drop(1)
    |> Enum.sum()
  end

  @spec character :: t()
  def character do
    constitution = ability()

    %{
      strength: ability(),
      dexterity: ability(),
      constitution: constitution,
      intelligence: ability(),
      wisdom: ability(),
      charisma: ability(),
      hitpoints: modifier(constitution) + 10
    }
  end
end
