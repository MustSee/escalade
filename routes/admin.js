var express = require('express');
var router = express.Router();
var fs = require('fs');

// Accès à la bdd
var pool = require('../config/db.js');

router.get('/', function(req, res, next) {
  showNewsSql = "SELECT news, created_at, updated_at FROM infos ORDER BY updated_at DESC LIMIT 1";
  pool.query(showNewsSql, function(error, resShowNews) {
    if(error) {
      return console.error('error running query', error);
    }
    var news = resShowNews.rows[0];
    res.render('admin', {result : news} );
  });
});

router.get('/insertnews', function(req, res, next){
  // On prend la dernière valeur entrée dans la table infos
  lastInsertInfosSql = "SELECT id_news, news, updated_at FROM infos ORDER BY updated_at DESC LIMIT 1";
  pool.query(lastInsertInfosSql, function(error, resLastInsertInfos) {
    resLastInsertNews = resLastInsertInfos.rows[0].news;
    lastEntryId = resLastInsertInfos.rows[0].id_news;
    // On compare avec la valeur que l'on veut entrer
    fs.readFile('/tmp/infos.txt', 'utf8', function(err, data) {
      if (resLastInsertNews === data) {
        // Si la valeur est la même, on fait un update row pour modifier seulement
        // la date de mise à jour
        updateSql = "UPDATE infos SET updated_at = CURRENT_TIMESTAMP WHERE id_news = $1";
        pool.query(updateSql, [lastEntryId], function(error, res) {
          if(error) {
            return console.error("error on running query", error);
          }
        });
      } else {
        // Sinon, on crée une nouvelle entrée dans la table
        addNewsSql = "INSERT INTO infos (news, created_at, updated_at) VALUES ($1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
        pool.query(addNewsSql, [data], function(error, resAddNews) {
          if(error) {
            return console.error('error running query', error);
          }
        });
      } // Si la valeur est nulle : message pour prévenir l'admin !
      res.redirect('/admin');
    });
  });
});

module.exports = router;
