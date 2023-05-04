CREATE TABLE tbl_users(
    id_user INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    email VARCHAR(30),
    password_user VARBINARY(64),
    status_user ENUM('active', 'inactive'),
    id_role INT UNSIGNED,
    id_positions INT UNSIGNED,
    PRIMARY KEY(id_user)
);

CREATE TABLE tbl_role (
    id_role INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name_role VARCHAR(50) NOT NULL,
    status_role ENUM('active', 'inactive') NOT NULL,
    PRIMARY KEY (id_role)
);

CREATE TABLE tbl_positions (
    id_positions INT UNSIGNED NOT NULL AUTO_INCREMENT,
    positions_user VARCHAR(50) NOT NULL,
    email VARCHAR(30),
    positions_name VARCHAR(40),
    positions_password VARBINARY(64),
    status_positions ENUM('active', 'inactive') NOT NULL,
    id_role INT UNSIGNED,
    PRIMARY KEY (id_positions)
);

ALTER TABLE tbl_users ADD FOREIGN KEY (id_role) REFERENCES tbl_role (id_role);
ALTER TABLE tbl_users ADD FOREIGN KEY (id_positions) REFERENCES tbl_positions (id_positions);
ALTER TABLE tbl_positions ADD FOREIGN KEY (id_role) REFERENCES tbl_role (id_role);

INSERT INTO tbl_role (name_role, status_role)
VALUES
("Administrador", "active"),
("Usuario", "active"),
("Invitado", "inactive"),
("Supervisor", "inactive"),
("Desarrollador", "active");

INSERT INTO tbl_positions (positions_user, email, positions_name, positions_password, status_positions, id_role)
VALUES
("johndoe", "johndoe@example.com", "John Doe", "mysecretpassword", "active", 1),
("janedoe", "janedoe@example.com", "Jane Doe", "mypassword123", "active", 2),
("bobsmith", "bobsmith@example.com", "Bob Smith", "password", "inactive", 3),
("sarahjones", "sarahjones@example.com", "Sarah Jones", "sarahspassword", "active", 4),
("mikebrown", "mikebrown@example.com", "Mike Brown", "password123", "inactive", 5);

INSERT INTO tbl_users (username, email, password_user, status_user, id_role, id_positions)
VALUES
("johndoe", "johndoe@example.com", SHA2("mysecretpassword", 256), "active", 1, 1),
("janedoe", "janedoe@example.com", SHA2("mypassword123", 256), "inactive", 2, 2),
("bobsmith", "bobsmith@example.com", SHA2("password", 256), "active", 1, 3),
("sarahjones", "sarahjones@example.com", SHA2("sarahspassword", 256), "active", 2, 4),
("mikebrown", "mikebrown@example.com", SHA2("password123", 256), "inactive", 3, 5),
("joannado", "joannado@example.com", SHA2("secretpassword", 256), "active", 1, 1),
("jameseflin", "jamesf@example.com", SHA2("myword123", 256), "inactive", 2, 2),
("barbarasmith", "babssmith@example.com", SHA2("password2", 256), "active", 1, 3),
("shawnjones", "shwnjones@example.com", SHA2("shwpassword", 256), "active", 2, 4),
("mariabrown", "mariabrown@example.com", SHA2("pass123", 256), "inactive", 3, 5),
("jeremy", "jeremy@example.com", SHA2("secret", 256), "active", 1, 1),
("janiceb", "jnice@example.com", SHA2("myword125", 256), "inactive", 2, 2),
("alissonswift", "taylor@example.com", SHA2("tay123", 256), "inactive", 3, 5),
("josel", "josel@example.com", SHA2("joselword", 256), "active", 2, 4),
("carlosperez", "carlosp@example.com", SHA2("pass15", 256), "active", 1, 3);

SELECT tbl_users.username, tbl_users.email, tbl_users.password_user
FROM tbl_users
WHERE tbl_users.status_user = 'active';