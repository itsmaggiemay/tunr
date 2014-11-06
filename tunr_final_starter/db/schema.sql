DROP TABLE IF EXISTS playlists_songs CASCADE;
DROP TABLE IF EXISTS songs CASCADE;
DROP TABLE IF EXISTS playlists CASCADE;
DROP TABLE IF EXISTS artists CASCADE;

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  photo_url VARCHAR(512),
  nationality VARCHAR(255),
  genre VARCHAR(255)
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  album VARCHAR(255),
  preview_url VARCHAR(512),
  artist_id INTEGER references artists,
  artwork VARCHAR(255)
);

CREATE TABLE playlists (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE playlists_songs (
  playlist_id INTEGER REFERENCES playlists,
  song_id INTEGER REFERENCES songs
);
