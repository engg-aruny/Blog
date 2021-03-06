/****************************************************************************************************
Create Table  : App.MenuItem
****************************************************************************************************/ 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF (OBJECT_ID('[App].[MenuItem]', 'U') IS NULL) BEGIN

   CREATE TABLE [App].[MenuItem] (
      [MenuItemId]          INT             NOT NULL,
      [MenuId]              INT             NOT NULL,
      [Name]                NVARCHAR(50)    NOT NULL,
      [Description]         NVARCHAR(100)   NULL,
      [LabelResourceName]   NVARCHAR(50)    NOT NULL,
      [URL]                 VARCHAR(512)    NOT NULL,
      [IsActive]            BIT             NOT NULL,
      [ParentMenuItemId]    INT             NULL,
      [DisplayOrder]        INT             NOT NULL,
      [CreatedByUserId]     INT             NOT NULL,
      [CreateDateTime]      DATETIME        NOT NULL,
      [UpdatedByUserId]     INT             NULL,
      [UpdatedDateTime]     DATETIME        NULL,
	  [SecurityRightId]		INT				NOT NULL
   ) ON [PRIMARY]
   PRINT 'Table App.MenuItem has been created'

END
ELSE PRINT 'Table App.MenuItem already exists - Create not necessary'
GO

-- ***************************
-- Primary Key
-- *************************** 

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('[App].[MenuItem]')
AND [name] = 'PK_MenuItem') BEGIN
   ALTER TABLE [App].[MenuItem] ADD CONSTRAINT [PK_MenuItem] 
      PRIMARY KEY CLUSTERED ([MenuItemId] ASC) WITH (SORT_IN_TEMPDB = ON) ON [PRIMARY]
   PRINT 'Primary Key App.MenuItem.PK_MenuItem has been created'
END
ELSE PRINT 'Primary Key App.MenuItem.PK_MenuItem already exists - Create not necessary'
GO

