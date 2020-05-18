CREATE TABLE [dbo].[CourseInstructor]
(
[CourseID] [int] NOT NULL,
[PersonID] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[CourseInstructor] ADD CONSTRAINT [PK_CourseInstructor] PRIMARY KEY CLUSTERED  ([CourseID], [PersonID])
GO
ALTER TABLE [dbo].[CourseInstructor] ADD CONSTRAINT [FK_CourseInstructor_Course] FOREIGN KEY ([CourseID]) REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[CourseInstructor] ADD CONSTRAINT [FK_CourseInstructor_Person] FOREIGN KEY ([PersonID]) REFERENCES [dbo].[Person] ([PersonID])
GO
