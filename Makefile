all: get format

get:
	coffee get-repositories.coffee
	coffee get-details.coffee

format:
	coffee format-languages.coffee
	coffee format-repositories.coffee
