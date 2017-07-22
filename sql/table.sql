DROP DATABASE IF EXISTS escalade;
CREATE DATABASE escalade;

\c escalade;

DROP TABLE IF EXISTS lesson_instance_state;
DROP TABLE IF EXISTS lesson_instance;
DROP TABLE IF EXISTS lesson;
DROP TABLE IF EXISTS news;

CREATE TABLE lesson (
  id_lesson SERIAL PRIMARY KEY,
  location VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  duration INTEGER NOT NULL
);

CREATE TABLE lesson_instance (
  id_lesson_instance SERIAL PRIMARY KEY,
  lesson_start TIMESTAMP NOT NULL,
  id_lesson INTEGER REFERENCES lesson
);

CREATE TABLE lesson_instance_state (
  id_lesson_instance_state SERIAL PRIMARY KEY,
  remaining_spots INTEGER,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  id_lesson_instance INTEGER REFERENCES lesson_instance
);

CREATE TABLE infos (
  id_news SERIAL PRIMARY KEY,
  news TEXT,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);
