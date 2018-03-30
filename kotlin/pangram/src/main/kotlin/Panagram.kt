class Pangram {
  companion object {
    fun isPangram(text: String): Boolean {
      return text.toLowerCase().toCharArray().filter { it >= 'a' && it <= 'z' }.distinct().count() == 26
    }
  }
}

