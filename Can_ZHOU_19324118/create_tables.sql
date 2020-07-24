CREATE TABLE Position (
    Position_ID INT NOT NULL AUTO_INCREMENT,
    Role VARCHAR(100) NOT NULL,
    PRIMARY KEY (Position_ID),
    CONSTRAINT Role_check CHECK(
        Role IN ('President', 'Activity Officer', 'Publicity Officer', 'Accountant', 'Member')
    )
);

CREATE TABLE Club (
    Club_ID INT NOT NULL AUTO_INCREMENT,
    Club_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (Club_ID)
); 

CREATE TABLE Student (
    Student_ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telephone VARCHAR(100) NOT NULL,
    PRIMARY KEY (Student_ID)
);

CREATE TABLE Staff (
    Staff_ID INT NOT NULL AUTO_INCREMENT,
    Student_ID INT NOT NULL,
    Club INT NOT NULL,
    Position INT NOT NULL,
    PRIMARY KEY (Staff_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student (Student_ID),
    FOREIGN KEY (Club) REFERENCES Club (Club_ID),
    FOREIGN KEY (Position) REFERENCES Position (Position_ID)
);

CREATE TABLE Supervisor (
    Supervisor_ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telephone VARCHAR(100) NOT NULL,
    PRIMARY KEY (Supervisor_ID)
);

CREATE TABLE Activity (
    Activity_ID INT NOT NULL AUTO_INCREMENT,
    Activity_name VARCHAR(100) NOT NULL,
    Hosted_club INT NOT NULL,
    Supervisor INT NOT NULL,
    PRIMARY KEY (Activity_ID),
    FOREIGN KEY (Hosted_club) REFERENCES Club (Club_ID),
    FOREIGN KEY (Supervisor) REFERENCES Supervisor (Supervisor_ID)
);

CREATE TABLE Student_Activity (
    Student_ID INT NOT NULL,
    Activity_ID INT NOT NULL,
    Confirmed INT DEFAULT 0,
    PRIMARY KEY (Student_ID, Activity_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student (Student_ID),
    FOREIGN KEY (Activity_ID) REFERENCES Activity (Activity_ID),
    CONSTRAINT Confirmed_check CHECK(
        Confirmed IN (0,1)
    )
);

CREATE TABLE Facility (
    Facility_ID INT NOT NULL AUTO_INCREMENT,
    Facility_name VARCHAR(100) NOT NULL,
    Price FLOAT(16) NOT NULL,
    Available INT DEFAULT 1,
    PRIMARY KEY (Facility_ID),
    CONSTRAINT Facility_available_check CHECK(
        Available IN (0,1)
    )
);

CREATE TABLE Venue (
    Venue_ID INT NOT NULL AUTO_INCREMENT,
    Venue_name VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL,
    District VARCHAR(100) NOT NULL,
    Street VARCHAR(100) NOT NULL,
    Building VARCHAR(100) NOT NULL,
    Available INT DEFAULT 1,
    PRIMARY KEY (Venue_ID),
    CONSTRAINT Venue_available_check CHECK(
        Available IN (0,1)
    )
);

CREATE TABLE Activity_Facility (
    Activity_ID INT NOT NULL,
    Facility_ID INT NOT NULL,
    Start_date DATE NOT NULL,
    End_date DATE NOT NULL,
    PRIMARY KEY (Activity_ID, Facility_ID),
    FOREIGN KEY (Activity_ID) REFERENCES Activity (Activity_ID),
    FOREIGN KEY (Facility_ID) REFERENCES Facility (Facility_ID)
);

CREATE TABLE Activity_Venue (
    Activity_ID INT NOT NULL,
    Venue_ID INT NOT NULL,
    Start_date DATE NOT NULL,
    End_date DATE NOT NULL,
    PRIMARY KEY (Activity_ID, Venue_ID),
    FOREIGN KEY (Activity_ID) REFERENCES Activity (Activity_ID),
    FOREIGN KEY (Venue_ID) REFERENCES Venue (Venue_ID)
);