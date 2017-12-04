index.json: subtask1-homographic-test.js subtask1-homographic-test.json subtask1-heterographic-test.js subtask1-heterographic-test.json
	node ./build.js > index.json

semeval2017_task7.tar.xz:
	wget http://alt.qcri.org/semeval2017/task7/data/uploads/semeval2017_task7.tar.xz

%.xml %.gold: semeval2017_task7.tar.xz
	tar xJvf semeval2017_task7.tar.xz --wildcards --strip-components=3 semeval2017_task7/data/test/$(basename $@).*

%.json: %.xml
	cat $< | node_modules/.bin/xml-json corpus > $@

%.js: %.gold
	cat $< | sed 's/	/:/g' | sed 's/$$/,/g' | echo 'module.exports = {' $$(cat) '}' > $@
