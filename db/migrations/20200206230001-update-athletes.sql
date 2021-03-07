
ALTER TABLE athletes
ALTER COLUMN identifier TYPE varchar(100);

ALTER TABLE athletes
RENAME COLUMN identified_gender TO gender;

ALTER TABLE athletes
ALTER COLUMN name TYPE varchar(1000);

ALTER TABLE athletes
ALTER COLUMN gender TYPE varchar(100);

BEGIN;
  ALTER TABLE athletes ALTER COLUMN created SET DEFAULT NOW();
  ALTER TABLE athletes ALTER COLUMN modified SET DEFAULT NOW();
  UPDATE athletes SET created = NOW() WHERE created IS NULL;
  UPDATE athletes SET modified = created WHERE modified IS NULL;
  ALTER TABLE athletes ALTER COLUMN created SET NOT NULL;
COMMIT;

BEGIN;
  UPDATE athletes SET identifier = md5(random()::text) WHERE identifier IS NULL;
  ALTER TABLE athletes
  ALTER COLUMN identifier
  SET DEFAULT md5(random()::text);
  ALTER TABLE athletes ADD CONSTRAINT athletes_identifier_key UNIQUE (identifier);
COMMIT;

BEGIN;
  CREATE SEQUENCE athletes_id_seq OWNED BY athletes.id;
  SELECT setval('athletes_id_seq', coalesce(max(id), 0) + 1, false) FROM athletes;
  ALTER TABLE athletes ALTER COLUMN id SET DEFAULT nextval('athletes_id_seq');
COMMIT;




