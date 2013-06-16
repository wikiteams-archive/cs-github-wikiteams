// Generated by CoffeeScript 1.6.1
(function() {
  var fs, saveTopRepos, utils;

  fs = require('fs');

  utils = require('./utils');

  saveTopRepos = function() {
    var ELEMENTS_PER_PAGE, MAX_PAGES, MIN_FOLLOWERS, parse, urls;
    MIN_FOLLOWERS = 5;
    MAX_PAGES = 10;
    ELEMENTS_PER_PAGE = 1000;
    urls = utils.range(1, MAX_PAGES + 1).map(function(page) {
      return "https://api.github.com/legacy/repos/search/linux?type=repo?sort=size&order=desc?page=" + page + "&per_page=" + ELEMENTS_PER_PAGE;
    });
    parse = function(text) {
      return JSON.parse(text).repositories.map(function(_) {
        return _.name;
      });
    };
    return utils.batchGet(urls, parse, function(all) {
      var repos;
      repos = [].concat.apply([], all);
      return utils.writeStats('./temp-repos.json', repos);
    });
  };

  saveTopRepos();

}).call(this);
