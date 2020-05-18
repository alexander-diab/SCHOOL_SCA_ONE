-- <Migration ID="da257547-1396-4e0b-925f-953acb16e981" />
GO

PRINT N'Creating [dbo].[Department]'
GO
CREATE TABLE [dbo].[Department]
(
[DepartmentID] [int] NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[Budget] [money] NOT NULL,
[StartDate] [datetime] NOT NULL,
[Administrator] [int] NULL
)
GO
PRINT N'Creating primary key [PK_Department] on [dbo].[Department]'
GO
ALTER TABLE [dbo].[Department] ADD CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED  ([DepartmentID])
GO
PRINT N'Creating [dbo].[Course]'
GO
CREATE TABLE [dbo].[Course]
(
[CourseID] [int] NOT NULL,
[Title] [nvarchar] (100) NOT NULL,
[Credits] [int] NOT NULL,
[DepartmentID] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_School.Course] on [dbo].[Course]'
GO
ALTER TABLE [dbo].[Course] ADD CONSTRAINT [PK_School.Course] PRIMARY KEY CLUSTERED  ([CourseID])
GO
PRINT N'Creating [dbo].[CourseInstructor]'
GO
CREATE TABLE [dbo].[CourseInstructor]
(
[CourseID] [int] NOT NULL,
[PersonID] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_CourseInstructor] on [dbo].[CourseInstructor]'
GO
ALTER TABLE [dbo].[CourseInstructor] ADD CONSTRAINT [PK_CourseInstructor] PRIMARY KEY CLUSTERED  ([CourseID], [PersonID])
GO
PRINT N'Creating [dbo].[Person]'
GO
CREATE TABLE [dbo].[Person]
(
[PersonID] [int] NOT NULL IDENTITY(1, 1),
[LastName] [nvarchar] (50) NOT NULL,
[FirstName] [nvarchar] (50) NOT NULL,
[HireDate] [datetime] NULL,
[EnrollmentDate] [datetime] NULL,
[Discriminator] [nvarchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_School.Student] on [dbo].[Person]'
GO
ALTER TABLE [dbo].[Person] ADD CONSTRAINT [PK_School.Student] PRIMARY KEY CLUSTERED  ([PersonID])
GO
PRINT N'Creating [dbo].[OfficeAssignment]'
GO
CREATE TABLE [dbo].[OfficeAssignment]
(
[InstructorID] [int] NOT NULL,
[Location] [nvarchar] (50) NOT NULL,
[Timestamp] [timestamp] NOT NULL
)
GO
PRINT N'Creating primary key [PK_OfficeAssignment] on [dbo].[OfficeAssignment]'
GO
ALTER TABLE [dbo].[OfficeAssignment] ADD CONSTRAINT [PK_OfficeAssignment] PRIMARY KEY CLUSTERED  ([InstructorID])
GO
PRINT N'Creating [dbo].[OnlineCourse]'
GO
CREATE TABLE [dbo].[OnlineCourse]
(
[CourseID] [int] NOT NULL,
[URL] [nvarchar] (100) NOT NULL
)
GO
PRINT N'Creating primary key [PK_OnlineCourse] on [dbo].[OnlineCourse]'
GO
ALTER TABLE [dbo].[OnlineCourse] ADD CONSTRAINT [PK_OnlineCourse] PRIMARY KEY CLUSTERED  ([CourseID])
GO
PRINT N'Creating [dbo].[OnsiteCourse]'
GO
CREATE TABLE [dbo].[OnsiteCourse]
(
[CourseID] [int] NOT NULL,
[Location] [nvarchar] (50) NOT NULL,
[Days] [nvarchar] (50) NOT NULL,
[Time] [smalldatetime] NOT NULL
)
GO
PRINT N'Creating primary key [PK_OnsiteCourse] on [dbo].[OnsiteCourse]'
GO
ALTER TABLE [dbo].[OnsiteCourse] ADD CONSTRAINT [PK_OnsiteCourse] PRIMARY KEY CLUSTERED  ([CourseID])
GO
PRINT N'Creating [dbo].[StudentGrade]'
GO
CREATE TABLE [dbo].[StudentGrade]
(
[EnrollmentID] [int] NOT NULL IDENTITY(1, 1),
[CourseID] [int] NOT NULL,
[StudentID] [int] NOT NULL,
[Grade] [decimal] (3, 2) NULL
)
GO
PRINT N'Creating primary key [PK_StudentGrade] on [dbo].[StudentGrade]'
GO
ALTER TABLE [dbo].[StudentGrade] ADD CONSTRAINT [PK_StudentGrade] PRIMARY KEY CLUSTERED  ([EnrollmentID])
GO
PRINT N'Creating [dbo].[InsertOfficeAssignment]'
GO

CREATE PROCEDURE [dbo].[InsertOfficeAssignment]
@InstructorID int,
@Location nvarchar(50)
AS
INSERT INTO dbo.OfficeAssignment (InstructorID, Location)
VALUES (@InstructorID, @Location);
IF @@ROWCOUNT > 0
BEGIN
SELECT [Timestamp] FROM OfficeAssignment
WHERE InstructorID=@InstructorID;
END
GO
PRINT N'Creating [dbo].[UpdateOfficeAssignment]'
GO

CREATE PROCEDURE [dbo].[UpdateOfficeAssignment]
@InstructorID int,
@Location nvarchar(50),
@OrigTimestamp timestamp
AS
UPDATE OfficeAssignment SET Location=@Location
WHERE InstructorID=@InstructorID AND [Timestamp]=@OrigTimestamp;
IF @@ROWCOUNT > 0
BEGIN
SELECT [Timestamp] FROM OfficeAssignment
WHERE InstructorID=@InstructorID;
END
GO
PRINT N'Creating [dbo].[DeleteOfficeAssignment]'
GO

CREATE PROCEDURE [dbo].[DeleteOfficeAssignment]
@InstructorID int
AS
DELETE FROM OfficeAssignment
WHERE InstructorID=@InstructorID;
GO
PRINT N'Creating [dbo].[DeletePerson]'
GO

CREATE PROCEDURE [dbo].[DeletePerson]
@PersonID int
AS
DELETE FROM Person WHERE PersonID = @PersonID;
GO
PRINT N'Creating [dbo].[UpdatePerson]'
GO

CREATE PROCEDURE [dbo].[UpdatePerson]
@PersonID int,
@LastName nvarchar(50),
@FirstName nvarchar(50),
@HireDate datetime,
@EnrollmentDate datetime,
@Discriminator nvarchar(50)
AS
UPDATE Person SET LastName=@LastName,
FirstName=@FirstName,
HireDate=@HireDate,
EnrollmentDate=@EnrollmentDate,
Discriminator=@Discriminator
WHERE PersonID=@PersonID;
GO
PRINT N'Creating [dbo].[InsertPerson]'
GO

CREATE PROCEDURE [dbo].[InsertPerson]
@LastName nvarchar(50),
@FirstName nvarchar(50),
@HireDate datetime,
@EnrollmentDate datetime,
@Discriminator nvarchar(50)
AS
INSERT INTO dbo.Person (LastName,
FirstName,
HireDate,
EnrollmentDate,
Discriminator)
VALUES (@LastName,
@FirstName,
@HireDate,
@EnrollmentDate,
@Discriminator);
SELECT SCOPE_IDENTITY() as NewPersonID;
GO
PRINT N'Creating [dbo].[GetStudentGrades]'
GO

CREATE PROCEDURE [dbo].[GetStudentGrades]
@StudentID int
AS
SELECT EnrollmentID, Grade, CourseID, StudentID FROM dbo.StudentGrade
WHERE StudentID = @StudentID
GO
PRINT N'Creating [dbo].[GetDepartmentName]'
GO

CREATE PROCEDURE [dbo].[GetDepartmentName]
@ID int,
@Name nvarchar(50) OUTPUT
AS
SELECT @Name = Name FROM Department
WHERE DepartmentID = @ID
GO
PRINT N'Adding foreign keys to [dbo].[CourseInstructor]'
GO
ALTER TABLE [dbo].[CourseInstructor] ADD CONSTRAINT [FK_CourseInstructor_Course] FOREIGN KEY ([CourseID]) REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[CourseInstructor] ADD CONSTRAINT [FK_CourseInstructor_Person] FOREIGN KEY ([PersonID]) REFERENCES [dbo].[Person] ([PersonID])
GO
PRINT N'Adding foreign keys to [dbo].[OnlineCourse]'
GO
ALTER TABLE [dbo].[OnlineCourse] ADD CONSTRAINT [FK_OnlineCourse_Course] FOREIGN KEY ([CourseID]) REFERENCES [dbo].[Course] ([CourseID])
GO
PRINT N'Adding foreign keys to [dbo].[OnsiteCourse]'
GO
ALTER TABLE [dbo].[OnsiteCourse] ADD CONSTRAINT [FK_OnsiteCourse_Course] FOREIGN KEY ([CourseID]) REFERENCES [dbo].[Course] ([CourseID])
GO
PRINT N'Adding foreign keys to [dbo].[StudentGrade]'
GO
ALTER TABLE [dbo].[StudentGrade] ADD CONSTRAINT [FK_StudentGrade_Course] FOREIGN KEY ([CourseID]) REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[StudentGrade] ADD CONSTRAINT [FK_StudentGrade_Student] FOREIGN KEY ([StudentID]) REFERENCES [dbo].[Person] ([PersonID])
GO
PRINT N'Adding foreign keys to [dbo].[Course]'
GO
ALTER TABLE [dbo].[Course] ADD CONSTRAINT [FK_Course_Department] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Department] ([DepartmentID])
GO
PRINT N'Adding foreign keys to [dbo].[OfficeAssignment]'
GO
ALTER TABLE [dbo].[OfficeAssignment] ADD CONSTRAINT [FK_OfficeAssignment_Person] FOREIGN KEY ([InstructorID]) REFERENCES [dbo].[Person] ([PersonID])
GO
