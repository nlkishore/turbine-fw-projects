-- -----------------------------------------------------------------------
-- mysql SQL script for schema kishore
-- -----------------------------------------------------------------------



SET FOREIGN_KEY_CHECKS = 0;

drop table if exists GTP_PERMISSION;
drop table if exists GTP_ROLE;
drop table if exists GTP_GROUP;
drop table if exists GTP_ROLE_PERMISSION;
drop table if exists GTP_USER;
drop table if exists GTP_GROUP_ROLE;
drop table if exists GTP_USER_GROUP_ROLE;

# -----------------------------------------------------------------------
# GTP_PERMISSION
# -----------------------------------------------------------------------
CREATE TABLE GTP_PERMISSION
(
    PERMISSION_ID INTEGER NOT NULL AUTO_INCREMENT,
    PERMISSION_NAME VARCHAR(64) NOT NULL,
    PRIMARY KEY(PERMISSION_ID),
    UNIQUE GTP_PERMISSION_UQ_1 (PERMISSION_NAME)
);


# -----------------------------------------------------------------------
# GTP_ROLE
# -----------------------------------------------------------------------
CREATE TABLE GTP_ROLE
(
    ROLE_ID INTEGER NOT NULL AUTO_INCREMENT,
    ROLE_NAME VARCHAR(64) NOT NULL,
    PRIMARY KEY(ROLE_ID),
    UNIQUE GTP_ROLE_UQ_1 (ROLE_NAME)
);


# -----------------------------------------------------------------------
# GTP_GROUP
# -----------------------------------------------------------------------
CREATE TABLE GTP_GROUP
(
    GROUP_ID INTEGER NOT NULL AUTO_INCREMENT,
    GROUP_NAME VARCHAR(64) NOT NULL,
    PRIMARY KEY(GROUP_ID),
    UNIQUE GTP_GROUP_UQ_1 (GROUP_NAME)
);


# -----------------------------------------------------------------------
# GTP_ROLE_PERMISSION
# -----------------------------------------------------------------------
CREATE TABLE GTP_ROLE_PERMISSION
(
    ROLE_ID INTEGER NOT NULL,
    PERMISSION_ID INTEGER NOT NULL,
    PRIMARY KEY(ROLE_ID, PERMISSION_ID)
);


# -----------------------------------------------------------------------
# GTP_USER
# -----------------------------------------------------------------------
CREATE TABLE GTP_USER
(
    USER_ID INTEGER NOT NULL AUTO_INCREMENT,
    LOGIN_NAME VARCHAR(64) NOT NULL,
    PASSWORD_VALUE VARCHAR(16) NOT NULL,
    FIRST_NAME VARCHAR(64) NOT NULL,
    LAST_NAME VARCHAR(64) NOT NULL,
    EMAIL VARCHAR(64),
    CONFIRM_VALUE VARCHAR(16),
    MODIFIED_DATE DATETIME,
    CREATED DATETIME,
    LAST_LOGIN DATETIME,
    OBJECTDATA MEDIUMBLOB,
    PRIMARY KEY(USER_ID),
    UNIQUE GTP_USER_UQ_1 (LOGIN_NAME)
);


# -----------------------------------------------------------------------
# GTP_GROUP_ROLE
# -----------------------------------------------------------------------
CREATE TABLE GTP_GROUP_ROLE
(
    GROUP_ID INTEGER NOT NULL,
    ROLE_ID INTEGER NOT NULL,
    PRIMARY KEY(GROUP_ID, ROLE_ID)
);


# -----------------------------------------------------------------------
# GTP_USER_GROUP_ROLE
# -----------------------------------------------------------------------
CREATE TABLE GTP_USER_GROUP_ROLE
(
    USER_ID INTEGER NOT NULL,
    GROUP_ID INTEGER NOT NULL,
    ROLE_ID INTEGER NOT NULL,
    PRIMARY KEY(USER_ID, GROUP_ID, ROLE_ID)
);

ALTER TABLE GTP_ROLE_PERMISSION
    ADD CONSTRAINT GTP_ROLE_PERMISSION_FK_1
    FOREIGN KEY (ROLE_ID)
    REFERENCES GTP_ROLE (ROLE_ID);

ALTER TABLE GTP_ROLE_PERMISSION
    ADD CONSTRAINT GTP_ROLE_PERMISSION_FK_2
    FOREIGN KEY (PERMISSION_ID)
    REFERENCES GTP_PERMISSION (PERMISSION_ID);

ALTER TABLE GTP_GROUP_ROLE
    ADD CONSTRAINT GTP_GROUP_ROLE_FK_1
    FOREIGN KEY (GROUP_ID)
    REFERENCES GTP_GROUP (GROUP_ID);

ALTER TABLE GTP_GROUP_ROLE
    ADD CONSTRAINT GTP_GROUP_ROLE_FK_2
    FOREIGN KEY (ROLE_ID)
    REFERENCES GTP_ROLE (ROLE_ID);

ALTER TABLE GTP_USER_GROUP_ROLE
    ADD CONSTRAINT GTP_USER_GROUP_ROLE_FK_1
    FOREIGN KEY (USER_ID)
    REFERENCES GTP_USER (USER_ID);

ALTER TABLE GTP_USER_GROUP_ROLE
    ADD CONSTRAINT GTP_USER_GROUP_ROLE_FK_2
    FOREIGN KEY (GROUP_ID)
    REFERENCES GTP_GROUP (GROUP_ID);

ALTER TABLE GTP_USER_GROUP_ROLE
    ADD CONSTRAINT GTP_USER_GROUP_ROLE_FK_3
    FOREIGN KEY (ROLE_ID)
    REFERENCES GTP_ROLE (ROLE_ID);


