/****************************************************************************************************
Create Table  : App.ApplicationSetting
****************************************************************************************************/ 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF (OBJECT_ID('[App].[ApplicationSetting]', 'U') IS NULL) BEGIN

   CREATE TABLE [App].[ApplicationSetting] (
      [ApplicationSettingId]      INT IDENTITY(1,1)   NOT NULL,
      [ApplicationSettingKey]     NVARCHAR(50)        NOT NULL,
      [ApplicationSettingValue]   NVARCHAR(50)        NOT NULL
   ) ON [PRIMARY]
   PRINT 'Table App.ApplicationSetting has been created'

END
ELSE PRINT 'Table App.ApplicationSetting already exists - Create not necessary'
GO

-- ***************************
-- Primary Key
-- *************************** 

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('[App].[ApplicationSetting]')
AND [name] = 'PK_ApplicationSetting') BEGIN
   ALTER TABLE [App].[ApplicationSetting] ADD CONSTRAINT [PK_ApplicationSetting] 
      PRIMARY KEY CLUSTERED ([ApplicationSettingId] ASC) WITH (SORT_IN_TEMPDB = ON) ON [PRIMARY]
   PRINT 'Primary Key App.ApplicationSetting.PK_ApplicationSetting has been created'
END
ELSE PRINT 'Primary Key App.ApplicationSetting.PK_ApplicationSetting already exists - Create not necessary'
GO

