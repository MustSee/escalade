INSERT INTO `lesson` (`id_lesson`, `location`, `description`, `duration`) VALUES (NULL, 'beaujon', 'initiation', '1'), (NULL, 'ladoumegue', 'aptitude', '2'),(NULL, 'beaujon', 'aptitude', '2'), (NULL, 'ladoumegue', 'initiation', '1');

INSERT INTO `lesson_instance` (`id_lesson_instance`, `date`, `datetime_start`, `id_lesson`) VALUES (NULL, '2017-09-04', '2017-09-04 18:00:00', '1'), (NULL, '2017-09-04', '2017-09-04 17:00:00', '2'), (NULL, '2017-09-05', '2017-09-05 16:00:00', '1'), (NULL, '2017-09-05', '2017-09-16 19:00:00', '3'), (NULL, '2017-09-06', '2017-07-17 14:00:00', '3'),(NULL, '2017-09-06', '2017-09-06 14:00:00', '4');

INSERT INTO `lesson_instance_state` (`id_lesson_instance_state`, `remaining_spots`, `created_at`, `datetime_update`, `id_lesson_instance`) VALUES (NULL, '0', '2017-09-01 12:00:00', '2017-09-01 12:00:00', '1'), (NULL, '4', '2017-09-01 12:00:00', '2017-09-01 12:00:00', '2'), (NULL, '0', '2017-09-01 13:00:00', '2017-09-01 14:00:00', '3'),
(NULL, '19', '2017-09-01 11:00:00', '2017-09-01 13:00:00', '4'), (NULL, '1', '2017-09-02 11:00:00', '2017-09-02 15:00:00', '3'), (NULL, '18', '2017-09-02 13:00:00', '2017-09-02 14:00:00', '4'), (NULL, '3', '2017-09-02 10:00:00', '2017-09-02 11:00:00', '6');

-- queries SQL avec des JOINS

-- entre lesson et lesson_instance
SELECT lesson_instance.date, lesson_instance.datetime_start, lesson.location FROM lesson_instance INNER JOIN lesson ON lesson_instance.id_lesson=lesson.id_lesson;

SELECT lesson_instance.date, lesson_instance.datetime_start, lesson.location, lesson_instance_state.remaining_spots FROM lesson INNER JOIN lesson_instance ON lesson_instance.id_lesson=lesson.id_lesson INNER JOIN lesson_instance_state ON lesson_instance_state.id_lesson_instance=lesson_instance.id_lesson_instance;
