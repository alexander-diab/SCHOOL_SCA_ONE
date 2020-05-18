IF OBJECT_ID('[dbo].[newProc]') IS NOT NULL
	DROP PROCEDURE [dbo].[newProc];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--SET QUOTED_IDENTIFIER ON|OFF
--SET ANSI_NULLS ON|OFF
--GO
CREATE PROCEDURE [dbo].[newProc]
    @parameter_name AS INT
-- WITH ENCRYPTION, RECOMPILE, EXECUTE AS CALLER|SELF|OWNER| 'user_name'
AS
BEGIN
    SELECT CourseID,
           Title,
           Credits,
           DepartmentID FROM dbo.Course;
END
GO
