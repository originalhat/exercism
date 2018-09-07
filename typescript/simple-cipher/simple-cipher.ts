const KEY_BASE = 'diqnsndonqsdqkljakjnsuiohqiojwepqdkasnjbvaksjdhfgujowjqbdaljsdlnqopwjdnnqmlmsaaskdjskandjbjnakzzqpao';

class SimpleCipher {
  key: string;

  constructor(key?: string) {
    if (key === '') throw 'Bad key';
    if (key && key.match(/^[A-Z]+|[0-9]+$/)) throw 'Bad key';

    this.key = key || KEY_BASE.split('').sort(() => -0.5 + Math.random()).join('');
  }

  encode(decodedMessage: string) {
    let encoded: Array<string> = [];

    for (let i = 0; i < decodedMessage.length; i++) {
      let shiftedCharCode = decodedMessage.charCodeAt(i) + (this.key.charCodeAt(i) - 97);
      encoded.push(shiftedCharCode >= 123 ? String.fromCharCode(shiftedCharCode - 26) : String.fromCharCode(shiftedCharCode));
    }

    return encoded.join('');
  }


  decode(encodedMessage: string) {
    let decoded: Array<string> = [];

    for (let i = 0; i < encodedMessage.length; i++) {
      decoded.push(String.fromCharCode(encodedMessage.charCodeAt(i) - (this.key.charCodeAt(i) - 97)))
    }

    return decoded.join('');
  }
}

export default SimpleCipher
