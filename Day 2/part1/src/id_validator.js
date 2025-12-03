function valid(id) {
  let idAsString = id.toString();
  let idSize = idAsString.length;
  if(idSize % 2 == 0) {
    let prefix = idAsString.slice(0, idSize / 2);
    let suffix = idAsString.slice(idSize / 2);
    return prefix != suffix;
  }
  return true;
}

function extractRange(rangeStr) {
  let parts = rangeStr.split("-");
  return {
    start: parseInt(parts[0], 10),
    end: parseInt(parts[1], 10)
  };
}

function extractInvalidIdsFromRange(range) {
  let invalidIds = [];
  for(let id = range.start; id <= range.end; id++) {
    if(!valid(id)) {
      invalidIds.push(id);
    }
  }
  return invalidIds;
}

function extractRangesFromInput(inputFile){
  const fs = require('fs');
  const lines = fs.readFileSync(inputFile, 'utf-8').split('\n').filter(Boolean);
  const ranges = lines.reduce((acc, line) => {
    line.split(',').forEach(rangeStr => acc.push(extractRange(rangeStr)));
    return acc;
  }, []);
  return ranges;
}

module.exports = {
  valid,
  extractRange,
  extractInvalidIdsFromRange,
  extractRangesFromInput
};