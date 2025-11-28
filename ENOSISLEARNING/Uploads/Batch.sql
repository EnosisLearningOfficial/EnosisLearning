-------------------------------------------------------------------------------------------Alteration Of Core Tables--------------------------------------------------------------------------------------------------------
--BatchesInfo table--

use ENOSISLEARNINGLT

CREATE TABLE enosis.BatchesInfo (
    BatchId INT IDENTITY(1,1) PRIMARY KEY,
    BatchType VARCHAR(50),
    BatchMode VARCHAR(50),
    BatchSubject VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    StartTime TIME,
    EndTime TIME,
    FaclutyName VARCHAR(50),
    ExpectedStudent VARCHAR(100),
    Status VARCHAR(20),
	CreatedDate DateTime default GETDATE(),--Enosis.BatchesInfo Alter CreatedDate Column--
	CreatetedBy varchar(max),--Enosis.BatchesInfo Alter CreatetedBy Column--
	UpdatedDate DateTime,--Enosis.BatchesInfo Alter UpdatedDate Column--
	UpdatedBy varchar(max),--Enosis.BatchesInfo Alter UpdatedBy Column--
    USERID INT,--Enosis.BatchesInfo Alter USERID Column--
    COURSEID INT,--Enosis.BatchesInfo Alter COURSEID Column--
    
    -- Foreign Keys
    FOREIGN KEY (USERID) REFERENCES USERDETAILS(USERID),
    FOREIGN KEY (COURSEID) REFERENCES COURSES_DETAIL(COURSEID)
);

/*========================================================================================================================================================================================================================*/

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--BatchSheetDetails table--
ALTER TABLE Enosis.BatchSheetDetails  
ADD StudentID INT;  

ALTER TABLE Enosis.BatchSheetDetails  
ADD Status VARCHAR(20) NOT NULL;

ALTER TABLE Enosis.BatchSheetDetails  
ADD CONSTRAINT FK_BatchSheetDetails_Candidates  
FOREIGN KEY (StudentID) REFERENCES Candidates(CANDIDATE_CODE);

----------------------New Alteration-----------
ALTER TABLE Enosis.BatchesInfo
ALTER COLUMN ExpectedStudent VARCHAR(MAX);


ALTER TABLE enosis.BatchSheetDetails
ALTER COLUMN StudentName VARCHAR(max) NULL;
-------------------------------------------------------------------------------------------Alteration Of Core Tables--------------------------------------------------------------------------------------------------------

/*========================================================================================================================================================================================================================*/

-------------------------------------------------------------------------------------------New Core Tables For Mapping------------------------------------------------------------------------------------------------------
-- CandidateCoursesMapping Table (Track Courses for Each new enrolled Candidates)
CREATE TABLE CandidateCoursesMapping (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    CANDIDATE_CODE INT NOT NULL,
    COURSEID INT NOT NULL,
    EnrollmentDate DATETIME DEFAULT GETDATE(),
    Status VARCHAR(20) DEFAULT 'Active',
    CONSTRAINT FK_Candidate FOREIGN KEY (CANDIDATE_CODE) REFERENCES Candidates(CANDIDATE_CODE),
    CONSTRAINT FK_Course FOREIGN KEY (COURSEID) REFERENCES COURSES_DETAIL(COURSEID)
);

/*========================================================================================================================================================================================================================*/

--CandidateBatchMapping Table (Track Batch Enrollment for Each Candidate)
CREATE TABLE CandidateBatchMapping (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    CANDIDATE_CODE INT NOT NULL,
    COURSEID INT NOT NULL,
    BATCHID INT NOT NULL,
    EnrollDate DATETIME DEFAULT GETDATE(),
    Status VARCHAR(20) DEFAULT 'Active',
    CONSTRAINT FK_CBM_Candidate FOREIGN KEY (CANDIDATE_CODE) REFERENCES Candidates(CANDIDATE_CODE),
    CONSTRAINT FK_CBM_Course FOREIGN KEY (COURSEID) REFERENCES COURSES_DETAIL(COURSEID),
    CONSTRAINT FK_CBM_Batch FOREIGN KEY (BATCHID) REFERENCES enosis.BatchesInfo(BatchId)
);

/*========================================================================================================================================================================================================================*/

