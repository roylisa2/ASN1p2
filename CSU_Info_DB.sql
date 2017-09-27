/*create and select the database
  cs means class schedule data base = csDB */
DROP DATABASE IF EXISTS CSU_Info_DB;
CREATE DATABASE CSU_Info_DB;
USE CSU_Info_DB;

/* create the tables for the database */
CREATE TABLE semester (
  semesterID INT NOT NULL AUTO_INCREMENT,
  semesterName      VARCHAR(20)    NOT NULL,
  semesterYear      INT                       NOT NULL,
  PRIMARY KEY (semesterID)
  /*UNIQUE INDEX emailAddress (emailAddress) what is this?*/
);

CREATE TABLE subject (
  subjectID         INT            NOT NULL   AUTO_INCREMENT,
  semesterID        INT            NOT NULL,
  subjectName       VARCHAR(20)    NOT NULL,
  PRIMARY KEY (subjectID)
);

CREATE TABLE class ( 
  classID           INT            NOT NULL   AUTO_INCREMENT, 
  subjectID         INT            NOT NULL, 
  className         VARCHAR(20)    NOT NULL,
  classDesc         VARCHAR(225)    DEFAULT NULL,
  creditHours       INT            NOT NULL,
  PRIMARY KEY (classID)
);

CREATE TABLE section ( 
  sectionID            INT            NOT NULL   AUTO_INCREMENT,
  classID              INT            NOT NULL,
  instructorID         INT            NOT NULL,
  crn                  INT  NOT NULL,
  days_offered         VARCHAR(10)  NOT NULL,
  time                 VARCHAR(30) NOT NULL,
  begin_date           DATE     NOT NULL,
  end_date             DATE     NOT NULL,
  location             VARCHAR(55)  NOT NULL,
  PRIMARY KEY (sectionID)
);

CREATE TABLE instructors (
  instructorID      INT            NOT NULL   AUTO_INCREMENT,
  firstName         VARCHAR(255)   NOT NULL,
  lastName          VARCHAR(255)   NOT NULL,
  PRIMARY KEY (instructorID)
);

/* BEGIN Insert data into the tables */

/* Semester Table */
/* VALUES(semesterID, semesterName, semesterYear) */
/*fall = 1 spring = 2 summer = 3*/
INSERT INTO semester VALUES(1,'Fall','2017');
INSERT INTO semester VALUES(2,'Spring','2018');
INSERT INTO semester VALUES(3,'Summer','2018');


/* Subject Table */
/*VALUES(subjectID, semesterID, subjectName)*/
/*math = 1 comp sci = 2 earth sci = 3 physical education = 4*/
INSERT INTO subject VALUES(1,1,'Math');
INSERT INTO subject VALUES(2,1,'Computer Science');
INSERT INTO subject VALUES(3,1,'Earth Science');

/*INSERT INTO subject VALUES(1,2,'Math');
INSERT INTO subject VALUES(2,2,'Computer Science');
INSERT INTO subject VALUES(3,2,'Earth Science');

INSERT INTO subject VALUES(1,3,'Math');
INSERT INTO subject VALUES(2,3,'Computer Science');*/
INSERT INTO subject VALUES(4,3,'Physical Education');
/* END Insert data into the tables */

/* Class Table */
/*VALUES(classID,subjectID,className,classDesc,creditHours)*/
/*math classes = 100s, comp sci classes = 200s, earth sci classes = 300s, pe classes = 400s*/
/*subjectIDs = math = 1 comp sci = 2 earth sci = 3 physical education = 4*/
INSERT INTO class VALUES(100,1,'College Algebra', 'Study of functions and their graphs.',3);
INSERT INTO class VALUES(125,1,'Calculus 1', 'Introduction to limits, derivatives, and intergration.',3);
INSERT INTO class VALUES(155,1,'Discrete Math', 'Topics include graphs, trees, and relations.',3);

INSERT INTO class VALUES(200,2,'Python', 'Study of the programming language Python',3);
INSERT INTO class VALUES(201,2,'Java', 'Study of the programming language Java',3);
INSERT INTO class VALUES(208,2,'Data Structures', 'Topics include BigO notation, binary trees, recursion, and graphs.',3);

INSERT INTO class VALUES(305,3,'Intro Astronomy', 'History of astronomy, the solar system, and formation of the sun.',3);
INSERT INTO class VALUES(306,3,'Stars/Galaxies', 'The sun, stars, black holes, and galaxies, and cosmology',3);
INSERT INTO class VALUES(307,3,'Astronomy Lab', 'Lab Work',1);

INSERT INTO class VALUES(444,4,'Rock Climbing', 'You are goning to climb a rock wall in the gym, good luck!',1);

/* Instructor Table */
/*VALUES(instructorID,firstName,lastName)*/

INSERT INTO instructors VALUES(1957,'Rodrigo','Obando');
INSERT INTO instructors VALUES(1925,'Lydia','Ray');
INSERT INTO instructors VALUES(1971,'Melinda','Pell');
INSERT INTO instructors VALUES(1931,'Hilary','Hok');
INSERT INTO instructors VALUES(1988,'Becks','Grun');
INSERT INTO instructors VALUES(1990,'Aurelia','Smith');
INSERT INTO instructors VALUES(1999,'Eugene','Ionascu');
INSERT INTO instructors VALUES(1978,'Brian','Muse');

/* Section Table */
/*VALUES(sectionID,classID,instructorID,crn,days_offered,time,begin_date,end_date,location)*/
/*college algebra = 100 calc1 = 125 dismath = 155 python = 200 java = 201 data = 208 intro = 305 stars = 307 lab=307 rock=444*/
/* */
INSERT INTO section VALUES(1100,100,1978,8001,'MWF','1:00PM - 2:00PM','2017-08-14','2017-12-11','University Hall 248');
INSERT INTO section VALUES(1125,125,1999,8002,'TTh','4:00PM - 5:00PM','2017-08-14','2017-12-11','University Hall 250');
INSERT INTO section VALUES(2208,208,1990,9008,'TTh','11:00PM - 12:00PM','2017-08-14','2017-12-11','CCT 409');

/*Create a user named mgs_user*/
GRANT SELECT, INSERT, UPDATE, DELETE
ON *
TO mgs_user@localhost
IDENTIFIED BY 'pa55word';