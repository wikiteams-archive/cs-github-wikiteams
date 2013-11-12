all: get format

get:
	../node_modules/coffee-script/bin/coffee get-users.coffee
	../node_modules/coffee-script/bin/coffee get-details.coffee

format:
	../node_modules/coffee-script/bin/coffee format-languages.coffee
	../node_modules/coffee-script/bin/coffee format-users.coffee
