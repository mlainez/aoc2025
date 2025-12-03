const idValidator = require('./src/id_validator');

let ranges = idValidator.extractRangesFromInput("./input.txt");
let sum = 0;

ranges.forEach(range => {
  let invalidIds = idValidator.extractInvalidIdsFromRange(range);
  sum += invalidIds.reduce((acc, id) => acc + id, 0);
});

console.log("The total sum is: " + sum);
