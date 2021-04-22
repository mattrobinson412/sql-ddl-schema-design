-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/oGb2wd
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "REGION" (
    "RegId" serial   NOT NULL,
    "Region" text   NOT NULL,
    CONSTRAINT "pk_REGION" PRIMARY KEY (
        "RegId"
     )
);

CREATE TABLE "USERS" (
    "UserId" serial   NOT NULL,
    "PreferredRegion" int   NOT NULL,
    CONSTRAINT "pk_USERS" PRIMARY KEY (
        "UserId"
     )
);

CREATE TABLE "POSTS" (
    "PostId" serial   NOT NULL,
    "CatId" int   NOT NULL,
    "UserId" int   NOT NULL,
    "RegId" int   NOT NULL,
    "Location" text   NOT NULL,
    "Title" varchar(30)   NOT NULL,
    "Text" varchar(150)   NOT NULL,
    CONSTRAINT "pk_POSTS" PRIMARY KEY (
        "PostId"
     )
);

CREATE TABLE "CATEGORIES" (
    "CatId" serial   NOT NULL,
    "Name" varchar(20)   NOT NULL,
    CONSTRAINT "pk_CATEGORIES" PRIMARY KEY (
        "CatId"
     )
);

ALTER TABLE "USERS" ADD CONSTRAINT "fk_USERS_PreferredRegion" FOREIGN KEY("PreferredRegion")
REFERENCES "REGION" ("RegId");

ALTER TABLE "POSTS" ADD CONSTRAINT "fk_POSTS_CatId" FOREIGN KEY("CatId")
REFERENCES "CATEGORIES" ("CatId");

ALTER TABLE "POSTS" ADD CONSTRAINT "fk_POSTS_UserId" FOREIGN KEY("UserId")
REFERENCES "USERS" ("UserId");

ALTER TABLE "POSTS" ADD CONSTRAINT "fk_POSTS_RegId" FOREIGN KEY("RegId")
REFERENCES "REGION" ("RegId");

