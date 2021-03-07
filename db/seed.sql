INSERT INTO athletes (name, gender, dob)
VALUES
('Andrew', 'm', '1975-12-01'),
('Ayana', 'f', '1998-06-11'),
('Hayden', 'm', '1996-07-24'),
('August', 'm', '1999-09-09');

INSERT INTO competitions (name, venue, start_date, end_date)
VALUES
('Bytown Closed 2020', 'CrossFit Bytown', '2019-10-01', DEFAULT),
('The Open 2020', 'online', '2019-10-01', '2019-12-01');

INSERT INTO registrations (athlete_id, competition_id, age, gender)
SELECT
    (SELECT id FROM athletes WHERE name = 'Andrew') AS athlete_id,
    (SELECT id FROM competitions WHERE name = 'Bytown Closed 2020') AS competition_id,
    40,
    'm';

INSERT INTO registrations (athlete_id, competition_id, age, gender)
SELECT
    (SELECT id FROM athletes WHERE name = 'Ayana') AS athlete_id,
    (SELECT id FROM competitions WHERE name = 'Bytown Closed 2020') AS competition_id,
    40,
    'f';

INSERT INTO registrations (athlete_id, competition_id, age, gender)
SELECT
    (SELECT id FROM athletes WHERE name = 'Hayden') AS athlete_id,
    (SELECT id FROM competitions WHERE name = 'Bytown Closed 2020') AS competition_id,
    10,
    'm';