--FacultyCourseApproval Table (Track Batch requests for Each Candidate)
CREATE TABLE FacultyCourseApproval (
    ApprovalID INT IDENTITY(1,1) PRIMARY KEY,
    FacultyID INT NOT NULL,
    CandidateID INT NOT NULL,
    CourseID INT NOT NULL,
    ApprovalStatus TINYINT DEFAULT 0, --  Pending = 0,Approved = 1,Rejected = 2
	ApprovedBy varchar(max) NOT NULL,
    RequestedDate DATETIME DEFAULT GETDATE(),
    ApprovedDate DATETIME NULL,
    FOREIGN KEY (FacultyID) REFERENCES USERDETAILS(USERID),
    FOREIGN KEY (CandidateID) REFERENCES Candidates(CANDIDATE_CODE),
    FOREIGN KEY (CourseID) REFERENCES COURSES_DETAIL(COURSEID)
);
-------------------------------------------------------------------------------------------New Core Tables For Mapping------------------------------------------------------------------------------------------------------

/*========================================================================================================================================================================================================================*/

-----------------------------------------------------------------------------------------Queries for fetching Student's Record----------------------------------------------------------------------------------------------

--Query For Attendence of each  Student's Course Wise and batch wise--
SELECT C.FULLNAME AS StudentName, A.ChapterNumber, A.TopicCovered, A.Date, A.Uploads, A.Status FROM enosis.BatchSheetDetails A INNER JOIN CandidateBatchMapping CBM ON A.BatchID = CBM.BATCHID AND A.StudentID = CBM.CANDIDATE_CODE INNER JOIN Candidates C ON CBM.CANDIDATE_CODE = C.CANDIDATE_CODE WHERE CBM.COURSEID = 6 AND CBM.CANDIDATE_CODE = 9863 AND CBM.BATCHID = 36 ORDER BY A.Date DESC;

/*========================================================================================================================================================================================================================*/

--Query For TestScore of each Student's Course Wise and Faculty Wise--
SELECT 
    C.CANDIDATE_CODE,
    C.FULLNAME,
    CT.COURSEID,
    CBM.COURSEID AS MappedCourseID,  -- Course Validation
    CT.SCORE,
    CT.OUTOF,
    CT.UPDATEDDATE,
    CT.UPDATEDBY AS Faculty,  -- Faculty Validation
    CT.FEEDBACK,
    CT.ASSESSMENTTYPE
FROM CANDIDATE_TESTRESULTS CT
JOIN CANDIDATES C ON CT.CANDIDATEID = C.CANDIDATE_CODE
JOIN CandidateBatchMapping CBM 
    ON CBM.CANDIDATE_CODE = C.CANDIDATE_CODE 
    AND CBM.COURSEID = CT.COURSEID  -- Ensure Course Mapping
JOIN enosis.BatchesInfo B 
    ON CBM.BATCHID = B.BatchID  -- Ensure Batch Mapping
WHERE C.CANDIDATE_CODE = 9863
AND CT.COURSEID = 6  -- Ensure Selected Course
ORDER BY CT.UPDATEDDATE DESC; -- Latest Test Results First

/*========================================================================================================================================================================================================================*/

--Query for Fee Details(For Each Students only for single course not for multiple.)
SELECT C.Candidate_Code, C.FullName, CF.RECEIPTID,CF.CREATEDDATE, CF.CANDIDATEID, CF.FEESAMOUNT, CF.FEESPAIDDATE, CF.FEESDUEDATE, CF.FEESTYPE, CF.STATUS FROM Candidates C JOIN CANDIDATE_FEESDETAIL CF ON C.CANDIDATE_CODE= CF.CANDIDATEID WHERE C.Candidate_Code = 9863;

/*========================================================================================================================================================================================================================*/

--Check Candidate already Have Same Course before-- 
SELECT COUNT(*) FROM CandidateBatchMapping WHERE CANDIDATE_CODE = 9863 AND COURSEID = 5;

/*========================================================================================================================================================================================================================*/

--Count Requested Batch Approval--
SELECT COUNT(*) FROM FacultyCourseApproval WHERE FacultyID = 50 AND ApprovalStatus = 0

/*========================================================================================================================================================================================================================*/

