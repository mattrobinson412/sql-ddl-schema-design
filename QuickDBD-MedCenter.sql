-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hC11XZ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "PRACTICES" (
    "PracticeId" serial   NOT NULL,
    "Location" text   NOT NULL,
    CONSTRAINT "pk_PRACTICES" PRIMARY KEY (
        "PracticeId"
     )
);

CREATE TABLE "PRACTICIONERS" (
    "DocId" serial   NOT NULL,
    "PracticeId" int   NOT NULL,
    "FirstName" text   NOT NULL,
    "LastName" text   NOT NULL,
    "PatientId" int   NOT NULL
);

CREATE TABLE "PATIENTS" (
    "PatientId" serial   NOT NULL,
    "FirstName" text   NOT NULL,
    "LastName" text   NOT NULL,
    "ProgId" int   NOT NULL,
    "DocId" int   NOT NULL
);

CREATE TABLE "PROGNOSES" (
    "ProgId" serial   NOT NULL,
    "Name" text   NOT NULL
);

ALTER TABLE "PRACTICES" ADD CONSTRAINT "fk_PRACTICES_PracticeId" FOREIGN KEY("PracticeId")
REFERENCES "PRACTICIONERS" ("PracticeId");

ALTER TABLE "PRACTICIONERS" ADD CONSTRAINT "fk_PRACTICIONERS_DocId_PatientId" FOREIGN KEY("DocId", "PatientId")
REFERENCES "PATIENTS" ("DocId", "PatientId");

ALTER TABLE "PATIENTS" ADD CONSTRAINT "fk_PATIENTS_ProgId" FOREIGN KEY("ProgId")
REFERENCES "PROGNOSES" ("ProgId");

