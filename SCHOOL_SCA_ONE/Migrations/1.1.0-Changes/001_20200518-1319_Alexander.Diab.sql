-- <Migration ID="55bf9b3c-0767-4cc7-9cfc-e397b0697283" />
GO

PRINT N'Altering [dbo].[Person]'
GO
ALTER TABLE [dbo].[Person] ADD
[BirthDate] [datetime] NULL
GO
