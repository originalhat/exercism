export default class ArmstrongNumbers {
  static isArmstrongNumber(number: number): boolean {
    let numberAsArray = Array.from(number.toString()).map(n => parseInt(n));

    return numberAsArray.map(n => n ** numberAsArray.length).reduce((acc, cur) =>  acc + cur) === number;
  }
}