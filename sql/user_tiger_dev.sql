CREATE USER 'tiger_dev'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'tiger_dev'@'localhost';
FLUSH PRIVILEGES;