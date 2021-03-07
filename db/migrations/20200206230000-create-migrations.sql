CREATE TABLE schema_migrations (
  migration varchar(1000),
  migrated_at timestamp NOT NULL DEFAULT NOW(),
  PRIMARY KEY (migration)
);

INSERT INTO schema_migrations (migration, migrated_at)
VALUES
  ('20200205100000-create-athletes.sql', '2020-02-05 10:00:00'),
  ('20200206230000-create-migrations.sql', DEFAULT);
