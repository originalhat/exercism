interface TranscriptionMap {
  C: string,
  G: string,
  A: string,
  [T: string]: string,
}


class Transcriptor {
  TranscriptionMap: TranscriptionMap  = {
    C: 'G',
    G: 'C',
    A: 'U',
    T: 'A',
  };

  toRna(sequence: string): string {
    return sequence.split('').map((char: string) => {
      if (this.TranscriptionMap[char]) {
        return this.TranscriptionMap[char];
      } else {
        throw "Invalid input DNA"
      }
    }).join('');
  }
}

export default Transcriptor