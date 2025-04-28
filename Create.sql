-- Create MEETING table
CREATE TABLE Meeting (
    MeetingID INT PRIMARY KEY,
    Title VARCHAR(255),
    StartTime DATETIME,
    EndTime DATETIME,
    Duration INT,
    Host VARCHAR(255),
    Participants TEXT
);

-- Create AGENDA table
CREATE TABLE Agenda (
    MeetingID INT,
    AgendaID INT,
    Topic VARCHAR(255),
    Duration INT,
    StartTime DATETIME,
    EndTime DATETIME,
    PRIMARY KEY (MeetingID, AgendaID),
    FOREIGN KEY (MeetingID) REFERENCES Meeting(MeetingID)
);

-- Create TRANSCRIPT table
CREATE TABLE Transcript (
    MeetingID INT,
    Timestamp DATETIME,
    Content TEXT,
    FOREIGN KEY (MeetingID) REFERENCES Meeting(MeetingID)
);

-- Create DRIFT table
CREATE TABLE Drift (
    MeetingID INT,
    AgendaID INT,
    Timestamp DATETIME,
    DriftMessage TEXT,
    FOREIGN KEY (MeetingID) REFERENCES Meeting(MeetingID),
    FOREIGN KEY (AgendaID) REFERENCES Agenda(AgendaID)
);

-- Create SUMMARY table
CREATE TABLE Summary (
    MeetingID INT PRIMARY KEY,
    Summary TEXT,
    ActualStartTime DATETIME,
    ActualEndTime DATETIME,
    FOREIGN KEY (MeetingID) REFERENCES Meeting(MeetingID)
);





--------------


-- Insert into MEETING table
INSERT INTO Meeting (MeetingID, Title, StartTime, EndTime, Duration, Host, Participants)
VALUES (1, 'Product Strategy Planning', '2025-04-28 10:00:00', '2025-04-28 11:30:00', 90, 'Alice Johnson', 'Alice Johnson, Bob Smith, Carol Lee');

-- Insert into AGENDA table
INSERT INTO Agenda (MeetingID, AgendaID, Topic, Duration, StartTime, EndTime)
VALUES (1, 1, 'Discuss 2025 Product Roadmap', 45, '2025-04-28 10:00:00', '2025-04-28 10:45:00');

-- Insert into TRANSCRIPT table
INSERT INTO Transcript (MeetingID, Timestamp, Content)
VALUES (1, '2025-04-28 10:05:00', 'We need to align our new product features with customer feedback.');

-- Insert into DRIFT table
INSERT INTO Drift (MeetingID, AgendaID, Timestamp, DriftMessage)
VALUES (1, 1, '2025-04-28 10:30:00', 'Conversation shifted to discussing internal team restructuring.');

-- Insert into SUMMARY table
INSERT INTO Summary (MeetingID, Summary, ActualStartTime, ActualEndTime)
VALUES (1, 'Covered the product roadmap, noted off-topic drift into organizational changes.', '2025-04-28 10:02:00', '2025-04-28 11:28:00');



-------------------------------------------------


-- INSERT 10 rows into MEETING, AGENDA, TRANSCRIPT, DRIFT, SUMMARY

-- 1
INSERT INTO Meeting VALUES (1, 'Product Strategy Planning', '2025-04-28 10:00:00', '2025-04-28 11:30:00', 90, 'Alice Johnson', 'Alice Johnson, Bob Smith, Carol Lee');
INSERT INTO Agenda VALUES (1, 1, 'Discuss 2025 Product Roadmap', 45, '2025-04-28 10:00:00', '2025-04-28 10:45:00');
INSERT INTO Transcript VALUES (1, '2025-04-28 10:05:00', 'Align new product features with customer feedback.');
INSERT INTO Drift VALUES (1, 1, '2025-04-28 10:30:00', 'Discussing internal team restructuring.');
INSERT INTO Summary VALUES (1, 'Covered roadmap, noted drift into organizational changes.', '2025-04-28 10:02:00', '2025-04-28 11:28:00');

-- 2
INSERT INTO Meeting VALUES (2, 'Marketing Campaign Kickoff', '2025-05-01 09:00:00', '2025-05-01 10:00:00', 60, 'Bob Smith', 'Bob Smith, Dana Wu, Evan Lee');
INSERT INTO Agenda VALUES (2, 1, 'Launch Spring Campaign', 30, '2025-05-01 09:00:00', '2025-05-01 09:30:00');
INSERT INTO Transcript VALUES (2, '2025-05-01 09:05:00', 'Define goals for spring advertising.');
INSERT INTO Drift VALUES (2, 1, '2025-05-01 09:20:00', 'Talking about holiday sales.');
INSERT INTO Summary VALUES (2, 'Set campaign objectives, drifted into future promotions.', '2025-05-01 09:02:00', '2025-05-01 09:58:00');

-- 3
INSERT INTO Meeting VALUES (3, 'HR Policy Update', '2025-05-02 11:00:00', '2025-05-02 12:00:00', 60, 'Carol Lee', 'Carol Lee, Frank Miller, Grace Kim');
INSERT INTO Agenda VALUES (3, 1, 'Update Work From Home Policy', 30, '2025-05-02 11:00:00', '2025-05-02 11:30:00');
INSERT INTO Transcript VALUES (3, '2025-05-02 11:10:00', 'Reviewing hybrid work model changes.');
INSERT INTO Drift VALUES (3, 1, '2025-05-02 11:25:00', 'Started discussing vacation policy.');
INSERT INTO Summary VALUES (3, 'Covered WFH updates, slight drift to leave policies.', '2025-05-02 11:01:00', '2025-05-02 11:59:00');

