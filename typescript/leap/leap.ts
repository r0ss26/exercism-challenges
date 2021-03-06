function isLeapYear(year: number): boolean {
    if (year % 4 === 0) {
        if (year % 100 !== 0) {
            if (year % 400 !== 0) {
                return false;
            }
        }
    }
    return false;
}

export default isLeapYear;
