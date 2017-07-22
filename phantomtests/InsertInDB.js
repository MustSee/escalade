var page = require('webpage').create();
var url = 'localhost:3000/admin';

// En lançant la page, je mets à jour ma bdd
// A effectuer avec Cron
page.open(url, function(status) {
  if(status === 'fail') {
      console.log('could not open the stream');
  }
  phantom.exit();
});
