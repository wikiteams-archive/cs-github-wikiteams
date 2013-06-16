all: get format

get:
	../node_modules/coffee-script/bin/coffee -c get-repositories.coffee
	../node_modules/coffee-script/bin/coffee -c get-details.coffee

format:
	../node_modules/coffee-script/bin/coffee format-languages.coffee
	../node_modules/coffee-script/bin/coffee format-users.coffee
	../node_modules/coffee-script/bin/coffee format-repositories.coffee
