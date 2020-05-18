CREATE TABLE [dbo].[Department]
(
[DepartmentID] [int] NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[Budget] [money] NOT NULL,
[StartDate] [datetime] NOT NULL,
[Administrator] [int] NULL
)
GO
ALTER TABLE [dbo].[Department] ADD CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED  ([DepartmentID])
GO
