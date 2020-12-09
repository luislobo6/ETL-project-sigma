-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/g1Ab2L
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE "alcohol";
DROP TABLE "education";
DROP TABLE "time";
DROP TABLE "country";
DROP TABLE "category";

SELECT * FROM alcohol;



CREATE TABLE "country" (
    "id" SERIAL  NOT NULL,
    "name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_country" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "category" (
    "id" SERIAL   NOT NULL,
    "category" VARCHAR   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "time" (
    "id" SERIAL   NOT NULL,
    "id_country" int   NOT NULL,
    "id_category" int   NOT NULL,
    "time" float   NOT NULL,
    CONSTRAINT "pk_time_use" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "education" (
    "id" SERIAL   NOT NULL,
    "id_time_use" int   NOT NULL,
    "score" float   NOT NULL,
    CONSTRAINT "pk_education" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "alcohol" (
    "id" SERIAL   NOT NULL,
    "id_time_use" int   NOT NULL,
    "consume_avg" float   NOT NULL,
    CONSTRAINT "pk_alcohol" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "time" ADD CONSTRAINT "fk_time_use_id_country" FOREIGN KEY("id_country")
REFERENCES "country" ("id");

ALTER TABLE "time" ADD CONSTRAINT "fk_time_use_id_category" FOREIGN KEY("id_category")
REFERENCES "category" ("id");

ALTER TABLE "education" ADD CONSTRAINT "fk_education_id_time_use" FOREIGN KEY("id_time_use")
REFERENCES "time" ("id");

ALTER TABLE "alcohol" ADD CONSTRAINT "fk_alcohol_id_time_use" FOREIGN KEY("id_time_use")
REFERENCES "time" ("id");