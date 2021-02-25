create type Gender as enum('M', 'F', 'O');
CREATE TABLE IF NOT EXISTS Users(
  id       INTEGER  NOT NULL PRIMARY KEY,
  email    text NOT NULL,
  password text NOT NULL,
  birthday DATE  NOT NULL,
  gender   Gender NOT NULL,
  isadmin  BOOLEAN  default false
);

CREATE TABLE IF NOT EXISTS Keywords(
   id   INTEGER  NOT NULL PRIMARY KEY,
   word text not null
);

CREATE TABLE IF NOT EXISTS Movies(
  id                INTEGER  NOT NULL PRIMARY KEY ,
  title             text NOT NULL,
  adult             text NOT NULL,
  homepage          text NOT NULL,
  original_language text NOT NULL,
  overview          text,
  release_date      DATE  NOT NULL,
  runtime           real NOT NULL,
  imdbId            VARCHAR(9) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres(
   id   INTEGER  not null PRIMARY KEY,
   name text not null
);

CREATE TABLE IF NOT EXISTS Moviegenre(
   movieid INTEGER  not null,
   genre   INTEGER  not null,
   primary key(movieid, genre),
   foreign key (genre) references Genres(id),
   foreign key (movieid) references Movies(id)
);

CREATE TABLE IF NOT EXISTS Moviekeyword(
   movieid INTEGER  NOT NULL,
   keyword INTEGER  NOT NULL,
   primary key(movieid, keyword),
   foreign key (keyword) references Keywords(id),
   foreign key (movieid) references Movies(id)
);

CREATE TABLE IF NOT EXISTS Ratings(
   userId    INTEGER  NOT NULL,
   movieId   INTEGER  NOT NULL,
   rating    NUMERIC(3,1) NOT NULL,
   primary key(userId, movieId),
   foreign key (movieId) references Movies(id),
   foreign key (userId) references Users(id)
);

