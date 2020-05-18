CREATE TABLE [dbo].[OnlineCourse]
(
[CourseID] [int] NOT NULL,
[URL] [nvarchar] (100) NOT NULL
)
GO
ALTER TABLE [dbo].[OnlineCourse] ADD CONSTRAINT [PK_OnlineCourse] PRIMARY KEY CLUSTERED  ([CourseID])
GO
ALTER TABLE [dbo].[OnlineCourse] ADD CONSTRAINT [FK_OnlineCourse_Course] FOREIGN KEY ([CourseID]) REFERENCES [dbo].[Course] ([CourseID])
GO