-- 4
INSERT INTO Meeting VALUES (4, 'Customer Success Strategy', '2025-05-03 14:00:00', '2025-05-03 15:30:00', 90, 'Dana Wu', 'Dana Wu, Evan Lee, Henry Ford');
INSERT INTO Agenda VALUES (4, 1, 'Enhance customer onboarding', 45, '2025-05-03 14:00:00', '2025-05-03 14:45:00');
INSERT INTO Transcript VALUES (4, '2025-05-03 14:10:00', 'Focused on onboarding improvements.');
INSERT INTO Drift VALUES (4, 1, '2025-05-03 14:40:00', 'Discussion on pricing models.');
INSERT INTO Summary VALUES (4, 'Focused on onboarding, drifted to pricing.', '2025-05-03 14:03:00', '2025-05-03 15:28:00');

-- 5
INSERT INTO Meeting VALUES (5, 'Engineering Sprint Planning', '2025-05-04 13:00:00', '2025-05-04 14:30:00', 90, 'Evan Lee', 'Evan Lee, Grace Kim, Bob Smith');
INSERT INTO Agenda VALUES (5, 1, 'Plan next sprint deliverables', 60, '2025-05-04 13:00:00', '2025-05-04 14:00:00');
INSERT INTO Transcript VALUES (5, '2025-05-04 13:15:00', 'Discuss upcoming sprint tasks.');
INSERT INTO Drift VALUES (5, 1, '2025-05-04 13:50:00', 'Started talking about team outing.');
INSERT INTO Summary VALUES (5, 'Sprint planning mostly on track, drifted at end.', '2025-05-04 13:02:00', '2025-05-04 14:27:00');

-- 6
INSERT INTO Meeting VALUES (6, 'Budget Review Q2', '2025-05-05 10:00:00', '2025-05-05 11:30:00', 90, 'Frank Miller', 'Frank Miller, Alice Johnson, Henry Ford');
INSERT INTO Agenda VALUES (6, 1, 'Review Q2 expenses', 45, '2025-05-05 10:00:00', '2025-05-05 10:45:00');
INSERT INTO Transcript VALUES (6, '2025-05-05 10:10:00', 'Analyzing expense reports.');
INSERT INTO Drift VALUES (6, 1, '2025-05-05 10:40:00', 'Discussed conference travel plans.');
INSERT INTO Summary VALUES (6, 'Reviewed Q2 budgets, drifted to travel expenses.', '2025-05-05 10:01:00', '2025-05-05 11:29:00');

-- 7
INSERT INTO Meeting VALUES (7, 'Sales Pipeline Discussion', '2025-05-06 09:00:00', '2025-05-06 10:30:00', 90, 'Grace Kim', 'Grace Kim, Bob Smith, Carol Lee');
INSERT INTO Agenda VALUES (7, 1, 'Review Sales Opportunities', 60, '2025-05-06 09:00:00', '2025-05-06 10:00:00');
INSERT INTO Transcript VALUES (7, '2025-05-06 09:20:00', 'Analyzed sales lead conversions.');
INSERT INTO Drift VALUES (7, 1, '2025-05-06 09:50:00', 'Conversation shifted to CRM tools.');
INSERT INTO Summary VALUES (7, 'Discussed sales leads, drifted into CRM tools.', '2025-05-06 09:03:00', '2025-05-06 10:28:00');

-- 8
INSERT INTO Meeting VALUES (8, 'Website Redesign Review', '2025-05-07 15:00:00', '2025-05-07 16:00:00', 60, 'Henry Ford', 'Henry Ford, Dana Wu, Frank Miller');
INSERT INTO Agenda VALUES (8, 1, 'Evaluate homepage prototypes', 30, '2025-05-07 15:00:00', '2025-05-07 15:30:00');
INSERT INTO Transcript VALUES (8, '2025-05-07 15:05:00', 'Feedback on homepage layouts.');
INSERT INTO Drift VALUES (8, 1, '2025-05-07 15:25:00', 'Started discussing blog designs.');
INSERT INTO Summary VALUES (8, 'Reviewed homepage, drifted into blog pages.', '2025-05-07 15:02:00', '2025-05-07 15:58:00');

-- 9
INSERT INTO Meeting VALUES (9, 'IT Infrastructure Update', '2025-05-08 11:00:00', '2025-05-08 12:00:00', 60, 'Alice Johnson', 'Alice Johnson, Evan Lee, Dana Wu');
INSERT INTO Agenda VALUES (9, 1, 'Server Upgrade Plan', 30, '2025-05-08 11:00:00', '2025-05-08 11:30:00');
INSERT INTO Transcript VALUES (9, '2025-05-08 11:10:00', 'Discussed upgrade timeline.');
INSERT INTO Drift VALUES (9, 1, '2025-05-08 11:25:00', 'Started talking about software licenses.');
INSERT INTO Summary VALUES (9, 'Covered upgrades, drifted into software discussions.', '2025-05-08 11:03:00', '2025-05-08 11:59:00');

-- 10
INSERT INTO Meeting VALUES (10, 'Annual General Meeting Prep', '2025-05-09 14:00:00', '2025-05-09 15:30:00', 90, 'Bob Smith', 'Bob Smith, Carol Lee, Henry Ford');
INSERT INTO Agenda VALUES (10, 1, 'Finalize AGM Agenda', 60, '2025-05-09 14:00:00', '2025-05-09 15:00:00');
INSERT INTO Transcript VALUES (10, '2025-05-09 14:15:00', 'Outlined AGM topics.');
INSERT INTO Drift VALUES (10, 1, '2025-05-09 14:50:00', 'Discussed catering options.');
INSERT INTO Summary VALUES (10, 'Finalized AGM topics, drifted to event logistics.', '2025-05-09 14:04:00', '2025-05-09 15:29:00');
