
INSERT INTO Memberships (Length, Price) VALUES (12, 99.99), (6, 59.99), (3, 34.99);


INSERT INTO Staff (Name, Email, Role) VALUES 
('John Doe', 'john.doe@example.com', 'Receptionist'),
('Jane Smith', 'jane.smith@example.com', 'Manager'),
('Mike Johnson', 'mike.johnson@example.com', 'Trainer');


INSERT INTO Equipment (Type, PurchaseDate, LastMaintenanceDate, NeedingMaintenance) VALUES 
('Treadmill', '2020-01-10', '2024-01-15', false),
('Exercise Bike', '2020-05-23', '2024-03-22', true),
('Dumbbells', '2019-11-30', '2024-03-01', false);


INSERT INTO Trainer (Name, Email, Specialization) VALUES 
('Sarah Connor', 'sarah.connor@example.com', 'Personal Training'),
('Bruce Banner', 'bruce.banner@example.com', 'Nutrition'),
('Diana Prince', 'diana.prince@example.com', 'Yoga Instructor');


INSERT INTO Room (RoomType, Capacity, StaffID) VALUES 
('Yoga', 20, 2),
('Weights', 15, 3),
('Cardio', 25, 1);

INSERT INTO Member (Name, MembershipID, Email, Address, Phone, Gender, Height, Weight, BodyFat, WeightGoal, WeightGoalStatus, BodyFatGoal, BodyFatGoalStatus) VALUES 
('Alice Wonderland', 1, 'alice@example.com', '123 Fantasy Rd', '555-1234', 'Female', 165, 65, 25, 60, 'In Progress', 22, 'In Progress'),
('Bob Builder', 2, 'bob.builder@example.com', '456 Construction Ave', '555-2345', 'Male', 175, 85, 20, 80, 'In Progress', 18, 'In Progress'),
('Charlie Brown', 3, 'charlie.brown@example.com', '789 Peanuts St', '555-3456', 'Male', 168, 68, 23, 70, 'In Progress', 20, 'In Progress');

 
INSERT INTO Bills (Amount, DueDate, PaymentType, Status, MemberID, StaffID) VALUES 
(99.99, '2024-05-01', 'Credit Card', 'Paid', 1, 1),
(59.99, '2024-05-15', 'Cash', 'Due', 2, 1),
(34.99, '2024-05-20', 'Credit Card', 'Paid', 3, 2);


INSERT INTO Sessions (SessionType, Date, Time, Duration, RoomID, TrainerID) VALUES 
('Yoga Class', '2024-05-10', '08:00:00', INTERVAL '1 hour', 1, 3),
('Weight Training', '2024-05-10', '09:00:00', INTERVAL '2 hours', 2, 3),
('Cardio Workout', '2024-05-10', '10:00:00', INTERVAL '1 hour', 3, 1);


INSERT INTO Member_Sessions (MemberID, SessionID, Date, AttendanceStatus) VALUES 
(1, 1, '2024-05-10', 'Attended'),
(2, 2, '2024-05-10', 'Attended'),
(3, 3, '2024-05-10', 'Missed');

INSERT INTO Room_Booking (RoomID, Date, StartTime, EndTime, StaffID) VALUES 
(1, '2024-05-10', '07:00:00', '09:00:00', 1),
(2, '2024-05-10', '08:00:00', '11:00:00', 2),
(3, '2024-05-10', '09:00:00', '12:00:00', 3);

INSERT INTO Room_Equipment (RoomID, EquipmentID) VALUES 
(3, 1),
(2, 3),
(1, 2);

INSERT INTO Equipment_Maintenance (EquipmentID, StaffID, Date) VALUES 
(1, 2, '2024-01-15'),
(2, 3, '2024-03-22'),
(3, 1, '2024-03-01');

INSERT INTO Time_Slots (TrainerID, Time, Date) VALUES 
(3, '12:00:00', '2024-05-10'),
(1, '14:00:00', '2024-05-10'),
(2, '16:00:00', '2024-05-11');
