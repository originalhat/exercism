const KEY_BASE = 'diqnsndonqsdqkljakjnsuiohqiojwepqdkasnjbvaksjdhfgujowjqbdaljsdlnqopwjdnnqmlmsaaskdjskandjbjnakzzqpao';

class SimpleCipher {
  key: string;

  constructor(key = KEY_BASE) {
    if (this.validKey(key)) throw 'Bad key';

    this.key = key.split('').sort(() => -0.5 + Math.random()).join('');
  }

  encode(decodedMessage: string) {
    let encoded: Array<string> = [];

    for(let i = 0; i < decodedMessage.length; i++ ) {
      encoded.push(String.fromCharCode(decodedMessage.charCodeAt(i) + (this.key.charCodeAt(i) - 97)))
    }

    return encoded.join('');
  }


  decode(encodedMessage: string) {
    let decoded: Array<string> = [];

    for(let i = 0; i < encodedMessage.length; i++ ) {
      decoded.push(String.fromCharCode(encodedMessage.charCodeAt(i) - (this.key.charCodeAt(i) - 97)))
    }

    return decoded.join('');
  }

  private validKey(key: string) {
    return key.length <= 0 || key.match(/^[A-Z]+|[0-9]+$/);
  }

}

export default SimpleCipher
