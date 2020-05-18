CREATE TABLE [dbo].[StudentGrade]
(
[EnrollmentID] [int] NOT NULL IDENTITY(1, 1),
[CourseID] [int] NOT NULL,
[StudentID] [int] NOT NULL,
[Grade] [decimal] (3, 2) NULL
)
GO
ALTER TABLE [dbo].[StudentGrade] ADD CONSTRAINT [PK_StudentGrade] PRIMARY KEY CLUSTERED  ([EnrollmentID])
GO
ALTER TABLE [dbo].[StudentGrade] ADD CONSTRAINT [FK_StudentGrade_Course] FOREIGN KEY ([CourseID]) REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[StudentGrade] ADD CONSTRAINT [FK_StudentGrade_Student] FOREIGN KEY ([StudentID]) REFERENCES [dbo].[Person] ([PersonID])
GO
