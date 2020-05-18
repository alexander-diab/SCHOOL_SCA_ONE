IF OBJECT_ID('[dbo].[GetDepartmentName]') IS NOT NULL
	DROP PROCEDURE [dbo].[GetDepartmentName];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[GetDepartmentName]
@ID int,
@Name nvarchar(50) OUTPUT
AS
SELECT @Name = Name FROM Department
WHERE DepartmentID = @ID
GO
