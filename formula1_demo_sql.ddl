-- Generated by Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   at:        2020-09-19 13:26:58 BDT
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c



DROP TABLE car CASCADE CONSTRAINTS;

DROP TABLE drivers CASCADE CONSTRAINTS;

DROP TABLE lap CASCADE CONSTRAINTS;

DROP TABLE schedule CASCADE CONSTRAINTS;

DROP TABLE team_schedule CASCADE CONSTRAINTS;

DROP TABLE teams CASCADE CONSTRAINTS;

CREATE TABLE car (
    carid            NUMBER(7) NOT NULL,
    carname          VARCHAR2(50) NOT NULL,
    chassis          VARCHAR2(10) NOT NULL,
    teams_teamname   VARCHAR2(50) NOT NULL
);

CREATE UNIQUE INDEX car__idx ON
    car (
        teams_teamname
    ASC );

ALTER TABLE car ADD CONSTRAINT car_pk PRIMARY KEY ( carid );

CREATE TABLE drivers (
    drivername       VARCHAR2(25) NOT NULL,
    driverid         NUMBER(7) NOT NULL,
    dateofbirth      DATE NOT NULL,
    placeofbirth     VARCHAR2(50) NOT NULL,
    points           NUMBER(3) NOT NULL,
    teams_teamname   VARCHAR2(50) NOT NULL,
    lap_lapid        NUMBER(7) NOT NULL,
    car_carid        NUMBER(7) NOT NULL
);

CREATE UNIQUE INDEX drivers__idx ON
    drivers (
        lap_lapid
    ASC );

ALTER TABLE drivers ADD CONSTRAINT drivers_pk PRIMARY KEY ( driverid );

CREATE TABLE lap (
    lapid              NUMBER(7) NOT NULL,
    laptime            DATE NOT NULL,
    totallaps          NUMBER(5) NOT NULL,
    drivers_driverid   NUMBER(7) NOT NULL
);

CREATE UNIQUE INDEX lap__idx ON
    lap (
        drivers_driverid
    ASC );

ALTER TABLE lap ADD CONSTRAINT lap_pk PRIMARY KEY ( lapid );

CREATE TABLE schedule (
    "Date"     DATE NOT NULL,
    venue      VARCHAR2(50) NOT NULL,
    gametype   VARCHAR2(20) NOT NULL,
    roundno    NUMBER(7) NOT NULL
);

ALTER TABLE schedule ADD CONSTRAINT schedule_pk PRIMARY KEY ( "Date",
                                                              venue );

CREATE TABLE team_schedule (
    teams_teamname   VARCHAR2(50) NOT NULL,
    schedule_date    DATE NOT NULL,
    schedule_venue   VARCHAR2(50) NOT NULL
);

ALTER TABLE team_schedule
    ADD CONSTRAINT team_schedule_pk PRIMARY KEY ( teams_teamname,
                                                  schedule_date,
                                                  schedule_venue );

CREATE TABLE teams (
    teamname          VARCHAR2(50) NOT NULL,
    teamchief         VARCHAR2(25) NOT NULL,
    technicalchiief   VARCHAR2(25) NOT NULL,
    firstteamentry    NUMBER(4) NOT NULL,
    car_carid         NUMBER(7) NOT NULL
);

CREATE UNIQUE INDEX teams__idx ON
    teams (
        car_carid
    ASC );

ALTER TABLE teams ADD CONSTRAINT teams_pk PRIMARY KEY ( teamname );

ALTER TABLE car
    ADD CONSTRAINT car_teams_fk FOREIGN KEY ( teams_teamname )
        REFERENCES teams ( teamname );

ALTER TABLE drivers
    ADD CONSTRAINT drivers_car_fk FOREIGN KEY ( car_carid )
        REFERENCES car ( carid );

ALTER TABLE drivers
    ADD CONSTRAINT drivers_lap_fk FOREIGN KEY ( lap_lapid )
        REFERENCES lap ( lapid );

ALTER TABLE drivers
    ADD CONSTRAINT drivers_teams_fk FOREIGN KEY ( teams_teamname )
        REFERENCES teams ( teamname );

ALTER TABLE lap
    ADD CONSTRAINT lap_drivers_fk FOREIGN KEY ( drivers_driverid )
        REFERENCES drivers ( driverid );

ALTER TABLE team_schedule
    ADD CONSTRAINT team_schedule_schedule_fk FOREIGN KEY ( schedule_date,
                                                           schedule_venue )
        REFERENCES schedule ( "Date",
                              venue );

ALTER TABLE team_schedule
    ADD CONSTRAINT team_schedule_teams_fk FOREIGN KEY ( teams_teamname )
        REFERENCES teams ( teamname );

ALTER TABLE teams
    ADD CONSTRAINT teams_car_fk FOREIGN KEY ( car_carid )
        REFERENCES car ( carid );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             4
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
