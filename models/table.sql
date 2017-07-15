DROP DATABASE IF EXISTS escalade;
CREATE DATABASE escalade;

USE escalade;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS lesson;
DROP TABLE IF EXISTS lesson_instance;
DROP TABLE IF EXISTS lesson_instance_state;
SET FOREIGN_KEY_CHECKS = 1;
-- On dirait que la dernière ligne ci-dessus n'est pas prise en compte !

CREATE TABLE lesson (
  id_lesson INT NOT NULL AUTO_INCREMENT,
  location VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NUlL,
  duration INT NOT NULL,
  CONSTRAINT pk_id_lesson PRIMARY KEY (id_lesson)
)ENGINE InnoDB DEFAULT CHARSET=utf8;

-- ALTER TABLE lesson_instance DROP FOREIGN KEY fk_id_lesson;
CREATE TABLE lesson_instance (
  id_lesson_instance INT NOT NULL AUTO_INCREMENT,
  date DATE NOT NULL,
  datetime_start DATETIME NOT NULL,
  id_lesson INT NOT NULL,
  CONSTRAINT pk_id_lesson_instance PRIMARY KEY (id_lesson_instance),
  CONSTRAINT fk_id_lesson FOREIGN KEY (id_lesson) REFERENCES lesson(id_lesson)
)ENGINE InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE lesson_instance_state (
  id_lesson_instance_state INT NOT NULL AUTO_INCREMENT,
  remaining_spots INT,
  created_at DATETIME NOT NULL,
  datetime_update DATETIME NOT NULL,
  id_lesson_instance INT NOT NULL,
  CONSTRAINT pk_id_lesson_instance_state PRIMARY KEY (id_lesson_instance_state),
  CONSTRAINT fk_id_lesson_instance FOREIGN KEY (id_lesson_instance) REFERENCES lesson_instance(id_lesson_instance)
)ENGINE InnoDB DEFAULT CHARSET=utf8;
