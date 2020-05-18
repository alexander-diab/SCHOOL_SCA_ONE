CREATE TABLE [dbo].[Course]
(
[CourseID] [int] NOT NULL,
[Title] [nvarchar] (100) NOT NULL,
[Credits] [int] NOT NULL,
[DepartmentID] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[Course] ADD CONSTRAINT [PK_School.Course] PRIMARY KEY CLUSTERED  ([CourseID])
GO
ALTER TABLE [dbo].[Course] ADD CONSTRAINT [FK_Course_Department] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Department] ([DepartmentID])
GO
