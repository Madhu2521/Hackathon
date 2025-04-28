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
