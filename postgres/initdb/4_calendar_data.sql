\c calendar;

SET session_replication_role = 'replica';
SET search_path TO public;

BEGIN;

INSERT INTO events (calendar_id, title, description, starts_at, ends_at) VALUES
(1, 'My first event', 'This is my first event', '2020-01-01 00:00:00', '2020-01-01 01:00:00'),
(1, 'My second event', 'This is my second event', '2020-01-02 00:00:00', '2020-01-02 01:00:00'),
(1, 'My third event', 'This is my third event', '2020-01-03 00:00:00', '2020-01-03 01:00:00'),
(2, 'My fourth event', 'This is my fourth event', '2020-01-04 00:00:00', '2020-01-04 01:00:00'),
(2, 'My fifth event', 'This is my fifth event', '2020-01-05 00:00:00', '2020-01-05 01:00:00'),
(3, 'My sixth event', 'This is my sixth event', '2020-01-06 00:00:00', '2020-01-06 01:00:00'),
(3, 'My seventh event', 'This is my seventh event', '2020-01-07 00:00:00', '2020-01-07 01:00:00');

INSERT INTO calendars (name, color) VALUES
('My first calendar', 'ff0000'),
('My second calendar', '00ff00'),
('My third calendar', '0000ff');

COMMIT;

SET session_replication_role = 'origin';
