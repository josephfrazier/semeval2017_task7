# semeval2017_task7

This package contains a list of puns from the dataset at https://www.ukp.tu-darmstadt.de/data/sense-labelling-resources/sense-annotated-english-puns/

One way to make them relatively readable is:

```js
const puns = require("semeval2017_task7").map(({ words }) =>
  words.join(" ").replace(/ ([.,!;?])/g, "$1")
);
```

Build it with [Yarn](https://yarnpkg.com):

    yarn
