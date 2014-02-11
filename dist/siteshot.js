var SiteShot;

SiteShot = (function() {
  function SiteShot() {
    var async, mkdirp, parseString, path, phantom, url, _;
    this.fs = require('fs');
    if (process.argv.indexOf('config') !== -1) {
      this.config();
    } else {
      this.config = require('../siteshot.json');
      parseString = require('xml2js').parseString;
      _ = require('underscore');
      phantom = require('phantom');
      async = require('async');
      url = require('url');
      path = require('path');
      mkdirp = require('mkdirp');
      parseString(this.fs.readFileSync(this.config.sitemap), (function(_this) {
        return function(err, result) {
          var routes;
          if (err != null) {
            throw err;
          } else {
            routes = _.flatten(_.pluck(result.urlset.url, 'loc'));
            return phantom.create(function(ph) {
              var items;
              items = [];
              return _.each(routes, function(route, i) {
                return ph.createPage(function(page) {
                  return page.open(route, function(status) {
                    if (status === 'success') {
                      return page.evaluate((function() {
                        return document.documentElement.outerHTML;
                      }), function(res) {
                        var snapPath, snapPrefix;
                        snapPrefix = url.parse(route).path === '/' ? '/index' : url.parse(route).path;
                        snapPath = "" + _this.config.snapshotDir + snapPrefix + ".html";
                        return mkdirp(path.dirname(snapPath), function(err) {
                          if (err != null) {
                            throw err;
                          }
                          return _this.fs.writeFile(snapPath, res, function(err) {
                            if (err != null) {
                              throw err;
                            }
                            items.push(i);
                            page.close();
                            if (items.length === routes.length) {
                              return ph.exit();
                            }
                          });
                        });
                      });
                    }
                  });
                });
              });
            });
          }
        };
      })(this));
    }
  }

  SiteShot.prototype.config = function() {
    var example;
    example = {
      snapshotDir: "snapshots",
      sitemap: 'sitemap.xml',
      opts: {
        cutImg: true,
        cutJs: true,
        cutCss: true
      }
    };
    return this.fs.writeFileSync('siteshot.json', JSON.stringify(example));
  };

  return SiteShot;

})();

module.exports = SiteShot;

new SiteShot;
