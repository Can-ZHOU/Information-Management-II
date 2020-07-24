CREATE VIEW Club_President AS 
SELECT
    Staff.Staff_ID, Staff.Student_ID, Club.Club_name, Student.Name, Student.Email, Student.Telephone
FROM
    Staff, Position, Student, Club
WHERE
    Position.Role = 'President'
    AND
    Staff.Student_ID =  Student.Student_ID
    AND
    Staff.Club = Club.Club_ID
    AND 
    Staff.Position = Position.Position_ID;

CREATE VIEW Club_Accountant AS 
SELECT
    Staff.Staff_ID, Staff.Student_ID, Club.Club_name, Student.Name, Student.Email, Student.Telephone
FROM
    Staff, Position, Student, Club
WHERE
    Position.Role = 'Accountant'
    AND
    Staff.Student_ID =  Student.Student_ID
    AND
    Staff.Club = Club.Club_ID
    AND 
    Staff.Position = Position.Position_ID;