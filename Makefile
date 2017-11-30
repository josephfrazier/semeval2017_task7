index.json: subtask1-homographic-test.js subtask1-homographic-test.json subtask1-heterographic-test.js subtask1-heterographic-test.json
	node ./build.js > index.json

semeval2017_task7.tar.xz:
	wget http://alt.qcri.org/semeval2017/task7/data/uploads/semeval2017_task7.tar.xz


subtask1-homographic-test.xml: semeval2017_task7.tar.xz
	tar xJvf semeval2017_task7.tar.xz semeval2017_task7/data/test/subtask1-homographic-test.xml --to-stdout > subtask1-homographic-test.xml

subtask1-homographic-test.json: subtask1-homographic-test.xml
	node_modules/.bin/xml-json subtask1-homographic-test.xml corpus > subtask1-homographic-test.json

subtask1-homographic-test.gold: semeval2017_task7.tar.xz
	tar xJvf semeval2017_task7.tar.xz semeval2017_task7/data/test/subtask1-homographic-test.gold --to-stdout > subtask1-homographic-test.gold

subtask1-homographic-test.js: subtask1-homographic-test.gold
	sed 's/	/:/g' subtask1-homographic-test.gold | sed 's/$$/,/g' | echo 'module.exports = {' $$(cat) '}' > subtask1-homographic-test.js


subtask1-heterographic-test.xml: semeval2017_task7.tar.xz
	tar xJvf semeval2017_task7.tar.xz semeval2017_task7/data/test/subtask1-heterographic-test.xml --to-stdout > subtask1-heterographic-test.xml

subtask1-heterographic-test.json: subtask1-heterographic-test.xml
	node_modules/.bin/xml-json subtask1-heterographic-test.xml corpus > subtask1-heterographic-test.json

subtask1-heterographic-test.gold: semeval2017_task7.tar.xz
	tar xJvf semeval2017_task7.tar.xz semeval2017_task7/data/test/subtask1-heterographic-test.gold --to-stdout > subtask1-heterographic-test.gold

subtask1-heterographic-test.js: subtask1-heterographic-test.gold
	sed 's/	/:/g' subtask1-heterographic-test.gold | sed 's/$$/,/g' | echo 'module.exports = {' $$(cat) '}' > subtask1-heterographic-test.js
