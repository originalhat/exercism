module Raindrops
  def self.convert(number_of_drops)
    sounds = ''

    sounds << 'Pling' if number_of_drops % 3 == 0
    sounds << 'Plang' if number_of_drops % 5 == 0
    sounds << 'Plong' if number_of_drops % 7 == 0

    sounds.length == 0 ? number_of_drops.to_s : sounds
  end
end

module BookKeeping
  VERSION = 3
end