-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hC11XZ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "doctors" (
    "id" serial PRIMARY KEY NOT NULL,
    "name" text   NOT NULL,
    "specialty" text   NOT NULL
);

CREATE TABLE "patients" (
    "id" serial PRIMARY KEY NOT NULL,
    "name" text   NOT NULL,
    "insurance" text   NOT NULL,
    "birthday" varchar(10) NOT NULL
);

CREATE TABLE "visits" (
    "id" SERIAL PRIMARY KEY NOT NULL,
    "doctor_id" INT FOREIGN KEY REFERENCES "doctors.id" NOT NULL,
    "patient_id" INT FOREIGN KEY REFERENCES "patients.id" NOT NULL,
    "date" VARCHAR(10) NOT NULL
);

CREATE TABLE "diseases" (
    "id" serial PRIMARY KEY NOT NULL,
    "name" text   NOT NULL,
    "description" text NOT NULL
);

CREATE TABLE "diagnoses" (
    "id" serial PRIMARY KEY NOT NULL,
    "visit_id" int FOREIGN KEY REFERENCES "visits.id" NOT NULL,
    "disease_id" int FOREIGN KEY REFERENCES "diseases.id" NOT NULL,
    "notes" text NOT NULL
);





