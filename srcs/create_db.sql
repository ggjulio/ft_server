-- For wordpress
CREATE DATABASE wordpress CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL ON wordpress.* TO username @'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;

-- For Phpmyadmin
CREATE USER phpadmin @'localhost' IDENTIFIED BY 'phpadmin';
GRANT ALL PRIVILEGES ON *.* TO  phpadmin @'localhost' WITH GRANT OPTION;
