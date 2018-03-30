fun transcribeToRna(dna: String): String {
  return dna.map {
    when(it) {
      'G' -> "C"
      'C' -> "G"
      'T' -> "A"
      'A' -> "U"
      'U' -> "A"
      else -> throw IllegalArgumentException("Invalid nucleotide.")
    }
  }.joinToString("")
}

