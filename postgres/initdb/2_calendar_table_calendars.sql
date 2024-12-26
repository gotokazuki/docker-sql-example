\c calendar;

SET session_replication_role = 'replica';
SET search_path TO public;

CREATE TABLE calendars (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  color CHAR(6) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_updated_at
  BEFORE UPDATE ON calendars
  FOR EACH ROW
  EXECUTE FUNCTION update_timestamp();

SET session_replication_role = 'origin';
