/****************************************************************************************************
Create Table  : App.UserPerson
****************************************************************************************************/ 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF (OBJECT_ID('[App].[UserPerson]', 'U') IS NULL) BEGIN

   CREATE TABLE [App].[UserPerson] (
      [UserId]        INT            NOT NULL,
      [PersonId]      INT            NOT NULL,
      [Association]   NVARCHAR(50)   NULL
   ) ON [PRIMARY]
   PRINT 'Table App.UserPerson has been created'

END
ELSE PRINT 'Table App.UserPerson already exists - Create not necessary'
GO

