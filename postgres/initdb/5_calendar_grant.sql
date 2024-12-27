CREATE USER docker WITH PASSWORD 'docker';
GRANT CONNECT ON DATABASE calendar TO docker;

\c calendar

GRANT ALL ON ALL TABLES IN SCHEMA public TO docker;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO docker;
GRANT ALL ON ALL FUNCTIONS IN SCHEMA public TO docker;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO docker;
