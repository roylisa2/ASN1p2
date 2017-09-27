SELECT s.subjectName, sm.semesterName
FROM subject s, semester sm
WHERE s.semesterID = 1
AND sm.semesterID = 1
ORDER BY subjectName


SELECT className, classDesc
FROM class
WHERE subjectID = 2


SELECT c.className, i.lastName
FROM class c, instructors i, section s
WHERE 
(s.classID =100
AND c.classID =100)
AND 
(s.instructorID =1978
AND i.instructorID =1978)

SELECT c.className, i.lastName, s.days_offered, s.time, location
FROM class c, instructors i, section s
WHERE 
(s.classID =100
AND c.classID =100)
AND 
(s.instructorID =1978
AND i.instructorID =1978)