--Query for Requested Batch Approval Faculty Wise-
SELECT 
    FCA.ApprovalID, 
    C.CANDIDATE_CODE AS CandidateID, 
    C.FULLNAME AS CandidateName, 
    CD.COURSENAME AS RequestedCourse, 
    FCA.RequestedDate,
    ISNULL(EnrolledCourses.PreviousCourse, 'Not Enrolled') AS PreviouslyEnrolledCourse
FROM FacultyCourseApproval FCA
INNER JOIN Candidates C ON FCA.CandidateID = C.CANDIDATE_CODE
INNER JOIN COURSES_DETAIL CD ON FCA.CourseID = CD.COURSEID
LEFT JOIN (
    SELECT 
        BCM.CANDIDATE_CODE, 
        STRING_AGG(CD.COURSENAME, ', ') AS PreviousCourse 
    FROM CandidateBatchMapping BCM
    INNER JOIN COURSES_DETAIL CD ON BCM.CourseID = CD.COURSEID
    GROUP BY BCM.CANDIDATE_CODE
) AS EnrolledCourses ON C.CANDIDATE_CODE = EnrolledCourses.CANDIDATE_CODE 
WHERE FCA.FacultyID = 42 AND FCA.ApprovalStatus = 0;

/*========================================================================================================================================================================================================================*/

--Query for show candidates according to selected course and approved by faculty and first time Candidates 
SELECT C.CANDIDATE_CODE, C.FULLNAME, C.CREATEDDATE, 'Approved' AS Status
FROM Candidates C
INNER JOIN FacultyCourseApproval FCA 
    ON C.CANDIDATE_CODE = FCA.CandidateID 
    AND FCA.CourseID = 6 
    AND FCA.FacultyID = 42 
    AND FCA.ApprovalStatus = 1 
UNION 
SELECT C.CANDIDATE_CODE, C.FULLNAME, C.CREATEDDATE, 'New' AS Status
FROM Candidates C
WHERE C.CourseID = 6 
AND NOT EXISTS ( 
    SELECT 1 FROM CandidateBatchMapping CBM 
    WHERE CBM.CANDIDATE_CODE = C.CANDIDATE_CODE
    AND CBM.CourseID = 6
)
ORDER BY CREATEDDATE DESC;

/*========================================================================================================================================================================================================================*/

--Query for show each candidate's records of courses and batch relation--
SELECT 
    CBM.CANDIDATE_CODE, 
    C.FULLNAME, 
    CBM.CourseID, 
    CD.COURSENAME, 
    CBM.BatchID, 
    B.StartDate, 
    B.EndDate
FROM CandidateBatchMapping CBM
INNER JOIN Candidates C ON CBM.CANDIDATE_CODE = C.CANDIDATE_CODE
INNER JOIN COURSES_DETAIL CD ON CBM.CourseID = CD.COURSEID
INNER JOIN enosis.BatchesInfo B ON CBM.BatchID = B.BatchID
WHERE CBM.CANDIDATE_CODE = 9863
ORDER BY B.StartDate DESC;

/*=====================================================================================================================================================================================================



===================*/

CREATE TABLE BatchMessages
(
    MessageID INT IDENTITY(1,1) PRIMARY KEY,  
    BatchID INT NOT NULL,                     
    Sender NVARCHAR(100) NOT NULL,             
    MessageText NVARCHAR(MAX) NOT NULL,        
    MessageDateTime DATETIME NOT NULL DEFAULT GETDATE(), 

    CONSTRAINT FK_BatchMessages_BatchesInfo FOREIGN KEY (BatchID) 
        REFERENCES Enosis.BatchesInfo(BatchId)
        ON DELETE CASCADE 
);


--------------------------------------------------------------------Queries for fetching Student's Record----------------------------------------------------------------------------------------------

select * from CandidateCoursesMapping;
select * FROM enosis.BatchesInfo;
select * from CandidateBatchMapping;
select * from enosis.BatchSheetDetails;
select * from BatchMessages;








INSERT INTO enosis.BatchSheetDetails 
    (Date, ChapterNumber, TopicCovered, Comments, BatchId,Status)
SELECT 
    '2025/05/15', 
    'Chapter 1', 
    'Test', 
    'TEst', 
    1072, 
    'Present'
FROM 
    CandidateBatchMapping cbm
WHERE 
    cbm.BATCHID = 1072

















