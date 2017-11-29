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
);

CREATE TABLE subject (
  subjectID         INT            NOT NULL   AUTO_INCREMENT,
  subjectName       VARCHAR(20)    NOT NULL,
  PRIMARY KEY (subjectID)
);

/*Intersection Table for Semester and Subject!*/
CREATE TABLE offering (
  someID            INT            NOT NULL AUTO_INCREMENT,
  semesterID        INT            NOT NULL,
  subjectID         INT            NOT NULL,
  PRIMARY KEY (someID)
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
  semesterid           INT          NOT NULL,
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
/*VALUES(subjectID, subjectName)*/
/*math = 100 comp sci = 200 biology = 300 physical education = 400*/
INSERT INTO subject VALUES(100,'Math');
INSERT INTO subject VALUES(200,'Computer Science');
INSERT INTO subject VALUES(300,'Earth Science');
INSERT INTO subject VALUES(400,'Physical Education');

/*INTERSECTION TABLE -- Offering*/
/*values(pk, semesterID, subjectID)*/
INSERT INTO offering VALUES(0,1,100);
INSERT INTO offering VALUES(1,1,200);
INSERT INTO offering VALUES(2,1,300);
INSERT INTO offering VALUES(10,1,400);

INSERT INTO offering VALUES(3,2,100);
INSERT INTO offering VALUES(4,2,200);
INSERT INTO offering VALUES(5,2,300);
INSERT INTO offering VALUES(11,2,400);

INSERT INTO offering VALUES(6,3,100);
INSERT INTO offering VALUES(7,3,200);
INSERT INTO offering VALUES(12,3,300);
INSERT INTO offering VALUES(8,3,400);


/* Class Table */
/*VALUES(classID,subjectID,className,classDesc,creditHours)*/
/*math classes = 1000s, comp sci classes = 2000s, earth sci classes = 3000s, pe classes = 4000s*/
/*subjectIDs = math = 100 comp sci = 200 biology = 300 physical education = 400*/

INSERT INTO class VALUES(1100,100,'College Algebra', 'Study of functions and their graphs.',3);
INSERT INTO class VALUES(1250,100,'Calculus 1', 'Introduction to limits, derivatives, and intergration.',3);
INSERT INTO class VALUES(1550,100,'Discrete Math', 'Topics include graphs, trees, and relations.',3);

INSERT INTO class VALUES(2001,200,'Python', 'Study of the programming language Python',3);
INSERT INTO class VALUES(2002,200,'Java', 'Study of the programming language Java',3);
INSERT INTO class VALUES(2108,200,'Data Structures', 'Topics include BigO notation, binary trees, recursion, and graphs.',3);

INSERT INTO class VALUES(3005,300,'Intro Astronomy', 'History of astronomy, the solar system, and formation of the sun.',3);
INSERT INTO class VALUES(3016,300,'Stars/Galaxies', 'The sun, stars, black holes, and galaxies, and cosmology',3);
INSERT INTO class VALUES(3027,300,'Astronomy Lab', 'Lab Work',1);

INSERT INTO class VALUES(4444,400,'Rock Climbing', 'You are goning to climb a rock wall in the gym, good luck!',1);
INSERT INTO class VALUES(4443,400,'Swimming', 'It is too damn hot outside, just get in the pool...',1);
INSERT INTO class VALUES(4445,400,'Hot Tubbing', 'Do not pee in here please...',1);

/* Instructor Table */
/*VALUES(instructorID,firstName,lastName)*/

INSERT INTO instructors VALUES(1957,'Rodrigo','Obando');
INSERT INTO instructors VALUES(1925,'Lydia','Ray');
INSERT INTO instructors VALUES(1971,'Melinda','Pell');
INSERT INTO instructors VALUES(1931,'Hilary','Hok');
INSERT INTO instructors VALUES(1988,'Radhouane','Chouchane');
INSERT INTO instructors VALUES(1990,'Aurelia','Smith');
INSERT INTO instructors VALUES(1999,'Eugene','Ionascu');
INSERT INTO instructors VALUES(1978,'Brian','Muse');
INSERT INTO instructors VALUES(1991,'Shelby','Girl');
INSERT INTO instructors VALUES(1000,'STAFF','TBD');

/* Section Table */
/*VALUES(sectionID,classID,instructorID,crn,days_offered,time,begin_date,end_date,location, semesterID)*/
/*college algebra = 1100 
  calc1 = 1250 
  dismath = 1550 
  python = 2001 
  java = 2002 
  data = 2108 
  intro = 3005
  stars = 3016 
  lab=3027 
  rock=4444*/
  /*fall = 1 spring = 2 summer = 3*/
INSERT INTO section VALUES(0,1100,1978,8001,'MWF','1:00PM - 2:00PM','2017-08-14','2017-12-11','University Hall 248',1);
INSERT INTO section VALUES(1,1250,1971,8002,'TTh','4:00PM - 5:00PM','2017-08-14','2017-12-11','University Hall 250',1);
INSERT INTO section VALUES(2,1550,1999,8003,'TTh','3:00PM - 3:50PM','2017-08-14','2017-12-11','University Hall 252',1);

INSERT INTO section VALUES(3,2108,1990,9008,'MWF','1:00PM - 2:00PM','2017-08-14','2017-12-11','CCT 450',1);
INSERT INTO section VALUES(7,2001,1925,9009,'TTh','11:00AM - 12:00PM','2017-08-14','2017-12-11','CCT 409',1);
INSERT INTO section VALUES(8,2002,1931,9010,'MW','8:00AM - 9:15AM','2017-08-14','2017-12-11','CCT 405',1);

INSERT INTO section VALUES(9,3005,1957,9008,'MWF','7:00AM - 9:00AM','2017-08-14','2017-12-11','Arnold 101',1);
INSERT INTO section VALUES(10,3016,1991,9009,'MW','11:00AM - 12:00PM','2017-08-14','2017-12-11','Coca Cola Room',1);
INSERT INTO section VALUES(11,3027,1991,9010,'TTh','8:00AM - 9:15AM','2017-08-14','2017-12-11','Planatarium',1);

INSERT INTO section VALUES(33,4443,1991,9008,'TTh','7:00AM - 9:00AM','2017-08-14','2017-12-11','Pool',1);
INSERT INTO section VALUES(32,4444,1000,9009,'TTh','11:00AM - 12:00PM','2017-08-14','2017-12-11','Rock Wall',1);

/* END fall classes*/
/*VALUES(sectionID,classID,instructorID,crn,days_offered,time,begin_date,end_date,location, semesterID)*/

INSERT INTO section VALUES(4,1100,1978,8004,'TTh','1:00PM - 2:00PM','2018-01-22','2018-05-17','University Hall 248',2);
INSERT INTO section VALUES(5,1250,1971,8005,'MWF','4:00PM - 5:00PM','2018-01-22','2018-05-17','Howard Hall 108',2);
INSERT INTO section VALUES(6,1550,1999,8006,'TTh','3:00PM - 3:50PM','2018-01-22','2018-05-17','CCT 208',2);

INSERT INTO section VALUES(12,2108,1990,9008,'MWF','1:00PM - 2:00PM','2017-08-14','2017-12-11','CCT 450',2);
INSERT INTO section VALUES(13,2001,1925,9009,'TTh','11:00AM - 12:00PM','2017-08-14','2017-12-11','CCT 409',2);
INSERT INTO section VALUES(14,2002,1931,9010,'MW','8:00AM - 9:15AM','2017-08-14','2017-12-11','CCT 405',2);

INSERT INTO section VALUES(15,3005,1957,9008,'MWF','7:00AM - 9:00AM','2017-08-14','2017-12-11','Arnold 101',2);
INSERT INTO section VALUES(16,3016,1991,9009,'MW','11:00AM - 12:00PM','2017-08-14','2017-12-11','Coca Cola Room',2);
INSERT INTO section VALUES(17,3027,1991,9010,'TTh','8:00AM - 9:15AM','2017-08-14','2017-12-11','Planatarium',2);

INSERT INTO section VALUES(30,4443,1991,9008,'TTh','7:00AM - 9:00AM','2017-08-14','2017-12-11','Pool',2);
INSERT INTO section VALUES(31,4444,1000,9009,'TTh','11:00AM - 12:00PM','2017-08-14','2017-12-11','Rock Wall',2);

/* END spring classes*/
/*VALUES(sectionID,classID,instructorID,crn,days_offered,time,begin_date,end_date,location, semesterID)*/
/*college algebra = 1100 
  calc1 = 1250 
  dismath = 1550 
  python = 2001 
  java = 2002 
  data = 2108 
  intro = 3005
  stars = 3016 
  lab=3027 
  rock=4444
  4443 swim
  4445*/

INSERT INTO section VALUES(18,1100,1978,8004,'TTh','1:00PM - 2:00PM','2018-01-22','2018-05-17','University Hall 248',3);
INSERT INTO section VALUES(19,1250,1971,8005,'MWF','4:00PM - 5:00PM','2018-01-22','2018-05-17','Howard Hall 108',3);
INSERT INTO section VALUES(20,1550,1999,8006,'TTh','3:00PM - 3:50PM','2018-01-22','2018-05-17','CCT 208',3);

INSERT INTO section VALUES(21,2108,1000,9008,'MWF','1:00PM - 2:00PM','2017-08-14','2017-12-11','CCT 4th Flr Bathroom',3);
INSERT INTO section VALUES(22,2001,1988,9009,'TTh','11:00AM - 12:00PM','2017-08-14','2017-12-11','CCT 409',3);
INSERT INTO section VALUES(23,2002,1931,9010,'MW','8:00AM - 9:15AM','2017-08-14','2017-12-11','CCT 405',3);

INSERT INTO section VALUES(24,3005,1957,9008,'MWF','7:00AM - 9:00AM','2017-08-14','2017-12-11','Arnold 101',3);
INSERT INTO section VALUES(25,3016,1991,9009,'MW','11:00AM - 12:00PM','2017-08-14','2017-12-11','Coca Cola Room',3);
INSERT INTO section VALUES(26,3027,1991,9010,'TTh','8:00AM - 9:15AM','2017-08-14','2017-12-11','Planatarium',3);

INSERT INTO section VALUES(27,4443,1991,9008,'TTh','7:00AM - 9:00AM','2017-08-14','2017-12-11','Pool',3);
INSERT INTO section VALUES(28,4444,1000,9009,'TTh','11:00AM - 12:00PM','2017-08-14','2017-12-11','Rock Wall',3);
INSERT INTO section VALUES(29,4445,1000,9010,'TTh','8:00AM - 9:15AM','2017-08-14','2017-12-11','Hot Tub',3);

/*END summer classes */

/*Create a user named mgs_user*/
GRANT SELECT, INSERT, UPDATE, DELETE
ON *
TO mgs_user@localhost
IDENTIFIED BY 'pa55word';
