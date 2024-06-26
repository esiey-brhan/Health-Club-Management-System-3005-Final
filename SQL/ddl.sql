CREATE TABLE Memberships (
    MembershipID SERIAL PRIMARY KEY,
    Length INTEGER,
    Price NUMERIC(10, 2)
);

CREATE TABLE Staff (
    StaffID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE NOT NULL,
    Role VARCHAR(50)
);

CREATE TABLE Equipment (
    EquipmentID SERIAL PRIMARY KEY,
    Type VARCHAR(50),
    PurchaseDate DATE,
    LastMaintenanceDate DATE,
    NeedingMaintenance BOOLEAN
);

CREATE TABLE Trainer (
    TrainerID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE NOT NULL,
    Specialization VARCHAR(255)
);

CREATE TABLE Room (
    RoomID SERIAL PRIMARY KEY,
    RoomType VARCHAR(50),
    Capacity INTEGER,
    StaffID INTEGER,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID) ON DELETE SET NULL ON UPDATE CASCADE
);



CREATE TABLE Member (
    MemberID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    MembershipID INTEGER,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Address TEXT,
    Phone VARCHAR(50),
    Gender VARCHAR(50),
    Height DECIMAL,
    Weight DECIMAL,
    BodyFat DECIMAL,
    WeightGoal DECIMAL,
    WeightGoalStatus VARCHAR(50),
    BodyFatGoal DECIMAL,
    BodyFatGoalStatus VARCHAR(50),
    FOREIGN KEY (MembershipID) REFERENCES Memberships(MembershipID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Bills (
    BillID SERIAL PRIMARY KEY,
    Amount NUMERIC(10, 2),
    DueDate DATE,
    PaymentType VARCHAR(50),
    Status VARCHAR(50),
    MemberID INTEGER,
    StaffID INTEGER,
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Sessions (
    SessionID SERIAL PRIMARY KEY,
    SessionType VARCHAR(50),
    Date DATE,
    Time TIME,
    Duration INTERVAL,
    RoomID INTEGER,
    TrainerID INTEGER,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Member_Sessions (
    MemberID INTEGER,
    SessionID INTEGER,
    Date DATE,
    AttendanceStatus VARCHAR(50),
    PRIMARY KEY (MemberID, SessionID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (SessionID) REFERENCES Sessions(SessionID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Room_Booking (
    BookingID SERIAL PRIMARY KEY,
    RoomID INTEGER,
    Date DATE,
    StartTime TIME,
    EndTime TIME,
    StaffID INTEGER,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Room_Equipment (
    RoomID INTEGER,
    EquipmentID INTEGER,
    PRIMARY KEY (RoomID, EquipmentID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Equipment_Maintenance (
    EquipmentID INTEGER,
    StaffID INTEGER,
    Date DATE,
    PRIMARY KEY (EquipmentID, StaffID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Time_Slots (
    TrainerID INTEGER,
    Time TIME,
    Date DATE,
    PRIMARY KEY (TrainerID, Time, Date),
    FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID) ON DELETE CASCADE ON UPDATE CASCADE
);

