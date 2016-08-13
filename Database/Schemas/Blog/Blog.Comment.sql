/****** Object:  Table [dbo].[Blog.Comment]    Script Date: 07/22/2016 13:15:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF (OBJECT_ID('[Blog].[Comment]', 'U') IS NULL) BEGIN
CREATE TABLE [Blog].[Comment](
	[CommentId]				INT				NOT NULL,
	[PostId]				INT				NOT NULL,
	[Content]				NVARCHAR(MAX)	NOT NULL,
	[Status]				INT				NOT NULL,
	[CreatedByUserId]		INT             NOT NULL,
    [CreateDateTime]		DATETIME        NOT NULL,
    [UpdatedByUserId]		INT             NULL,
    [UpdatedDateTime]		DATETIME        NULL	
   ) ON [PRIMARY]
 PRINT 'Table Blog.Comment has been created'

END
ELSE PRINT 'Table Blog.Comment already exists - Create not necessary'
GO

-- ***************************
-- Primary Key
-- *************************** 

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('[Blog].[Comment]')
AND [name] = 'PK_Comment') BEGIN
   ALTER TABLE [Blog].[Comment] ADD CONSTRAINT [PK_Comment]
      PRIMARY KEY CLUSTERED ([CommentId] ASC) WITH (SORT_IN_TEMPDB = ON) ON [PRIMARY]
   PRINT 'Primary Key [Blog].[Comment].PK_Comment has been created'
END
ELSE PRINT 'Primary Key [Blog].[Comment].PK_Comment already exists - Create not necessary'
GO



