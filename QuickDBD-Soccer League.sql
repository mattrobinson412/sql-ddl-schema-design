-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/pFZY14
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "teams" (
    "id" serial PRIMARY KEY NOT NULL,
    "city" text   NOT NULL,
    "name" text   NOT NULL,
);

CREATE TABLE "referees" (
    "id" SERIAL PRIMARY KEY NOT NULL,
    "name" text NOT NULL
);

CREATE TABLE "season" (
    "id" SERIAL PRIMARY KEY NOT NULL,
    start_date VARCHAR(10) NOT NULL,
    end_date VARCHAR(10) NOT NULL

CREATE TABLE "matches" (
    "id" SERIAL PRIMARY KEY NOT NULL,
    "home_team_id" INT FOREIGN KEY REFERENCES "teams.id" NOT NULL,
    "away_team_id" INT FOREIGN KEY REFERENCES "teams.id" NOT NULL,
    "location" text NOT NULL,
    "date" VARCHAR(10) NOT NULL,
    start_time VARCHAR(5) NOT NULL,
    season_id INT FOREIGN KEY REFERENCES "season.id" NOT NULL,
    head_referee_id INT FOREIGN KEY REFERENCES "referees.id" NOT NULL,
    assistant_referee_1_id INT FOREIGN KEY REFERENCES "referees.id" NOT NULL,
    assistant_referee_2_id INT FOREIGN KEY REFERENCES "referees.id" NOT NULL
);

CREATE TABLE "players" (
    "id" SERIAL PRIMARY KEY NOT NULL,
    "name" text NOT NULL,
    "birthday" VARCHAR(10) NOT NULL,
    "height" int NOT NULL,
    "current_team_id" INT FOREIGN KEY REFERENCES "teams.id" NOT NULL
);

CREATE TABLE "goals" (
    "id" SERIAL PRIMARY KEY NOT NULL,
    "player_id" INT FOREIGN KEY REFERENCES "players.id" NOT NULL,
    "match_id" INT FOREIGN KEY REFERENCES 'matches.id' NOT NULL
);



CREATE TABLE "lineups" (
    "id" SERIAL PRIMARY KEY NOT NULL,
    "player_id" INT FOREIGN KEY REFERENCES "players.id" NOT NULL,
    "match_id" INT FOREIGN KEY REFERENCES "matches.id" NOT NULL,
    "team_id" INT FOREIGN KEY REFERENCES "teams.id" NOT NULL
);


CREATE TABLE "results" (
    "id" SERIAL PRIMARY KEY NOT NULL,
    "team_id" INT FOREIGN KEY REFERENCES "teams.id" NOT NULL,
    "match_id" INT FOREIGN KEY REFERENCES "matches.id" NOT NULL,
    "result" text NOT NULL
 );