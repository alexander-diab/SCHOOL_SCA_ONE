IF OBJECT_ID('[dbo].[DeleteOfficeAssignment]') IS NOT NULL
	DROP PROCEDURE [dbo].[DeleteOfficeAssignment];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[DeleteOfficeAssignment]
@InstructorID int
AS
DELETE FROM OfficeAssignment
WHERE InstructorID=@InstructorID;
GO
