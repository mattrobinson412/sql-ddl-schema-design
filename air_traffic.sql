-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger INT NOT NULL REFERENCES passengers,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INT NOT NULL REFERENCES airlines,
  from_city INT NOT NULL REFERENCES cities,
  from_country INT NOT NULL REFERENCES countries,
  to_city INT NOT NULL REFERENCES cities,
  to_country INT NOT NULL REFERENCES countries,
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  ticket INT REFERENCES tickets
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country INT NOT NULL REFERENCES countries
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  country TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

INSERT INTO tickets
  (seat, departure, arriva)
VALUES
  ('33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  ('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  ('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00'
  ('20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  ('23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  ( '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  ( '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  ( '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  ( '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  ( '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00');


INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Jennifer', 'Finch'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes'),

INSERT INTO cities
  (cities)
VALUES
  ('Washington DC'),
  ('Tokyo'),
  ('Los Angeles'),
  ('Seattle'),
  ('Paris'),
  ('Dubai'),
  ('New York'),
  ('Cedar Rapids'),
  ('Charlotte'),
  ('Sao Paolo'),

INSERT INTO cities
  (cities)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('United'),
  ('American Airlines'),
  ('Avianca Brasil');