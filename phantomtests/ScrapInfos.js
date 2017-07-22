var page = require('webpage').create();
var url = "https://escalade.paris.fr/escalade/model/params/get";
var fs = require('fs');

fs.write('/tmp/essai.txt', 'lalala', 'w');

page.open(url, function(status) {
  if (status === 'fail') {
    console.log('could not open stream');
  }
  window.setTimeout(function () {
    var infos = page.evaluate(function () {
      return document.querySelector('p').innerHTML;
    });
    // Traitement des données recueillies
    // Tester ce qu'il se passe si les infos recueillies changent...
    infos = infos.split('<br>').slice(0, 1);
    infos = infos[0].replace(/\\u00e0/g, 'à');
    infos = infos.replace(/\\/g, '');
    fs.write ('/tmp/infos.txt', infos, 'w');
    phantom.exit();
  }, 5000); // Avec une bonne connexion, 1s suffit. Sinon, 5sec voir 10.
});
