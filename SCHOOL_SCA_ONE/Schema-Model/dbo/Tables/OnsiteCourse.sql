CREATE TABLE [dbo].[OnsiteCourse]
(
[CourseID] [int] NOT NULL,
[Location] [nvarchar] (50) NOT NULL,
[Days] [nvarchar] (50) NOT NULL,
[Time] [smalldatetime] NOT NULL
)
GO
ALTER TABLE [dbo].[OnsiteCourse] ADD CONSTRAINT [PK_OnsiteCourse] PRIMARY KEY CLUSTERED  ([CourseID])
GO
ALTER TABLE [dbo].[OnsiteCourse] ADD CONSTRAINT [FK_OnsiteCourse_Course] FOREIGN KEY ([CourseID]) REFERENCES [dbo].[Course] ([CourseID])
GO
