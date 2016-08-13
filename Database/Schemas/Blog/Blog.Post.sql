/****************************************************************************************************
Create Table  : [Blog].[Post]
****************************************************************************************************/ 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF (OBJECT_ID('[Blog].[Post]', 'U') IS NULL) BEGIN

   CREATE TABLE [Blog].[Post] (
      [PostId]				INT	            NOT NULL,
      [Title]				NVARCHAR(50)	NOT NULL,
      [Content]				NVARCHAR(Max)	NOT NULL,
      [Tag]					NVARCHAR(16)	NOT NULL,
      [Status]				INT				NOT NULL,
      [CreatedByUserId]     INT             NOT NULL,
      [CreateDateTime]      DATETIME        NOT NULL,
      [UpdatedByUserId]     INT             NULL,
      [UpdatedDateTime]     DATETIME        NULL,	
   ) ON [PRIMARY]
   PRINT 'Table Blog.Post has been created'

END
ELSE PRINT 'Table Blog.Post already exists - Create not necessary'
GO

-- ***************************
-- Primary Key
-- *************************** 

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('[Blog].[Post]')
AND [name] = 'PK_Post') BEGIN
   ALTER TABLE [Blog].[Post] ADD CONSTRAINT [PK_Post] 
      PRIMARY KEY CLUSTERED ([PostId] ASC) WITH (SORT_IN_TEMPDB = ON) ON [PRIMARY]
   PRINT 'Primary Key [Blog].[Post].PK_Post has been created'
END
ELSE PRINT 'Primary Key [Blog].[Post].PK_Post already exists - Create not necessary'
GO

