IF OBJECT_ID('[dbo].[GetStudentGrades]') IS NOT NULL
	DROP PROCEDURE [dbo].[GetStudentGrades];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[GetStudentGrades]
@StudentID int
AS
SELECT EnrollmentID, Grade, CourseID, StudentID FROM dbo.StudentGrade
WHERE StudentID = @StudentID
GO
