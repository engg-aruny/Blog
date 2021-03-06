/****************************************************************************************************
Create Table  : App.Application
****************************************************************************************************/ 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF (OBJECT_ID('[App].[Application]', 'U') IS NULL) BEGIN

   CREATE TABLE [App].[Application] (
      [ApplicationId]     INT            NOT NULL,
      [ApplicationName]   NVARCHAR(50)   NOT NULL
   ) ON [PRIMARY]
   PRINT 'Table App.Application has been created'

END
ELSE PRINT 'Table App.Application already exists - Create not necessary'
GO

-- ***************************
-- Primary Key
-- *************************** 

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('[App].[Application]')
AND [name] = 'PK_Application') BEGIN
   ALTER TABLE [App].[Application] ADD CONSTRAINT [PK_Application] 
      PRIMARY KEY CLUSTERED ([ApplicationId] ASC) WITH (SORT_IN_TEMPDB = ON) ON [PRIMARY]
   PRINT 'Primary Key App.Application.PK_Application has been created'
END
ELSE PRINT 'Primary Key App.Application.PK_Application already exists - Create not necessary'
GO

