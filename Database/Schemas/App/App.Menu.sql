/****************************************************************************************************
Create Table  : App.Menu
****************************************************************************************************/ 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF (OBJECT_ID('[App].[Menu]', 'U') IS NULL) BEGIN

   CREATE TABLE [App].[Menu] (
      [MenuId]          INT             NOT NULL,
      [MenuName]        NVARCHAR(50)    NOT NULL,
      [Description]     NVARCHAR(100)   NULL,
      [ApplicationId]   INT             NOT NULL
   ) ON [PRIMARY]
   PRINT 'Table App.Menu has been created'

END
ELSE PRINT 'Table App.Menu already exists - Create not necessary'
GO

-- ***************************
-- Primary Key
-- *************************** 

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('[App].[Menu]')
AND [name] = 'PK_Menu') BEGIN
   ALTER TABLE [App].[Menu] ADD CONSTRAINT [PK_Menu] 
      PRIMARY KEY CLUSTERED ([MenuId] ASC) WITH (SORT_IN_TEMPDB = ON) ON [PRIMARY]
   PRINT 'Primary Key App.Menu.PK_Menu has been created'
END
ELSE PRINT 'Primary Key App.Menu.PK_Menu already exists - Create not necessary'
GO

