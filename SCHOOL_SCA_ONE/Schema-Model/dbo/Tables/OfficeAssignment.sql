CREATE TABLE [dbo].[OfficeAssignment]
(
[InstructorID] [int] NOT NULL,
[Location] [nvarchar] (50) NOT NULL,
[Timestamp] [timestamp] NOT NULL
)
GO
ALTER TABLE [dbo].[OfficeAssignment] ADD CONSTRAINT [PK_OfficeAssignment] PRIMARY KEY CLUSTERED  ([InstructorID])
GO
ALTER TABLE [dbo].[OfficeAssignment] ADD CONSTRAINT [FK_OfficeAssignment_Person] FOREIGN KEY ([InstructorID]) REFERENCES [dbo].[Person] ([PersonID])
GO
