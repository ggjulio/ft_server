-- For wordpress
CREATE DATABASE wordpress CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL ON wordpress.* TO wordpressuser @'localhost' IDENTIFIED BY 'wordpress';
FLUSH PRIVILEGES;

-- For Phpmyadmin
CREATE USER 'phpadmin'@'localhost' IDENTIFIED BY 'mypassword';
GRANT ALL PRIVILEGES ON *.* TO 'phpadmin'@'localhost' WITH GRANT OPTION;
EXIT;