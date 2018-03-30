module Hamming
  def self.compute(first_strand, second_strand)
    raise ArgumentError if first_strand.length != second_strand.length

    return first_strand.each_char.with_index.count do |char, index|
      char != second_strand[index]
    end
  end
end

module BookKeeping
  VERSION = 3
end