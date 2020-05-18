CREATE TABLE [dbo].[Person]
(
[PersonID] [int] NOT NULL IDENTITY(1, 1),
[LastName] [nvarchar] (50) NOT NULL,
[FirstName] [nvarchar] (50) NOT NULL,
[HireDate] [datetime] NULL,
[EnrollmentDate] [datetime] NULL,
[Discriminator] [nvarchar] (50) NOT NULL,
[BirthDate] [datetime] NULL
)
GO
ALTER TABLE [dbo].[Person] ADD CONSTRAINT [PK_School.Student] PRIMARY KEY CLUSTERED  ([PersonID])
GO
