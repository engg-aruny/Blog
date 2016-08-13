/****************************************************************************************************
Create Table  : [Blog].[Tag]
****************************************************************************************************/ 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF (OBJECT_ID('[Blog].[Tag]', 'U') IS NULL) BEGIN

   CREATE TABLE [Blog].[Tag] (
      [TagId]				INT	            NOT NULL,
      [Name]				VARCHAR(16)		NOT NULL,
      [Frequency]			INT				NOT NULL
   ) ON [PRIMARY]
   PRINT 'Table Blog.Tag has been created'

END
ELSE PRINT 'Table Blog.Tag already exists - Create not necessary'
GO

-- ***************************
-- Primary Key
-- *************************** 

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('[Blog].[Tag]')
AND [name] = 'PK_Tag') BEGIN
   ALTER TABLE [Blog].[Tag] ADD CONSTRAINT [PK_Tag] 
      PRIMARY KEY CLUSTERED ([TagId] ASC) WITH (SORT_IN_TEMPDB = ON) ON [PRIMARY]
   PRINT 'Primary Key [Blog].[Tag].PK_Tag has been created'
END
ELSE PRINT 'Primary Key [Blog].[Tag].PK_Tag already exists - Create not necessary'
GO

