INSERT INTO lesson (location, description, duration) VALUES
('beaujon', 'initiation', 1),
('ladoumegue', 'aptitude', 2),
('beaujon', 'aptitude', 2),
('ladoumegue', 'initiation', 1);

INSERT INTO lesson_instance (lesson_start, id_lesson) VALUES
('2017-09-04 18:00:00', 1),
('2017-09-04 17:00:00', 2),
('2017-09-05 16:00:00', 1),
('2017-09-16 19:00:00', 3),
('2017-07-17 14:00:00', 3),
('2017-09-06 14:00:00', 4),
('2017-09-08 14:10:00', 1),
('2017-09-09 14:10:00', 2),
('2017-09-10 14:10:00', 3),
('2017-09-11 14:10:00', 4);


INSERT INTO lesson_instance_state (remaining_spots, created_at, updated_at, id_lesson_instance) VALUES
(0, '2017-09-01 12:00:00', '2017-09-01 12:00:00', 1),
(4, '2017-09-01 12:00:00', '2017-09-01 12:00:00', 2),
(0, '2017-09-01 13:00:00', '2017-09-01 14:00:00', 3),
(19, '2017-09-01 11:00:00', '2017-09-01 13:00:00', 4),
(1, '2017-09-02 11:00:00', '2017-09-02 15:00:00', 3),
(18, '2017-09-02 13:00:00', '2017-09-02 14:00:00', 4),
(0, '2017-09-02 10:00:00', '2017-09-02 11:00:00', 6),
(2, '2017-09-02 10:00:00', '2017-09-02 11:00:00', 7),
(6, '2017-09-02 10:00:00', '2017-09-02 11:00:00', 8),
(0, '2017-09-02 10:00:00', '2017-09-02 11:00:00', 9),
(8, '2017-09-02 10:00:00', '2017-09-02 11:00:00', 10);


-- queries SQL avec des JOINS

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
ORDER BY 1, 5 DESC;
