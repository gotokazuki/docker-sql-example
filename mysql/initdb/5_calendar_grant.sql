CREATE USER 'docker'@'%' IDENTIFIED BY 'docker';
GRANT ALL PRIVILEGES ON calendar.* TO 'docker'@'%' WITH GRANT OPTION;
