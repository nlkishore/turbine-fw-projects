-- -----------------------------------------------------------------------
-- mysql SQL script for schema kishore
-- -----------------------------------------------------------------------



SET FOREIGN_KEY_CHECKS = 0;

drop table if exists AUTHOR;
drop table if exists BOOK;

# -----------------------------------------------------------------------
# AUTHOR
# -----------------------------------------------------------------------
CREATE TABLE AUTHOR
(
    AUTH_ID INTEGER NOT NULL,
    FIRST_NAME VARCHAR(64) NOT NULL,
    LAST_NAME VARCHAR(64) NOT NULL,
    PRIMARY KEY(AUTH_ID)
);


# -----------------------------------------------------------------------
# BOOK
# -----------------------------------------------------------------------
CREATE TABLE BOOK
(
    BOOK_ID INTEGER NOT NULL,
    AUTH_ID INTEGER NOT NULL,
    TITLE VARCHAR(64) NOT NULL,
    SUBJECT VARCHAR(64) NOT NULL,
    PRIMARY KEY(BOOK_ID)
);

ALTER TABLE BOOK
    ADD CONSTRAINT BOOK_FK_1
    FOREIGN KEY (AUTH_ID)
    REFERENCES AUTHOR (AUTH_ID);


