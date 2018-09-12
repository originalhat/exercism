export default class ArmstrongNumbers {
  static isArmstrongNumber(number: number) {
    let numberAsArray = this.getNumberAsArray(number);

    return numberAsArray.map(n => n ** numberAsArray.length).reduce((acc, cur) =>  acc + cur) === number;
  }

  private static getNumberAsArray(number: number) {
    return Array.from(number.toString()).map(n => parseInt(n));
  }
}