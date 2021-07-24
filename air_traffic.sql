-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
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
  city TEXT NOT NULL
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
  (seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ('33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', "New York", "USA", "Los Angeles", "USA"),
  ('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', "New York", "USA", "Los Angeles", "USA"),
  ('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', "New York", "USA", "Los Angeles", "USA"),
  ('20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', "New York", "USA", "Los Angeles", "USA"),
  ('23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', "New York", "USA", "Los Angeles", "USA"),
  ( '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', "New York", "USA", "Los Angeles", "USA"),
  ( '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', "New York", "USA", "Los Angeles", "USA"),
  ( '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', "New York", "USA", "Los Angeles", "USA"),
  ( '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', "New York", "USA", "Los Angeles", "USA"),
  ( '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', "New York", "USA", "Los Angeles", "USA");


INSERT INTO passengers
  (first_name, last_name, ticket)
VALUES
  ('Jennifer', 'Finch', 2),
  ('Thadeus', 'Gathercoal', 2),
  ('Sonja', 'Pauley', 2),
  ('Jennifer', 'Finch', 2),
  ('Waneta', 'Skeleton', 2),
  ('Thadeus', 'Gathercoal', 2),
  ('Berkie', 'Wycliff', 2),
  ('Alvin', 'Leathes', 2),
  ('Berkie', 'Wycliff', 2),
  ('Cory', 'Squibbes', 2);

INSERT INTO cities
  (city)
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
  ('Sao Paolo');

INSERT INTO countries
  (country)
VALUES
  ('USA'),
  ('Japan')

INSERT INTO airlines
  (airline)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('United'),
  ('American Airlines'),
  ('Avianca Brasil');