/****************************************************************************************************
Create Table  : App.UserRole
****************************************************************************************************/ 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF (OBJECT_ID('[App].[UserRole]', 'U') IS NULL) BEGIN

   CREATE TABLE [App].[UserRole] (
      [UserId]            INT        NOT NULL,
      [RoleId]            INT        NOT NULL,
      [CreatedByUserId]   INT        NOT NULL,
      [CreateDateTime]    DATETIME   NOT NULL,
      [UpdatedByUserId]   INT        NULL,
      [UpdatedDateTime]   DATETIME   NULL
   ) ON [PRIMARY]
   PRINT 'Table App.UserRole has been created'

END
ELSE PRINT 'Table App.UserRole already exists - Create not necessary'
GO

-- ***************************
-- Primary Key
-- *************************** 

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('[App].[UserRole]')
AND [name] = 'PK_UserRole') BEGIN
   ALTER TABLE [App].[UserRole] ADD CONSTRAINT [PK_UserRole] 
      PRIMARY KEY CLUSTERED ([UserId] ASC,[RoleId] ASC) WITH (SORT_IN_TEMPDB = ON) ON [PRIMARY]
   PRINT 'Primary Key App.UserRole.PK_UserRole has been created'
END
ELSE PRINT 'Primary Key App.UserRole.PK_UserRole already exists - Create not necessary'
GO

