index.json: subtask1-homographic-test.js subtask1-homographic-test.json subtask1-heterographic-test.js subtask1-heterographic-test.json
	node ./build.js > index.json

semeval2017_task7.tar.xz:
	wget http://alt.qcri.org/semeval2017/task7/data/uploads/semeval2017_task7.tar.xz


subtask1-homographic-test.json: semeval2017_task7.tar.xz
	tar xJvf semeval2017_task7.tar.xz semeval2017_task7/data/test/subtask1-homographic-test.xml --to-stdout | node_modules/.bin/xml-json corpus > subtask1-homographic-test.json

subtask1-homographic-test.js: semeval2017_task7.tar.xz
	tar xJvf semeval2017_task7.tar.xz semeval2017_task7/data/test/subtask1-homographic-test.gold --to-stdout | sed 's/	/:/g' | sed 's/$$/,/g' | echo 'module.exports = {' $$(cat) '}' > subtask1-homographic-test.js


subtask1-heterographic-test.json: semeval2017_task7.tar.xz
	tar xJvf semeval2017_task7.tar.xz semeval2017_task7/data/test/subtask1-heterographic-test.xml --to-stdout | node_modules/.bin/xml-json corpus > subtask1-heterographic-test.json

subtask1-heterographic-test.js: semeval2017_task7.tar.xz
	tar xJvf semeval2017_task7.tar.xz semeval2017_task7/data/test/subtask1-heterographic-test.gold --to-stdout | sed 's/	/:/g' | sed 's/$$/,/g' | echo 'module.exports = {' $$(cat) '}' > subtask1-heterographic-test.js
