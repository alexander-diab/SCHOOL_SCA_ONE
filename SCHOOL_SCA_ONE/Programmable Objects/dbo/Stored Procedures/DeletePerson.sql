IF OBJECT_ID('[dbo].[DeletePerson]') IS NOT NULL
	DROP PROCEDURE [dbo].[DeletePerson];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[DeletePerson]
@PersonID int
AS
DELETE FROM Person WHERE PersonID = @PersonID;
GO
