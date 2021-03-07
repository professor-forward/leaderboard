CREATE TABLE schema_migrations (
  migration varchar(1000),
  migrated_at timestamp NOT NULL DEFAULT NOW(),
  PRIMARY KEY (migration)
);

INSERT INTO schema_migrations (migration)
VALUES
  ('20200205100000-create-athletes.sql'),
  ('20200206230000-create-migrations.sql'),
  ('20200206230001-update-athletes.sql'),
  ('20200206230002-create-competitions.sql')
  ;

CREATE SEQUENCE athletes_id_seq;
CREATE TABLE athletes (
  id int DEFAULT nextval('athletes_id_seq'),
  identifier varchar(100) NOT NULL DEFAULT md5(random()::text),
  created timestamp NOT NULL DEFAULT NOW(),
  modified timestamp NOT NULL DEFAULT NOW(),
  name varchar(1000),
  dob date,
  gender varchar(100),
  PRIMARY KEY (id),
  UNIQUE (identifier)
);

CREATE SEQUENCE competitions_id_seq;
CREATE TABLE competitions (
  id int DEFAULT nextval('competitions_id_seq'),
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
