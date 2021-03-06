const text = require("./subtask1-homographic-test.json").text.concat(
  require("./subtask1-heterographic-test.json").text
);

const gold = {
  ...require("./subtask1-homographic-test.js"),
  ...require("./subtask1-heterographic-test.js")
};

const sentences = text.map(({ id, word }) => ({
  id,
  words: word.map(({ _ }) => _)
}));
const puns = sentences.filter(({ id }) => gold[id]);

var stringify = require("json-stringify-pretty-compact")
process.stdout.write(stringify(puns, {maxLength: 999}));
