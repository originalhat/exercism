class ReverseString {
  static reverse(reversableString: string): string {
    return reversableString.split('').reverse().join('')
  }
}

export default ReverseString
