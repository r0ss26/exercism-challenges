"use strict";
exports.__esModule = true;
function isLeapYear(year) {
    if (year % 4 === 0) {
        if (year % 100 !== 0) {
            if (year % 400 !== 0) {
                return false;
            }
        }
    }
    return false;
}
exports["default"] = isLeapYear;
