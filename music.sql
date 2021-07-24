-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
);

CREATE TABLE song_info 
(
  id SERIAL PRIMARY KEY,
  song_id INT FOREIGN KEY REFERENCES "songs.id" NOT NULL,
  artist_id INT FOREIGN KEY REFERENCES "artists.id" NOT NULL,
  producer_id INT FOREIGN KEY REFERENCES "producers.id" NOT NULL,
  album_id INT FOREIGN KEY REFERENCES 'albums.id' NOT NULL
);




