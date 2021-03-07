
CREATE SEQUENCE competitions_id_seq;
CREATE TABLE competitions (
  id SERIAL, -- pseudo type of int DEFAULT nextval('competitions_id_seq'),
  identifier varchar(100) NOT NULL DEFAULT md5(random()::text),
  created timestamp NOT NULL DEFAULT NOW(),
  modified timestamp NOT NULL DEFAULT NOW(),
  name varchar(1000),
  venue varchar(1000),
  start_date date,
  end_date date,
  PRIMARY KEY (id),
  UNIQUE (identifier)
);

CREATE SEQUENCE registrations_id_seq;
CREATE TABLE registrations (
  id int DEFAULT nextval('registrations_id_seq'),
  identifier varchar(100) NOT NULL DEFAULT md5(random()::text),
  created timestamp NOT NULL DEFAULT NOW(),
  modified timestamp NOT NULL DEFAULT NOW(),
  athlete_id int REFERENCES athletes (id),
  competition_id int REFERENCES competitions (id),
  age int,
  gender varchar(100),
  PRIMARY KEY (id),
  UNIQUE (identifier),
  UNIQUE (athlete_id, competition_id)
);

INSERT INTO schema_migrations (migration)
VALUES
  ('20200206230002-create-competitions.sql');
