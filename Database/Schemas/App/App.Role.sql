/****************************************************************************************************
Create Table  : App.Role
****************************************************************************************************/ 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF (OBJECT_ID('[App].[Role]', 'U') IS NULL) BEGIN

   CREATE TABLE [App].[Role] (
      [RoleId]               INT IDENTITY(1,1)   NOT NULL,
      [RoleName]             NVARCHAR(50)        NOT NULL,
      [Description]          NVARCHAR(100)       NULL,
      [CreatedByUserId]      INT                 NOT NULL,
      [CreateDateTime]       DATETIME            NOT NULL,
      [UpdatedByUserId]      INT                 NULL,
      [UpdatedDateTime]      DATETIME            NULL,
      [ExternalIdentifier]   VARCHAR(50)         NULL,
      [StartDate]            SMALLDATETIME       NULL,
      [EndDate]              SMALLDATETIME       NULL,
   ) ON [PRIMARY]
   PRINT 'Table App.Role has been created'

END
ELSE PRINT 'Table App.Role already exists - Create not necessary'
GO

-- ***************************
-- Primary Key
-- *************************** 

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('[App].[Role]')
AND [name] = 'PK_Role') BEGIN
   ALTER TABLE [App].[Role] ADD CONSTRAINT [PK_Role] 
      PRIMARY KEY CLUSTERED ([RoleId] ASC) WITH (SORT_IN_TEMPDB = ON) ON [PRIMARY]
   PRINT 'Primary Key App.Role.PK_Role has been created'
END
ELSE PRINT 'Primary Key App.Role.PK_Role already exists - Create not necessary'
GO
