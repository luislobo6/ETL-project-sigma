-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/g1Ab2L
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "country" (
    "id" int   NOT NULL,
    "name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_country" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "category" (
    "id" int   NOT NULL,
    "category" VARCHAR   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "time_use" (
    "id" int   NOT NULL,
    "id_country" int   NOT NULL,
    "id_category" int   NOT NULL,
    "time" float   NOT NULL,
    CONSTRAINT "pk_time_use" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "education" (
    "id" int   NOT NULL,
    "id_time_use" int   NOT NULL,
    "score" float   NOT NULL,
    CONSTRAINT "pk_education" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "alcohol" (
    "id" int   NOT NULL,
    "id_time_use" int   NOT NULL,
    "consume_avg" float   NOT NULL,
    CONSTRAINT "pk_alcohol" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "time_use" ADD CONSTRAINT "fk_time_use_id_country" FOREIGN KEY("id_country")
REFERENCES "country" ("id");

ALTER TABLE "time_use" ADD CONSTRAINT "fk_time_use_id_category" FOREIGN KEY("id_category")
REFERENCES "category" ("id");

ALTER TABLE "education" ADD CONSTRAINT "fk_education_id_time_use" FOREIGN KEY("id_time_use")
REFERENCES "time_use" ("id");

ALTER TABLE "alcohol" ADD CONSTRAINT "fk_alcohol_id_time_use" FOREIGN KEY("id_time_use")
REFERENCES "time_use" ("id");

