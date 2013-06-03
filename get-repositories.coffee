#!/usr/bin/env coffee
fs = require 'fs'
utils = require './utils'

saveTopRepos = ->
  MIN_FOLLOWERS = 5
  MAX_PAGES = 10
  urls = utils.range(1, MAX_PAGES + 1).map (page) ->
    "https://api.github.com/legacy/repos/search/type=repo?sort=size&order=desc?page=#{page}&per_page=#{MAX_PAGES}"

  parse = (text) ->
    JSON.parse(text).repositories.map (_) -> _.reponame

  utils.batchGet urls, parse, (all) ->
    repos = [].concat.apply [], all
    utils.writeStats './temp-repos.json', repos

saveTopRepos()
