function isLeapYear(year: number): boolean {
  if (year % 100 !== 0) {
    return year % 4 === 0;
  } else {
    return year % 400 === 0;
  }
}

export default isLeapYear