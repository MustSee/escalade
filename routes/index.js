var express = require('express');
var router = express.Router();
var pool = require('../config/db.js');

// if (pool) {
//   console.log('Connecté à la bdd')
// }

var lesson_instance_sql = `
SELECT * FROM (
  SELECT
    DISTINCT ON (lesson_instance.id_lesson_instance) lesson_instance.id_lesson_instance,
    lesson.description,
    lesson.location,
    lesson_instance.lesson_start,
    lesson_instance_state.updated_at,
    lesson_instance_state.remaining_spots
  FROM lesson
  INNER JOIN lesson_instance ON lesson_instance.id_lesson=lesson.id_lesson
  INNER JOIN lesson_instance_state ON lesson_instance_state.id_lesson_instance=lesson_instance.id_lesson_instance
  WHERE lesson.description = $1::text
  ORDER BY 1, 5 DESC
) AS t
ORDER BY lesson_start`

var lesson_duration_sql = `
SELECT DISTINCT lesson.duration
FROM lesson
WHERE lesson.description = $1::text
`

router.get('/:description(initiation|aptitude)', function(req, res, next) {
  pool.query(lesson_instance_sql, [req.params.description], function (error, lesson_instance_results) {
    if(error) {
      return console.error('error running query', error);
    }
    pool.query(lesson_duration_sql, [req.params.description], function (error, lesson_duration_results) {
      if(error) {
        return console.error('error running query', error);
      }
      console.log(lesson_duration_results);
      var lesson_duration = lesson_duration_results.rows[0].duration; 
      res.render('index',
        { description : req.params.description, results : lesson_instance_results, lesson_duration : lesson_duration}
      );
    });
  });
});

router.get('/', function(req, res, next) {
  res.redirect('/initiation');
})

module.exports = router;
