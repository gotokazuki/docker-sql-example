\c calendar;

SET session_replication_role = 'replica';
SET search_path TO public;

CREATE TABLE events (
  id SERIAL PRIMARY KEY,
  calendar_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  participants TEXT,
  location TEXT,
  color_override CHAR(6),
  starts_at TIMESTAMP NOT NULL,
  ends_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE events
  ADD CONSTRAINT fk_events_calendars FOREIGN KEY (calendar_id) REFERENCES calendars(id)
  ON DELETE RESTRICT ON UPDATE CASCADE;

CREATE INDEX idx_fk_calendar_id ON events (calendar_id);

CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_updated_at
  BEFORE UPDATE ON events
  FOR EACH ROW
  EXECUTE FUNCTION update_timestamp();

SET session_replication_role = 'origin';
