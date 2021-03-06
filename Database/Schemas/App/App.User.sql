/****************************************************************************************************
Create Table  : App.User
****************************************************************************************************/ 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF (OBJECT_ID('[App].[User]', 'U') IS NULL) BEGIN

   CREATE TABLE [App].[User] (
      [UserId]     INT            NOT NULL,
      [Username]   NVARCHAR(16)   NOT NULL,
      [PersonId]   INT            NOT NULL
   ) ON [PRIMARY]
   PRINT 'Table App.User has been created'

END
ELSE PRINT 'Table App.User already exists - Create not necessary'
GO

-- ***************************
-- Primary Key
-- *************************** 

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('[App].[User]')
AND [name] = 'PK_User') BEGIN
   ALTER TABLE [App].[User] ADD CONSTRAINT [PK_User] 
      PRIMARY KEY CLUSTERED ([UserId] ASC) WITH (SORT_IN_TEMPDB = ON) ON [PRIMARY]
   PRINT 'Primary Key App.User.PK_User has been created'
END
ELSE PRINT 'Primary Key App.User.PK_User already exists - Create not necessary'
GO

