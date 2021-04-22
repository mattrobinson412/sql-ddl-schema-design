-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/pFZY14
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "TEAMS" (
    "TeamId" serial   NOT NULL,
    "SeasonId" int   NOT NULL,
    "Name" text   NOT NULL,
    CONSTRAINT "pk_TEAMS" PRIMARY KEY (
        "TeamId"
     )
);

CREATE TABLE "STATS" (
    "SeasonId" int   NOT NULL,
    "GameId" int   NOT NULL,
    "PlayerId" int   NOT NULL,
    "Goals" int   NOT NULL
);

CREATE TABLE "PLAYERS" (
    "PlayerId" serial   NOT NULL,
    "SeasonId" int   NOT NULL,
    "TeamId" int   NOT NULL,
    CONSTRAINT "pk_PLAYERS" PRIMARY KEY (
        "PlayerId"
     )
);

CREATE TABLE "REFEREES" (
    "RefId" serial   NOT NULL,
    "SeasonId" int   NOT NULL,
    "GameId" int   NOT NULL,
    CONSTRAINT "pk_REFEREES" PRIMARY KEY (
        "RefId"
     )
);

CREATE TABLE "MATCHES" (
    "GameId" serial   NOT NULL,
    "SeasonId" int   NOT NULL,
    "HomeTeamId" int   NOT NULL,
    "HomeTeamScore" int   NOT NULL,
    "AwayTeamScore" int   NOT NULL,
    "AwayTeamId" int   NOT NULL,
    CONSTRAINT "pk_MATCHES" PRIMARY KEY (
        "GameId"
     )
);

CREATE TABLE "DATES" (
    "SeasonId" serial   NOT NULL,
    "StartDate" date   NOT NULL,
    "EndDate" date   NOT NULL,
    CONSTRAINT "pk_DATES" PRIMARY KEY (
        "SeasonId"
     )
);

CREATE TABLE "RANKINGS" (
    "RankId" serial   NOT NULL,
    "SeasonId" int   NOT NULL,
    "TeamId" int   NOT NULL,
    CONSTRAINT "pk_RANKINGS" PRIMARY KEY (
        "RankId"
     )
);

ALTER TABLE "TEAMS" ADD CONSTRAINT "fk_TEAMS_SeasonId" FOREIGN KEY("SeasonId")
REFERENCES "DATES" ("SeasonId");

ALTER TABLE "STATS" ADD CONSTRAINT "fk_STATS_SeasonId" FOREIGN KEY("SeasonId")
REFERENCES "DATES" ("SeasonId");

ALTER TABLE "STATS" ADD CONSTRAINT "fk_STATS_GameId" FOREIGN KEY("GameId")
REFERENCES "MATCHES" ("GameId");

ALTER TABLE "STATS" ADD CONSTRAINT "fk_STATS_PlayerId" FOREIGN KEY("PlayerId")
REFERENCES "PLAYERS" ("PlayerId");

ALTER TABLE "PLAYERS" ADD CONSTRAINT "fk_PLAYERS_SeasonId" FOREIGN KEY("SeasonId")
REFERENCES "DATES" ("SeasonId");

ALTER TABLE "PLAYERS" ADD CONSTRAINT "fk_PLAYERS_TeamId" FOREIGN KEY("TeamId")
REFERENCES "TEAMS" ("TeamId");

ALTER TABLE "REFEREES" ADD CONSTRAINT "fk_REFEREES_SeasonId" FOREIGN KEY("SeasonId")
REFERENCES "DATES" ("SeasonId");

ALTER TABLE "REFEREES" ADD CONSTRAINT "fk_REFEREES_GameId" FOREIGN KEY("GameId")
REFERENCES "MATCHES" ("GameId");

ALTER TABLE "MATCHES" ADD CONSTRAINT "fk_MATCHES_SeasonId" FOREIGN KEY("SeasonId")
REFERENCES "DATES" ("SeasonId");

ALTER TABLE "MATCHES" ADD CONSTRAINT "fk_MATCHES_HomeTeamId" FOREIGN KEY("HomeTeamId")
REFERENCES "TEAMS" ("TeamId");

ALTER TABLE "MATCHES" ADD CONSTRAINT "fk_MATCHES_AwayTeamId" FOREIGN KEY("AwayTeamId")
REFERENCES "TEAMS" ("TeamId");

ALTER TABLE "RANKINGS" ADD CONSTRAINT "fk_RANKINGS_SeasonId" FOREIGN KEY("SeasonId")
REFERENCES "DATES" ("SeasonId");

ALTER TABLE "RANKINGS" ADD CONSTRAINT "fk_RANKINGS_TeamId" FOREIGN KEY("TeamId")
REFERENCES "TEAMS" ("TeamId");

