/****************************************************************************************************
Create Table  : App.UserContact
****************************************************************************************************/ 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF (OBJECT_ID('[App].[UserContact]', 'U') IS NULL) BEGIN

   CREATE TABLE [App].[UserContact] (
      [UserId]        INT            NOT NULL,
      [PersonId]      INT            NOT NULL,
      [Association]   NVARCHAR(50)   NULL
   ) ON [PRIMARY]
   PRINT 'Table App.UserContact has been created'

END
ELSE PRINT 'Table App.UserContact already exists - Create not necessary'
GO

