delimiter //
CREATE TRIGGER facility_price_tigger BEFORE INSERT ON Facility
FOR EACH ROW
BEGIN
    IF NEW.Price < 0 
    THEN SET NEW.Price = 0;
    END IF;
END;//

delimiter //
CREATE TRIGGER student_staff_tigger BEFORE DELETE ON Student
FOR EACH ROW
BEGIN
    DECLARE var_id INT DEFAULT 0;
    SET var_id = OLD.Student_ID;
    DELETE FROM Staff
    WHERE Student_ID = var_id;
END;//

delimiter //
CREATE TRIGGER student_activity_tigger BEFORE DELETE ON Student
FOR EACH ROW
BEGIN
    DECLARE var_id INT DEFAULT 0;
    SET var_id = OLD.Student_ID;
    DELETE FROM Student_Activity 
    WHERE Student_ID = var_id;
END;//
