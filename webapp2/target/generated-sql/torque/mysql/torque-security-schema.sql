-- -----------------------------------------------------------------------
-- mysql SQL script for schema turbine
-- -----------------------------------------------------------------------



SET FOREIGN_KEY_CHECKS = 0;

drop table if exists TURBINE_PERMISSION;
drop table if exists TURBINE_ROLE;
drop table if exists TURBINE_GROUP;
drop table if exists TURBINE_ROLE_PERMISSION;
drop table if exists TURBINE_USER;
drop table if exists TURBINE_USER_GROUP_ROLE;

# -----------------------------------------------------------------------
# TURBINE_PERMISSION
# -----------------------------------------------------------------------
CREATE TABLE TURBINE_PERMISSION
(
    PERMISSION_ID INTEGER NOT NULL AUTO_INCREMENT,
    PERMISSION_NAME VARCHAR(64) NOT NULL,
    PRIMARY KEY(PERMISSION_ID),
    UNIQUE TURBINE_PERMISSION_UQ_1 (PERMISSION_NAME)
);


# -----------------------------------------------------------------------
# TURBINE_ROLE
# -----------------------------------------------------------------------
CREATE TABLE TURBINE_ROLE
(
    ROLE_ID INTEGER NOT NULL AUTO_INCREMENT,
    ROLE_NAME VARCHAR(64) NOT NULL,
    PRIMARY KEY(ROLE_ID),
    UNIQUE TURBINE_ROLE_UQ_1 (ROLE_NAME)
);


# -----------------------------------------------------------------------
# TURBINE_GROUP
# -----------------------------------------------------------------------
CREATE TABLE TURBINE_GROUP
(
    GROUP_ID INTEGER NOT NULL AUTO_INCREMENT,
    GROUP_NAME VARCHAR(64) NOT NULL,
    PRIMARY KEY(GROUP_ID),
    UNIQUE TURBINE_GROUP_UQ_1 (GROUP_NAME)
);


# -----------------------------------------------------------------------
# TURBINE_ROLE_PERMISSION
# -----------------------------------------------------------------------
CREATE TABLE TURBINE_ROLE_PERMISSION
(
    ROLE_ID INTEGER NOT NULL,
    PERMISSION_ID INTEGER NOT NULL,
    PRIMARY KEY(ROLE_ID, PERMISSION_ID)
);


# -----------------------------------------------------------------------
# TURBINE_USER
# -----------------------------------------------------------------------
CREATE TABLE TURBINE_USER
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
    UNIQUE TURBINE_USER_UQ_1 (LOGIN_NAME)
);


# -----------------------------------------------------------------------
# TURBINE_USER_GROUP_ROLE
# -----------------------------------------------------------------------
CREATE TABLE TURBINE_USER_GROUP_ROLE
(
    USER_ID INTEGER NOT NULL,
    GROUP_ID INTEGER NOT NULL,
    ROLE_ID INTEGER NOT NULL,
    PRIMARY KEY(USER_ID, GROUP_ID, ROLE_ID)
);

ALTER TABLE TURBINE_ROLE_PERMISSION
    ADD CONSTRAINT TURBINE_ROLE_PERMISSION_FK_1
    FOREIGN KEY (ROLE_ID)
    REFERENCES TURBINE_ROLE (ROLE_ID);

ALTER TABLE TURBINE_ROLE_PERMISSION
    ADD CONSTRAINT TURBINE_ROLE_PERMISSION_FK_2
    FOREIGN KEY (PERMISSION_ID)
    REFERENCES TURBINE_PERMISSION (PERMISSION_ID);

ALTER TABLE TURBINE_USER_GROUP_ROLE
    ADD CONSTRAINT TURBINE_USER_GROUP_ROLE_FK_1
    FOREIGN KEY (USER_ID)
    REFERENCES TURBINE_USER (USER_ID);

ALTER TABLE TURBINE_USER_GROUP_ROLE
    ADD CONSTRAINT TURBINE_USER_GROUP_ROLE_FK_2
    FOREIGN KEY (GROUP_ID)
    REFERENCES TURBINE_GROUP (GROUP_ID);

ALTER TABLE TURBINE_USER_GROUP_ROLE
    ADD CONSTRAINT TURBINE_USER_GROUP_ROLE_FK_3
    FOREIGN KEY (ROLE_ID)
    REFERENCES TURBINE_ROLE (ROLE_ID);


