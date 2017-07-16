var express = require('express');
var router = express.Router();
var connection = require('../config/db.js');

// if (connection) {
//   console.log('Connecté à la bdd')
// }

/* GET home page. */
router.get('/', function(req, res, next) {
  var sql = 'SELECT DATE_FORMAT(lesson_instance.date, "%W %D %M") AS date, DATE_FORMAT(lesson_instance.datetime_start, "%k") AS datetime_start, lesson.location, lesson_instance_state.remaining_spots FROM lesson INNER JOIN lesson_instance ON lesson_instance.id_lesson=lesson.id_lesson INNER JOIN lesson_instance_state ON lesson_instance_state.id_lesson_instance=lesson_instance.id_lesson_instance WHERE lesson.description="initiation" ORDER BY lesson_instance.datetime_start ASC'
  // WHERE lesson.description="initiation" => Je n'ai pas mis cette colonne dans le SELECT, et pourtant j'arrive à accéder aux infos. Est-ce normal ?
  connection.query(sql, function (error, results) {
    if (error) throw error;
    console.log(results)
    res.render('index', { title: 'Express', results : results });
  });
});

module.exports = router;
