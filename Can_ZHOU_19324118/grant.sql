CREATE ROLE 'student', 'supervisor', 'club_president', 'club_staff';

GRANT SELECT ON TCD.Activity TO 'student', 'supervisor', 'club_president', 'club_staff';
GRANT SELECT ON TCD.Club TO 'student', 'supervisor', 'club_president', 'club_staff';
GRANT UPDATE, DELETE ON TCD.Activity TO 'supervisor';
GRANT SELECT, INSERT ON TCD.Student_Activity TO 'student';
GRANT SELECT ON TCD.Facility TO 'club_president', 'supervisor';
GRANT SELECT ON TCD.Venue TO 'club_president', 'supervisor';
GRANT SELECT, INSERT, UPDATE, DELETE ON TCD.Activity TO 'club_president';
GRANT SELECT, INSERT, UPDATE, DELETE ON TCD.Activity_Facility TO 'club_president';
GRANT SELECT, INSERT, UPDATE, DELETE ON TCD.Activity_Venue TO 'club_president';
GRANT SELECT, UPDATE ON TCD.Student_Activity TO 'club_president', 'club_staff';

CREATE USER 'student_0' IDENTIFIED BY '123456';
CREATE USER 'student_1' IDENTIFIED BY '123456';
CREATE USER 'student_2' IDENTIFIED BY '123456';
CREATE USER 'student_3' IDENTIFIED BY '123456';
CREATE USER 'student_4' IDENTIFIED BY '123456';
CREATE USER 'student_5' IDENTIFIED BY '123456';
CREATE USER 'supervisor_0' IDENTIFIED BY '123456';
CREATE USER 'supervisor_1' IDENTIFIED BY '123456';

GRANT 'student' TO 'student_0';
GRANT 'student' TO 'student_1';
GRANT 'student' TO 'student_2';
GRANT 'club_president' TO 'student_3';
GRANT 'club_staff' TO 'student_4';
GRANT 'club_staff' TO 'student_5';
GRANT 'supervisor' TO 'supervisor_0';
GRANT 'supervisor' TO 'supervisor_1';
