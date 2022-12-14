USE [TestDb]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 15.09.2022 1:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVersions]    Script Date: 15.09.2022 1:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVersions](
	[ID] [uniqueidentifier] NOT NULL,
	[ProductID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatingDate] [datetime2](7) NOT NULL,
	[Width] [real] NOT NULL,
	[Height] [real] NOT NULL,
	[Length] [real] NOT NULL,
 CONSTRAINT [PK_ProductVersions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[testFunc]    Script Date: 15.09.2022 1:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[testFunc] (@productName varchar(255), @productVersionName varchar(255), @minVolume int, @maxVolume int)
RETURNS TABLE
AS
RETURN
(
	SELECT v.ID, p.NAME as ProductName, v.NAME as ProductVersionName, v.LENGTH, v.WIDTH, v.HEIGHT FROM PRODUCTS AS p
	JOIN PRODUCTVERSIONS AS v ON p.ID = V.PRODUCTID 
	WHERE p.NAME LIKE '%' + @productName + '%' AND 
	v.NAME LIKE '%' +  @productVersionName + '%' AND 
	(v.Length * v.Width * v.Height) > @minVolume AND
	(v.Length * v.Width * v.Height) < @maxVolume
)
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 15.09.2022 1:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventLog]    Script Date: 15.09.2022 1:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventLog](
	[ID] [uniqueidentifier] NOT NULL,
	[EventDate] [datetime2](7) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_EventLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220914163814_InitialCreate', N'3.1.29')
GO
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'888ee110-93dc-438d-8263-00318019fb4c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd3815951-1c89-4473-88f5-019334580564', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'2489e8be-831d-403d-89f6-01e1bd1eb011', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c7b81019-db4d-4074-a9fb-037f59dcf535', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'cc84368b-7496-450c-8ec7-040bc4b6d99b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ed92180a-0fd1-4d95-a8a0-04d83194de41', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'5ecf7c20-05e7-4ed6-9192-0504f1f3e300', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'1754897d-9e9a-42e2-8251-05bfeb0539a7', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'89a94fc5-5b17-470d-afab-0801dbbb2dcc', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'504e92ae-af6a-43d8-95cd-084a8088ada2', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7339dd7d-de64-43b9-a172-08de8e76741f', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'0dc6eaaa-3ca9-4ea7-bfe0-095ed693b8e4', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'4b60870e-fc63-40aa-9b47-0a6b07cdc083', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'5777ff72-d09f-4dfd-b4f0-0ada4ee37f11', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c25c6176-35b9-42b9-a647-0c3b52ca9517', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'a84793dd-5dc7-4759-8e47-0d116aee7bf3', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'11b5b32d-ac78-4cda-a1d4-0d74de82b24d', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'45ab7eeb-3e74-4463-9185-0e481eecaff9', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'585421be-766a-4f35-bb7f-0eb32e651d5c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'52e3a6cc-ce8e-4637-82a9-0fb1e3c4d8b1', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'23168cd9-3a5a-48fc-a3a3-10c4cd6d2d55', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'71e711fe-2437-42aa-8255-11a7928c4b5b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'68e18a94-dd8a-4ecb-b166-120ddd7bb49a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'5d312fb1-bf23-4fdb-b67b-13dfa9f2b2a3', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'4798443c-974b-4010-9c0d-144f56812862', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'253b39de-2177-45f3-8a25-14b5019e2adc', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'b70eda46-5869-42ec-92e6-14c84ebda5e0', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd88d0571-6cff-4d03-a81b-172e53968597', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'76023d6f-9fd8-4410-baa9-1741790fc87b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'0178dd23-59a2-4213-b23e-17ff075391ae', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'286be97a-b505-4439-a268-18e7b00fe2d5', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'122d1f08-5b19-491b-9fba-19d46e9cfabc', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'59c66e6a-4c1a-486a-8743-1a70118cafbd', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'8dd5d621-4c96-4ba7-abac-1b379fd291cf', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'866720b6-a1fa-43a3-b030-1b44f703df98', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'15dbdbdc-5ebc-42ba-bad7-1d2842073136', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'35359840-1010-421f-8bef-1d43de935b5e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'fd800966-faad-4b01-b1c1-1df3dfd41dfe', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'fac17eb4-04e5-4202-b921-1edb0d5b559c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd0b99a5d-d134-4275-ac87-1f633c2f333f', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'74e3cab3-2947-4305-8c50-232c82f406a0', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ef8ddb16-ba60-4dce-b6c0-24b37711c2d0', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'38807d6b-2bb7-407e-aef7-24cb1b590d7e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f353bb1a-2ce5-45f4-ba21-257bb4076e90', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'88cf0920-42f7-4dff-9f96-25823d845a43', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'bddf2684-87ab-451d-acca-25ac5ec9af19', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'83cdcead-0a06-4c4d-af85-2611aac3d9e0', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c1ef3644-b3e5-4a36-9d27-261fd4c187ab', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'925e7833-b7b5-41e6-b1ca-26240b02c695', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'3a4f0fe7-b47b-4b7f-b611-26fbd083dde6', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'72e80e90-cc30-457e-a5e1-27756bd3b894', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'a4972da6-e127-4276-9564-28224f4fd96f', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'dafcd3b1-c399-4613-99e8-285e30120d3c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'a79063b9-2bd0-4bad-a698-2957573ce417', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'10ce8444-3860-425f-b3bd-296210b2d096', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f98d4ffb-b4cc-4684-8df8-2a6541e448a6', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'6c842101-7744-4a3b-b4d8-2abe38b6b74e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ccdc13be-9661-418f-b7ff-2b0b50e98f1b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'4d3731be-4f39-4509-8495-2cb62c7d4d56', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'3e8cefa3-70e4-4208-b1b3-2cef4cb6f1cf', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ba98fbff-457b-4d11-813c-2d277023b13a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'67ef0a17-2145-482f-a9fb-2d8b677e60a0', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'784e8c33-4139-4b53-95c1-2ee887e71746', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'9e196f25-c022-46a3-a4b6-3002b170aabb', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd100cea8-46f9-463a-8983-30041ea5fe63', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'3e4d6ad7-cbf2-4ae9-bee0-3022b39a7d1c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'19d5f79b-e65b-4dde-b70e-3060a51348fc', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd1b94be2-461a-47bc-93cf-310e5b5420fc', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7d954421-85ce-46c8-973f-3165e78df756', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ef164dd5-5a12-4b66-ad43-31b69ca656b3', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'4f770b93-2f89-4167-bd7c-325a70f04103', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'87275098-e947-4805-846f-32b0ed72dfcf', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7d56e7b1-8264-4768-877c-32f8635d9bb4', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'a7585fed-8055-4547-9a45-32f9abdadc58', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd1a84dca-1092-4f15-ace0-352c446202e4', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'0e98cefb-77ee-4fce-811c-353f7e70ab91', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'9c3d8f06-6a1b-407a-a805-355f6a8bbc7d', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ffed9c08-1d1d-4400-b6b6-37a4c88cc2d2', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'b090266e-39e3-4c1d-bb1f-398456643fcb', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'b97436e8-ff6f-43be-9975-3a9bd5637d8b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd51dceb9-a8e7-41b9-81f0-3af26c893e53', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'027b7bc9-c358-4653-adfd-3b4f2c8fb875', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'83e31ee7-fe71-4653-a479-3bc8de445699', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'383d1f34-05ac-42fb-bd41-3c09028d471e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'94db2531-2297-4e2f-b662-3e04a55f7b0c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'fd971b6f-20ec-43f3-ba19-3e7d4f6f3556', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'a0954904-c90a-409a-a399-3e8e5192585a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'23cb8dca-be27-4537-868b-3f2177145648', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'e5c32587-c027-447c-b4c5-408d3ef6a359', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'e7060ace-57d8-4c4b-93af-41e89f80a247', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f68392a5-5e8d-4cca-b2d6-427064f57fc0', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd503a8c8-dad6-47fa-b3ef-427bfa46266e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'0167174f-2964-4654-ab18-44ddfa2e8d8c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'e3d0326e-99c6-464f-870a-450d0f2ec46e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'aaeefaa7-641b-4fdb-8732-45b47d1fa7b6', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7e220b57-c1ca-4a74-9419-45bd195f781d', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'4f43fe14-aeb5-4bfa-a165-45f638fb3cca', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c2594073-6e3a-4d1b-896a-4690dd20c4cd', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'a143392d-033f-482a-9ada-48aee2afe59a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'cc775178-cc83-48ff-96ad-490b1b503c58', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
GO
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7220fa13-8050-490e-9be4-4a676f72a7c6', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'fc6d7434-edf1-443a-b009-4b6d10845183', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'6577347e-6b6b-4fb8-adae-4bf77fedae7b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'0693e7e5-c1fe-412c-a00e-4c666e4f26b7', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'bfbac7b3-756e-4393-9adb-4d4d78410ae5', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c7e3457c-c0d2-4d98-a6d7-4d866af058e3', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'1a0f572f-0b85-4b46-aa7a-4e01765447e9', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'3d1b5139-3c60-4d74-b634-4e0df5975a06', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'386845a0-3a17-44ff-ba4b-4e517ffa318d', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'5409e30f-b265-48d8-9911-4ef570326b1e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7184e136-bd5a-4904-9604-4fba854a52f1', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f2c0663a-71fd-40ae-9358-4ff6c022f989', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'6372cc1d-afb4-4c9b-9d5c-50c227b5f82f', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'2b134277-67e6-4d78-83e1-5231ca39b0a0', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'02fc0f64-2abf-49ac-bce2-5288f532b613', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7fbb0b08-4af7-48b6-a230-54b82ba353c9', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'e47dcb75-2d12-41fe-a604-559ca6f9e6e2', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'56c91285-32fa-4ee4-b609-561765d2fc93', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c935dca4-4839-4924-98d0-57e79ec9276a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f31eefaa-9b89-4223-9e7c-57f74db51758', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'1818f18b-c5f8-4e51-b675-5ad2970a5d0b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'1d8a7c7b-f474-45e9-9f26-5c0e092af5ad', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'4e259e54-0f82-4462-8f4e-5c470cec3bb1', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'1cf44d8c-6540-4e73-987b-5cd664230713', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f51bfc1e-b08f-49b4-8533-5ce21033a5a6', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7c5f40a8-85ad-4c4c-bf0a-5dabf9e01448', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c0a39864-2739-4798-b422-5dc4b7db7002', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'bdbb1c61-5da3-46df-8437-5e2f54c52f4c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'60e10a6a-53fa-4df3-8b15-608e9fe54c92', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'9c264d59-3038-4731-8b41-60e803d3da46', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'22ef0511-999a-48c1-bc36-624b3490c6fe', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'b95d6866-1ee8-4cdc-a7af-648890820913', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'979c5f26-a2e0-49a5-b242-64ba05c614ae', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'774a69f3-153c-4529-9c1a-64eeb509262d', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'5ece947c-3fc6-4d3c-84b2-65e1108e04fa', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'61031900-65d9-4704-8917-65e3810b5fb0', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'525ea726-94ec-4ca3-84c9-67216f9049e9', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'e2e74c0d-b454-47ea-b045-68259e9be4d3', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'fdcd5622-808e-4a54-8a53-68d3f49a7047', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'9ffd205a-2e6f-4cf1-a53a-68db9cf739b3', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c6bba7b0-8327-41ba-b50f-68ec8c2f867b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c62b8324-d99a-411f-8c7e-6936e633da56', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'add86d20-b9f7-49ed-a25a-6a0d042edace', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'b4e40a78-0a87-42e5-82bc-6b6a2aa89a36', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'23b2583b-3e1f-4a4c-ad7c-6bd1243cada6', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ed11a21d-502d-47a2-9aa9-6c46e3b4479c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ff5a9f20-a017-4680-bbf3-729b955d787d', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'4d791f9c-4a0d-4fd1-be80-72ba16394ee1', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'a41c702a-1977-4163-9318-756f7208d7ed', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'a48b8a81-b9e6-40b3-a674-75babeb135c3', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'1c93966c-87ea-4d1e-bbd1-776f15259ff6', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'dabb1318-5ace-497d-91e2-7860f3d0b24e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7e4aa509-8643-42b5-9c8a-78712f7023e7', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'5f775f75-9667-4df0-9d00-78c5b73392bf', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'232034b7-4975-45be-9989-7b9eff43c3d6', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'0c10d4fd-a229-45a6-aa51-7c39607a7ae1', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'aac7fbfe-8706-4db9-b317-7c9cc332c44c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'583a37e6-38fd-416e-879f-7ca09d396061', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'99ab6f4e-c125-4999-a0cb-7d5ef6a91ec5', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'1aeb6fdc-97f2-466c-bf15-7dc250705807', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'516535d4-b071-41cf-af95-7ee8d96f95c8', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f1df151f-5118-4283-ad6d-7ef3ce2cc25e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'dcd00973-fb25-4a83-b110-7f3df744e8bd', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'b35e734d-9ffa-4fac-a53e-7f6bbb59af64', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'93dcaa1b-b01d-4661-bbe1-82e5a7850f8e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'48e5c2e7-f47a-4567-8bbb-836bce36ede2', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ae3262ca-9858-4154-bef4-83c962866d51', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'506ae947-eb58-4e87-8504-84affe70adb7', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'4556a3ec-426e-4702-878f-85aa6d019a66', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'5b0d1ca3-e520-42a3-bb95-85b52c4c7a23', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'2f775fef-1a59-43c5-bb30-85b56607fe0b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'b2db24fa-416c-484b-bcc3-85dc74cfe28a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'79dc08dd-ddce-4544-8f1d-865d9bc9be9a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'244c9fb9-2e86-4d90-a711-8673aa73efed', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd8953590-decf-4890-a050-868398138638', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'76977145-483a-45bf-9362-880421435f1e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c102c9d5-7a1c-42b1-b456-8804a222e10c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'6712836e-48bb-40c7-8498-8861e7ceaf72', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'2a377a0e-4fce-4bbf-8857-88f6e52bc963', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'4c538d70-d618-4c4a-8a57-8a471f29d573', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'2ca79504-e16d-44bf-86f4-8bbdea78c8cc', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'12758f96-903d-4935-aa4a-8c5fe26bd54a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ac1a5701-bd78-4c4d-bfc0-8de135c02adb', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'391f8ea1-ed53-45ef-902d-8e82130969ee', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'8452967e-f02c-4c20-ba2c-8f436a73d4fd', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'fd40fa98-258f-4f26-8ce6-8fad4a05a3d7', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'9fd02dca-78ae-46ce-9849-90b4c64f09bb', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ff328b2b-c840-4c6b-8416-90ff5287606c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd25b51e2-0fda-44e5-92ee-914635a6ce6b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ad3e283f-05a7-49a8-b3e3-9176565dbce8', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'58103264-ef8d-4921-b2a0-932f54602f73', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'84a5a8cf-079b-4b7a-99fd-93d4fa997fd1', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'3857f492-625f-4fd8-afd4-942104d4dbb3', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'66250c53-462b-421d-bf5c-943b9b403697', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'bca18ddd-b58b-4d2d-932e-947932fa1f64', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'dd221d36-7f43-4617-a7ef-94c4f183effd', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'95026b88-3bf1-45ea-884d-94dea1397ed7', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'384f674c-3ae2-4730-9535-9593cf4d5e0a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'594a4f37-a9ca-4945-8498-96743feaa0e8', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd213b519-9f1e-430d-96be-975f678a6539', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
GO
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'5e3c5b48-5d37-43a2-87e1-980eed0060ac', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'2e1aadb9-63af-410d-9412-9a5e5923cde3', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'811b4bb5-4c58-4710-8f38-9b039509689a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'a0ffbd27-f7e6-4263-b6dc-9b50461f4505', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'5d60f69b-f841-454b-8c69-9be786723e9b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'72dff680-2794-443b-96e5-9c0858b9947f', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'725dfb1e-8cbd-4997-80a7-9e79abba88f1', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'5816771f-1672-456f-adb8-9f19cd438be0', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'89e33df6-bf8b-462f-8f3c-9f2bca81771c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ca54854a-5be3-4b55-b28a-a0307e5d4a1c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'6348f0e5-6552-4442-80d8-a0736000caa5', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'151b8815-8860-4672-ac35-a0a03a0ac948', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'79d7b2a4-c52a-4953-a541-a1b77a26cd89', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd4d1a083-0f0c-4a51-9523-a27468b780a2', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'222a5523-744d-4080-bd25-a2b33cbd5675', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'65db6271-a925-460f-8878-a4dc571ed3ef', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'125a6925-033c-4c78-94ef-a55bbbafee2c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7b0d8525-88ee-48b9-918f-a5bcd7e5ebc8', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7c5059b9-e2cd-468c-b383-a5fc9f7bb1f9', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'b8410236-ef31-4132-9a2d-a6072f0f0a22', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'9c7aea03-4519-4306-9870-a8dbf2e190bd', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f92d8791-0833-43a1-aade-a9d83e443d4b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'41727857-0c98-4c20-aa3f-aac6c34a9da7', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'14c4dcdd-3300-4aa8-8d45-ab43608d3dde', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ddc0d241-f241-4961-bb9d-ac56a5b1b12b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'aaab4cbf-0d03-41e3-a3f5-ad1ff240c76a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'618d8d41-3b79-4fae-95fc-adc8b4fec80f', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c689ba37-29a3-4d4e-8ab6-adfd5545f13f', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f019fd18-f1cf-41e7-b9f5-ae2132d68b85', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd9d6e3e8-5f55-4e9d-b230-aec244dfbac3', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'99a6788e-b28f-494e-a376-af0aac245250', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f4298d72-2b52-4ed7-a67b-af6ff70c0dcd', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'1e3f53b2-b09b-4ee3-9117-afec44980e65', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'fee41b9d-a84f-46d5-8b04-b0b1e1285dec', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'89630a9d-5d14-4f5f-84f3-b192fbae3186', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c707df02-39e8-4694-9b79-b21fb2322b94', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'b8ac0012-4d97-4454-a80c-b2c79dc93cdd', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'763c07f4-a617-48cc-a210-b3444f4e5dd4', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'187abf87-9513-4960-9d7e-b35ad6bec3a3', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'6f5de05a-b69e-4891-baa4-b659e0ccb188', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f2a26e57-6ea8-4780-875f-b6f80ea28525', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'0c6e99a8-b866-4256-b14c-b7506e6d9084', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'009aadb0-8f78-4b26-9f8b-b8b92ce0dd8b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'a9cb5d50-eecf-4d90-a5e3-b8f3c2c73c1d', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'62512573-a1b0-4dc9-83d7-b91ab0aab58f', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'b7272ebd-b166-4ee2-a64a-ba0ff791e16d', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'e9318ed4-6daa-47d9-a25b-bb3a7fe58f26', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ec58655a-6cc4-4db4-8fb6-bb980e618198', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'b1994cda-584c-465b-a5ea-bbb4a6c1efbd', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'da934b5e-edce-4850-86a4-bbb59f9d0617', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'99cd51d2-4d4e-4a33-8405-bbb96d00a5bb', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'ffa42a65-fa55-434b-8438-bbd4d18b3de1', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'6d3e01c1-acad-47aa-ab34-bc0613c3dffd', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c7319fb6-b1d9-422a-81e7-bd5917cff666', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7396bcf3-641a-457c-babd-be110d16febb', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'bf8db45e-6591-49f3-866e-bebf30f9fb0b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'75037bf6-6f28-4078-be30-c0ed533bf0c6', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'9d2a95f4-ce93-46b9-8791-c17a62e271f7', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c3bb853b-b261-44f2-bd7b-c19f437ede2d', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'54eb83a4-7f4f-4bbe-8db5-c2aed44b9c57', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'34ea1155-9e64-42c2-8f47-c3cc6ea1bbd3', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'420967bf-acd6-432d-aa60-c45180d41d6a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'3db0b74a-7dde-421f-8e88-c56a571e2973', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd96d3922-45dc-47e0-b9b5-c5e0cc610233', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7dbb0493-2a93-4cc6-a2b8-c5fae1d8157e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f6091a0e-b6a4-4c04-a181-c6f1ff00d52a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd0403397-eee7-4f88-99c8-c721832e6132', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'3107f98e-e0bb-4977-966c-c93f271f6d11', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'8fac3474-246d-41e4-a0ca-c98490468863', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'547fb254-da14-467b-a3f7-ca64be80fd5d', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'8e0e25ed-5e83-4871-a117-cb087819d125', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'5aca9605-19be-4b78-8222-cb778a04ad79', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'07e4434a-e199-4810-b8a8-cb9d7b22806c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'13cf6710-e07e-4bf6-b70c-cc4598210391', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'4619bfb6-00e2-4489-8a84-ce2b26638347', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'861ca5d3-1f41-4131-99aa-cf408f385250', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'b8802795-e5d2-4f84-ad72-d01bc2a3bc55', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'05f37d5f-323b-496b-894a-d31320fdab9a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'46f5b51f-0661-4939-8174-d3ca7f57fef5', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'bb047dcd-260e-4457-b061-d42f1209b5d0', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'a13fbb14-80a7-47d6-9b5a-d4aa7d109e0a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f97af5c8-3394-4ef2-8c23-d4ce2b56bd23', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'12164948-7560-4a0a-b121-d5be3385f282', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'3ccfd888-f5a9-4e78-99cc-d5bffcf229f0', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'df7ada49-ac1d-45ff-925e-d7ad09d5527f', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'9ee8b1fd-fb8a-413d-b155-d9b3f4decfe4', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'76e5aea5-767a-44ba-abe3-da30e7ba889b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'63e0a3fa-e60b-44fe-8957-da4089ed59f6', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f071fbc4-4502-4c58-a67a-da68fe8a9c8e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'9d2ad028-d5d7-40ca-9875-dae6dbcfb52c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f9fd2d17-f2cc-4a13-b66c-db915ffb70c6', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7429afa7-b5a6-4b08-96b9-dbdbee8ef364', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'955955fc-7e9f-4f1d-b711-dc43aa9b0a80', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'89dee13e-00de-4c92-9e26-dca69b3a1c10', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'e23ebbf8-53d3-4ee7-8f99-dcddf97ad9d4', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'056d878a-f802-445a-b67a-dd282e3233de', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'3cc855f3-0419-4f06-bfcd-de96c945cc23', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'963bc3b8-50cd-4bcd-aa40-dec45d729b55', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'8372ea69-8b6f-45d3-94fb-df31351516a0', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'5b0b6032-96ef-4e39-a941-e01d70cfd929', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
GO
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'3558ca33-fd6b-4f98-aa14-e0744b701503', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'3acec333-18e4-41ec-aaa7-e1eb6b80fa50', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'91d90461-c22f-4570-893c-e22810b8c63e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'73aec00f-e6f4-4d66-813f-e31628b7b677', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'e297b611-b0f0-4eaa-8464-e48cb19d2d2c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'662b2aab-787a-4f42-b75f-e4b4b5f5f25f', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'67dd5043-6169-415b-83d0-e5636329c9f3', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'1df0d2e7-fd20-48ec-b8c6-e5650ec55cc3', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'9edec753-bb2d-4629-8b60-e61e1c3e1b98', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'e4385868-240a-41bc-8ad7-e63c80d8e05b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c5902abe-8fa2-4a39-8b08-e6c53ab1bab6', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'2def74be-6856-4225-a7f8-e74e5a968748', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'cb3c6070-7a21-47fc-ae40-e7a59b80c4f6', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'8e54e24a-6dc2-415b-a823-e7cb91a92d54', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'596e1143-59c6-4b70-a8aa-e7f628d7a2da', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'4bff29c9-19d8-44be-9da4-e949aebfca5c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'1611b439-7d73-48ab-9504-ea03d1b2ad3d', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'b1363a96-dcc9-4883-acfb-eb96ef62477d', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'd614aba9-7542-40b0-8029-ebad1972a07a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'8a3ec1b1-812f-4f90-941a-ec0381af0d4c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'f44d93a3-7418-4402-9485-ec92cbf182e2', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'3e9a19c6-1294-4d12-96a1-ed37a7d940b5', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'94bd1bf3-921a-4617-8b96-ed8b89810470', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'a939c1cb-328c-49ea-99e2-edcc57a0a7d7', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'86650844-0c63-464e-9929-ee04e75edb2a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'320faa14-4989-4b3c-956e-eff3ab441413', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c421c6a5-2a10-41ce-8ca0-f019ea20196b', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'62d07f47-ba94-47f5-b08e-f031365edccc', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'217f67fa-8eb5-4c0d-8918-f06446427347', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'621d77ae-b8dc-4167-a9ad-f092a1a125ce', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7bad2050-24a9-486f-846a-f09c7f66572a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'1e163e02-8219-48fe-9d7f-f170370af59f', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'aba90f08-8e8a-4a2c-95f4-f1f18c55ac26', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'7d8969c5-f76e-4fcb-b113-f1fc183f5f11', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'eb63178b-19ed-4fab-b107-f2249964f4d7', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'0310ba73-abbd-452f-beb6-f3533aba3326', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'16a150cc-7bb0-4a5b-8c7e-f3e56b3a1803', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'44370819-54d4-4eb7-96a8-f4074887d661', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'c31899fe-e46e-416e-8a3c-f5af5f2a597c', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'6cb0b772-40a1-4b16-bd35-f616961dd227', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'6acd3bb6-bf6e-4243-ae60-f69387baaf91', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'19d2a722-8518-474b-a715-f6f8a16cb643', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'af8fe675-b962-4600-aa92-f70a8d44de02', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'3defbcbe-867e-40e2-840e-f85d96ef90c4', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'6a1984d4-95f0-4215-a370-f90ddba23cd5', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'54f0cd22-1a3f-457f-a915-f922d9e41b29', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'90aa1b26-b087-4427-8ff7-f95bd1ec75bf', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'52f180d0-ad0f-417a-9c00-fae60f59899e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'0dcecd58-965f-4604-b56f-fae6739ffbd7', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'abdf3841-a5ea-4243-8d7f-fc2aa5f958b0', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'0943ba7a-cd73-4dca-bf20-fd37bb93136e', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'4097e181-4135-4d25-bd97-fd59263e4c1a', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
INSERT [dbo].[EventLog] ([ID], [EventDate], [Description]) VALUES (N'bdcf7d9a-7ce1-4e66-9e07-ffb7e3ea3543', CAST(N'2022-09-15T00:12:29.6053905' AS DateTime2), N'Product Versions table has been modified.')
GO
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'df333c29-e055-4da4-957f-08da969acaa1', N'NewTextName', N'new bla-bla22')
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'cd70b65f-f514-4782-bd9c-09c800a811a5', N'-404064266', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'dd2d6852-faf2-4880-ba65-0f6f03141106', N'-55319783', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'db057368-2658-419c-8673-109e9e9de76f', N'1802418984', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'139034c1-b69f-4735-8f0e-1115e9eb66ae', N'-271423688', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'795c0b0c-ac4e-43b8-a057-1176151ea737', N'2069032695', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'f449746d-7f3e-4190-9bde-139c498e232c', N'99179393', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'bb8c65d8-9740-4cfd-9c0b-1953d74fdcca', N'1857337043', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'7c310e5d-4546-4a34-bfbf-1a3806dd583b', N'893856162', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'34df612d-3eda-4633-a2d9-1ecbc7c21580', N'971457682', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'86b69b7e-06cb-4d06-9845-1f8d9fb093ec', N'-1438881614', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'0406f450-b8a7-463e-8178-22893e7b7a6f', N'-1537192120', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'68f7b31b-bd78-4e9c-b259-25ddd090c8f0', N'193382145', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'92f86a79-9c25-481e-aeb4-26122b38f548', N'-2143978791', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'7d17af98-255e-48ba-99d2-278ebf0a89f8', N'1124291296', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'99e39053-5a74-4366-937d-2db53154ef93', N'-62397563', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'8d70fbbb-fdf0-4e24-9b29-31fd9173f1d9', N'-409707455', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'5ea34cdb-531c-4406-8022-365c252f13d4', N'-1837100446', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'68093f27-2100-425b-9f4b-38b1a151097b', N'-530381799', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'4c24ba11-0f71-4fe3-a4f9-3d38d7c1d3d7', N'-332821229', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'42e84bc9-860b-4ce9-8f40-4296f93d376c', N'-193679180', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'3479a772-6cfa-4f0b-948c-466f926b089c', N'-2009322354', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'b041f5ac-a478-4271-91ad-4f692611ba28', N'-1278874269', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'fdcec151-32bc-4ccf-ba94-523abee078b6', N'1026263017', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'5200462d-4f84-4395-bdab-52b3ca7d8e85', N'659152862', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'78f74b4b-67a5-4fc9-b928-52e1977623e2', N'877621952', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'9d634386-80d9-41f1-b97a-57b0a49b9bbf', N'-748805566', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'8caf74b1-e3e6-4920-a46f-5eb1ccfd6f29', N'1572734271', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'7ec50a02-a627-480b-bb30-5ee774913a6e', N'-1079374358', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'868ccc61-a666-45be-92f8-5f6d11f1e5da', N'1955095428', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'188ca4c2-7aee-495d-985e-603d172e7632', N'1590144675', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'ff9b2f02-dd23-46cc-9cec-609c7146d89d', N'-1192273716', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'f0c173e0-934a-4349-ad73-64b422cf4ea6', N'-1583195099', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'c725427e-4295-4419-8ab1-6a457cfbe0b8', N'2125875741', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'757ca6be-85bd-4c53-8ca4-6b1ce352ceaf', N'-1970612884', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'd8bdc87d-84d6-4794-a4e0-6d925f74582f', N'572315728', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'279ac355-5825-4b33-ac50-6ffd65dc9e30', N'-1588062279', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'f159e6a6-d4d7-4428-b6ad-709d49731e7d', N'1428155534', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'12bc9aa0-e8c4-4a8b-ab01-7681e21d3212', N'-881627603', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'5af5f169-cf22-4d27-8739-7712a5b6cc24', N'560574825', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'3d918938-1696-47ac-963f-7aded5e3b265', N'-1040890899', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'eb3b0b54-b497-4323-baf2-7b1a859483c0', N'1927338492', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'4454f227-89d4-4e4b-afcb-7e0796042cc3', N'-833768246', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'6b4462c6-0238-4ff5-8a0b-82bdd7897111', N'-2008882525', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'f7a15ee9-2016-41ef-bb53-85a6a2993c3b', N'737653990', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'4c699450-dc59-4d6b-ae30-892dacd4a903', N'790801419', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'0963433d-e303-42eb-b9e2-89414a0d2616', N'472338381', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'6aa0b9b2-b26c-4846-8337-9409b0a60346', N'1836161773', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'80565d07-7c14-4751-80cc-944f2ff11265', N'-310305604', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'313f87bc-3e86-491c-bdae-96d742afcab7', N'411023557', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'343ecebe-159b-46ee-a74e-9791a7e83d50', N'-1283818203', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'203b94b0-9866-4222-a13b-990d7f963ce4', N'-1950572280', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'dc6884fc-01f3-492e-9c83-999a8b5d66a1', N'-1363584232', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'ed673369-ca60-4caf-bc07-99c0874ac053', N'848409650', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'531b1d0e-65ea-4fec-88f8-9be10d824459', N'-1540881823', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'a0418660-0c56-49d7-977b-9ea87c962366', N'657156061', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'25e37ea4-b2e0-457b-952d-9f8bdd005d79', N'-1839537908', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'15e5a714-8c3b-4def-b78a-a5d1ed3a6a70', N'-104490123', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'35b5a532-d82e-4f14-8e0d-a84e3ae55c24', N'274044328', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'90c4889c-5500-47a2-89d3-aa66f51b98e9', N'1481905632', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'd963e821-60bc-4026-8d6d-ad14ff6085dd', N'1349354991', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'e633c70f-37d1-426b-80f8-b34fa0f2797c', N'-1751975170', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'9ce09b56-c144-4052-b8f1-b5f0d3cd4053', N'2135385721', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'3c6e5820-2cc6-40fd-8268-b621a5eaf696', N'-875301183', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'2135bab5-6155-430c-8e6a-b91cffc52c64', N'447509649', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'49476114-5f77-43b1-b1ec-ba4e1632ffc7', N'-2085363516', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'899066c7-9f6a-4a12-8fcb-bab2ca836247', N'911913448', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'aa36f608-97b4-48f3-8edd-be0bc55dd137', N'-559226377', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'3b099914-c24c-4189-a884-be6fc9cb58a3', N'-1234824135', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'5e9af171-df7f-437b-822b-be79b5058fcf', N'-1412431815', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'efec9047-7eda-4abe-a7d7-bfc04d7b591c', N'2041856631', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'd726d23a-5ed1-46c2-9853-c0691abbfaa7', N'1608410217', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'b05c81c4-283b-458e-a9f7-c5eefdb68cf1', N'-358881109', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'32bfbafc-455f-4fba-bf17-c60af0f46f89', N'-22274836', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'445a6953-cd2d-4b41-afa5-ce46f6804346', N'261521703', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'a89c6ec0-aaf2-4b61-a8bb-ced5bfa9f3ab', N'-1648306651', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'fbdbc72b-6aab-4a77-8757-cf075d910d41', N'-143758502', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'1a927e72-b824-4e3b-8200-cf2fbcccc46e', N'362941032', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'28445c7d-6566-4173-98aa-d27a72cf0285', N'-1763222287', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'215704c6-ebf2-45d0-920c-d5d36e27a843', N'-184892216', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'56c83af1-91a6-4af4-a132-d70a7736111e', N'150646657', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'7fb35273-3b0f-4e76-8b37-db1c9f9dde3a', N'398508904', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'731832f2-d430-4dc7-9903-dd5438fb8645', N'797187683', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'06f155cf-5264-4be1-83b9-de540aea709e', N'-2017569758', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'98f714d6-08f1-4ed7-83fa-df19260b7b68', N'-1484460670', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'e953a16a-5331-425f-bef8-e705d8a11ca3', N'234335037', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'c71e1ae9-3a4c-4cbe-add5-e77875460ad1', N'575517565', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'739c9220-593a-49ca-845f-eb3ac3eae680', N'-2141487523', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'3b09ac4c-3e7e-48cb-92db-eef4437b1cd2', N'1429222115', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'58e8e7f2-2438-439c-b7fe-f055ef053d9b', N'-709281646', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'60049e2e-9108-4ac1-8140-f41ac2a92a5d', N'1830544997', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'82c05624-a548-49a3-af68-f69f5abb179d', N'-914218855', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'b4577d24-3781-4a9c-bc8d-f73c52cf4284', N'1182664779', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'fd2e15d3-eae1-4b12-9864-f7b2158654e0', N'-459334209', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'75daddfc-f227-408f-ba10-f932f7a69e5f', N'1479711126', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'77389250-9a03-47da-85e8-f94d02ab2ad3', N'-1372501036', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'7b287a84-2fcb-40d1-ae91-fa584c3f2e28', N'1261304749', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'be9df20d-7577-4318-ad0a-fa7cf2768346', N'-939721947', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Description]) VALUES (N'02bbb8d3-a411-425e-8ea6-ff775eacb622', N'363599378', NULL)
GO
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'f03aaf0d-36a8-43b4-8e18-008e4dd31c63', N'42e84bc9-860b-4ce9-8f40-4296f93d376c', N'1586647654', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 6, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'2c8daf59-5fc1-4aaf-b86d-00bb5e37f975', N'82c05624-a548-49a3-af68-f69f5abb179d', N'-1461998978', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 3, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'cb611108-5768-4889-9290-0210d6b3db2d', N'32bfbafc-455f-4fba-bf17-c60af0f46f89', N'-1104059100', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 1, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'2506a94d-b9dd-49f8-8314-046d9409a3d5', N'8d70fbbb-fdf0-4e24-9b29-31fd9173f1d9', N'-732361337', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 5, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'd1ff99fc-09ca-4f07-85c1-06d94ac736ce', N'c71e1ae9-3a4c-4cbe-add5-e77875460ad1', N'-1983342855', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 7, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'0ef7be20-fdc1-4cc1-b200-06e169cad58e', N'2135bab5-6155-430c-8e6a-b91cffc52c64', N'770017594', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 4, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'e4ff0abf-ea06-4150-b0e3-086cf400f4ec', N'02bbb8d3-a411-425e-8ea6-ff775eacb622', N'626197501', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 8, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'423afbd9-7177-491e-8129-09086d0a4972', N'd963e821-60bc-4026-8d6d-ad14ff6085dd', N'1902422338', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 8, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'e3b05469-ca0c-480d-a6d7-09cb199d68af', N'efec9047-7eda-4abe-a7d7-bfc04d7b591c', N'-807611174', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 2, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'f8e6664a-08db-454e-abc3-0b4973de7337', N'02bbb8d3-a411-425e-8ea6-ff775eacb622', N'-1009749175', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 7, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'442cdaa0-a65d-4ac3-ba28-0bf733ee58df', N'5200462d-4f84-4395-bdab-52b3ca7d8e85', N'649902708', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 6, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'5cf7287c-475e-42a3-9e2e-0c94688ae0e9', N'5200462d-4f84-4395-bdab-52b3ca7d8e85', N'1673055188', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 3, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'13ced303-3d04-43ce-a571-0caf365d351f', N'0963433d-e303-42eb-b9e2-89414a0d2616', N'-533085548', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 4, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'ffa62faa-2544-440e-9714-0def1b3b5fe1', N'56c83af1-91a6-4af4-a132-d70a7736111e', N'-1241897630', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 3, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'0d26fc16-3276-4dde-858a-0e6579cc4703', N'06f155cf-5264-4be1-83b9-de540aea709e', N'649169052', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 6, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'ec4a611b-52b4-478f-b38e-1047a394cd1d', N'6aa0b9b2-b26c-4846-8337-9409b0a60346', N'-250074689', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 2, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'0b826317-b2ff-4220-a4f0-109bf4ca5f4f', N'f159e6a6-d4d7-4428-b6ad-709d49731e7d', N'-1645352008', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 8, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'b041c107-a116-4539-ba30-13d28a5f0fcf', N'4c699450-dc59-4d6b-ae30-892dacd4a903', N'-396095711', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 8, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'780caea1-0dfd-453f-ba9d-158aa52415f4', N'c725427e-4295-4419-8ab1-6a457cfbe0b8', N'1127422531', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 3, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'6b10e0f4-b9b7-4fa0-a392-15e51ad8c8c7', N'7ec50a02-a627-480b-bb30-5ee774913a6e', N'107811834', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 7, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'd0335a9b-54fa-4879-b67c-19434a793ffa', N'efec9047-7eda-4abe-a7d7-bfc04d7b591c', N'560728989', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 1, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'88980811-6fd6-42ee-bade-1969bb041461', N'fd2e15d3-eae1-4b12-9864-f7b2158654e0', N'-1032077882', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 7, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'f750cd08-9415-4ba2-80c6-1b4ca68661c6', N'f449746d-7f3e-4190-9bde-139c498e232c', N'914889019', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 3, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'85576305-1e8b-4dfa-a3ba-1b5437ba6e51', N'35b5a532-d82e-4f14-8e0d-a84e3ae55c24', N'-841450214', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 3, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'1f82d1d8-298a-4993-839b-1c4b9769e75f', N'db057368-2658-419c-8673-109e9e9de76f', N'1122634310', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 9, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'81c6ab54-eab0-47dc-bc25-1d6c47c95eda', N'279ac355-5825-4b33-ac50-6ffd65dc9e30', N'1884925215', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 7, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'c10987ac-0d8d-4e4c-b71a-1e9f4bc96f9b', N'4c699450-dc59-4d6b-ae30-892dacd4a903', N'-1959503395', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 2, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'9accd815-484e-4b44-8711-1f09481cd3b5', N'731832f2-d430-4dc7-9903-dd5438fb8645', N'1833213332', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 3, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'b6eab55e-67eb-4889-8661-204d62a1964f', N'343ecebe-159b-46ee-a74e-9791a7e83d50', N'-53145007', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 3, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'f2d7d13a-167e-4e38-83d8-209cbe04baab', N'188ca4c2-7aee-495d-985e-603d172e7632', N'-1955259527', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 5, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'da93a270-5609-4e6a-a0dd-20bb1a939434', N'fdcec151-32bc-4ccf-ba94-523abee078b6', N'458078915', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 6, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'80f972b0-59dd-4087-af8f-20ebbac1f531', N'a0418660-0c56-49d7-977b-9ea87c962366', N'447440248', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 2, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'8dd15847-f5b7-44d8-8f4f-227c6b17cb53', N'35b5a532-d82e-4f14-8e0d-a84e3ae55c24', N'-421464812', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 5, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'46316562-7dab-4950-ba4b-22f0581793ee', N'fdcec151-32bc-4ccf-ba94-523abee078b6', N'298861611', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 4, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'4f264bdb-b72b-472f-8a08-244f87accfa6', N'203b94b0-9866-4222-a13b-990d7f963ce4', N'-505259779', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 5, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'88dda786-5dcc-42d3-a9a4-24f372fef5fa', N'731832f2-d430-4dc7-9903-dd5438fb8645', N'-1008754543', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 1, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'2f572434-4ec8-4497-8903-253c8081ea08', N'34df612d-3eda-4633-a2d9-1ecbc7c21580', N'1594878197', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 2, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'9954b9ac-109c-4185-9d30-256b6dddddf4', N'42e84bc9-860b-4ce9-8f40-4296f93d376c', N'1193886912', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 8, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'ab0a4798-4cf0-439b-9c72-258415172388', N'3b09ac4c-3e7e-48cb-92db-eef4437b1cd2', N'-459837727', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 9, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'5cd359f3-5221-4717-9180-263df7183f8f', N'd726d23a-5ed1-46c2-9853-c0691abbfaa7', N'-1445096524', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 2, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'a14f511f-bfa1-4004-a245-26691caef50c', N'6aa0b9b2-b26c-4846-8337-9409b0a60346', N'-2070412032', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 8, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'892c0017-17e3-40b8-a4bf-27cb27260b10', N'92f86a79-9c25-481e-aeb4-26122b38f548', N'314084983', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 6, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'1c7a01b8-a1e6-4849-89be-27ede8e9f9a2', N'60049e2e-9108-4ac1-8140-f41ac2a92a5d', N'468580159', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 6, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'3c2d48cd-1e4f-4f79-824f-2883f4ccb2fc', N'f449746d-7f3e-4190-9bde-139c498e232c', N'214881780', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 5, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'7a2e7d46-1774-4713-a67f-29aa59afbc16', N'35b5a532-d82e-4f14-8e0d-a84e3ae55c24', N'-2119648563', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 3, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'd2fe9969-4b88-43e2-bc24-2adfb5ae7865', N'4454f227-89d4-4e4b-afcb-7e0796042cc3', N'726554856', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 3, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'4705843e-24ab-42d8-85f9-2b2e369fc786', N'68f7b31b-bd78-4e9c-b259-25ddd090c8f0', N'-1389246938', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 2, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'70ece2ea-3857-4afb-a25b-2b6518b6dac3', N'68093f27-2100-425b-9f4b-38b1a151097b', N'-1662634233', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 5, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'dd44c426-a23f-4ecf-aee9-2d084b9fdf1f', N'b05c81c4-283b-458e-a9f7-c5eefdb68cf1', N'-2072440580', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 3, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'1f6377a8-b18d-4e67-a8f3-2e0d0a684d54', N'739c9220-593a-49ca-845f-eb3ac3eae680', N'140991879', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 5, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'2880d3a3-fb8f-41c3-902d-2e6b475e80c3', N'82c05624-a548-49a3-af68-f69f5abb179d', N'-1041409029', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 2, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'9f11a1a0-efe6-4e5f-a7bd-2e7357f04e3c', N'68093f27-2100-425b-9f4b-38b1a151097b', N'-1641151562', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 1, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'3ebcb752-a484-4e48-8c31-2f6a7517bf52', N'efec9047-7eda-4abe-a7d7-bfc04d7b591c', N'1214526767', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 7, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'ded3a8ec-cbd6-4ef8-9a39-3105ce72913f', N'99e39053-5a74-4366-937d-2db53154ef93', N'-1433720722', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 4, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'9e2330cd-5c91-4a1e-94b6-31a9be2e8dc5', N'ed673369-ca60-4caf-bc07-99c0874ac053', N'-1199442826', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 3, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'6de5e219-db33-44bd-8553-33a76782a3c8', N'3479a772-6cfa-4f0b-948c-466f926b089c', N'1187571912', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 2, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'bfeb0749-47db-4a1f-9f9c-342e48a8ab82', N'7b287a84-2fcb-40d1-ae91-fa584c3f2e28', N'1500214341', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 4, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'23f75f28-8a35-42c9-8719-37fecdf92428', N'a0418660-0c56-49d7-977b-9ea87c962366', N'-1221773993', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 2, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'1dcb453e-41ad-4572-b265-38e6b40af0cb', N'90c4889c-5500-47a2-89d3-aa66f51b98e9', N'1970367381', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 7, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'8b0ba040-d612-41d1-80c2-3b72d915f4c6', N'313f87bc-3e86-491c-bdae-96d742afcab7', N'2115346699', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 2, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'634a1d67-74df-4232-8bae-3d72df96861d', N'445a6953-cd2d-4b41-afa5-ce46f6804346', N'1321423340', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 9, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'61d17f06-4a8f-4eaa-a004-3e0d9c089233', N'15e5a714-8c3b-4def-b78a-a5d1ed3a6a70', N'299317685', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 3, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'ba110518-939a-4aaa-b2a3-3e7fe033ab7f', N'92f86a79-9c25-481e-aeb4-26122b38f548', N'-265419056', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 6, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'b82721a6-163a-46ab-ad00-3f9454e81631', N'b05c81c4-283b-458e-a9f7-c5eefdb68cf1', N'1537597285', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 5, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'9e4dba05-509f-4309-896d-4146240974e5', N'1a927e72-b824-4e3b-8200-cf2fbcccc46e', N'2121371191', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 2, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'bbd0ffba-1797-4588-af19-426a2911bcfb', N'215704c6-ebf2-45d0-920c-d5d36e27a843', N'1873207467', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 4, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'1ba733b5-6a93-47a8-8e0d-43cc6f13180e', N'dc6884fc-01f3-492e-9c83-999a8b5d66a1', N'-1638643769', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 3, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'981832e7-e59b-4721-a402-44ddc64f81d7', N'203b94b0-9866-4222-a13b-990d7f963ce4', N'-704865762', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 8, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'0609a2ee-8c7f-4645-9916-4620ad3a1d39', N'c725427e-4295-4419-8ab1-6a457cfbe0b8', N'1494680229', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 2, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'4306dfb5-5f66-4ca9-8c38-4781a362d30b', N'5ea34cdb-531c-4406-8022-365c252f13d4', N'-2059674884', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 2, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'd35face4-b407-43a5-91c4-481763b41d20', N'a89c6ec0-aaf2-4b61-a8bb-ced5bfa9f3ab', N'-1481676783', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 5, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'aa30ca7f-1a27-4c51-8a45-48e51fed5478', N'fbdbc72b-6aab-4a77-8757-cf075d910d41', N'2071820493', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 3, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'1e6e5598-3025-4d7d-8a2a-50053fb3550c', N'fd2e15d3-eae1-4b12-9864-f7b2158654e0', N'1511455752', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 8, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'80024b3b-bbe7-43cc-a62a-51eae2c3e493', N'bb8c65d8-9740-4cfd-9c0b-1953d74fdcca', N'-1166337640', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 9, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'428ac4d1-2ba5-4498-b070-520dcced3970', N'b4577d24-3781-4a9c-bc8d-f73c52cf4284', N'2071556616', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 7, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'df840f32-7e14-4f30-af85-537463936c6f', N'3c6e5820-2cc6-40fd-8268-b621a5eaf696', N'-1953798166', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 9, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'dc786ad0-3414-4421-8274-548a26ff64cc', N'56c83af1-91a6-4af4-a132-d70a7736111e', N'-563489440', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 8, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'dd43b7b7-f6df-413e-8a37-54e7049ec692', N'b041f5ac-a478-4271-91ad-4f692611ba28', N'-370153242', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 4, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'f1dd949a-623b-42ae-9d96-55fc5a427d56', N'fd2e15d3-eae1-4b12-9864-f7b2158654e0', N'425402982', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 3, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'0c20dc59-51a6-4ccf-8463-57c2b56c6942', N'60049e2e-9108-4ac1-8140-f41ac2a92a5d', N'-1060011314', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 9, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'9c1a03aa-3dd1-4f03-ba67-58f2dad8ff6b', N'db057368-2658-419c-8673-109e9e9de76f', N'1253998875', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 9, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'61c3f73a-5ba8-4b1f-be3d-590a1a1c45b8', N'82c05624-a548-49a3-af68-f69f5abb179d', N'-1732211402', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 6, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'53bd10be-7b34-4504-8c38-59102e99af25', N'82c05624-a548-49a3-af68-f69f5abb179d', N'592431656', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 4, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'907a0d19-5e90-462d-bce3-5a88e6312cd7', N'fdcec151-32bc-4ccf-ba94-523abee078b6', N'-1994292781', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 2, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'9844cb99-a52f-4052-8b27-5af7b8c66ea3', N'4c24ba11-0f71-4fe3-a4f9-3d38d7c1d3d7', N'-1943892091', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 5, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'bc2feb21-406a-474e-a696-5b2b1c284f02', N'd8bdc87d-84d6-4794-a4e0-6d925f74582f', N'-764078607', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 6, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'f15bf4ec-82b1-43f4-aeb6-5cd35cf13e05', N'7c310e5d-4546-4a34-bfbf-1a3806dd583b', N'1691169199', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 7, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'6279d5a9-2407-4670-87b4-5cde0a40f930', N'56c83af1-91a6-4af4-a132-d70a7736111e', N'-894696157', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 8, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'29b2339c-6781-4d5c-b901-5d63449528f6', N'02bbb8d3-a411-425e-8ea6-ff775eacb622', N'-241450784', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 2, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'12bc5c49-6ab6-4bba-93a0-5db9eda945b8', N'5e9af171-df7f-437b-822b-be79b5058fcf', N'1478377345', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 3, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'68424646-87ce-41d7-9d32-5dff7308c0ee', N'db057368-2658-419c-8673-109e9e9de76f', N'940112742', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 9, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'3e7ae4a8-5a9b-43ae-95a5-5e65f463c882', N'77389250-9a03-47da-85e8-f94d02ab2ad3', N'-1706919854', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 1, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'df832570-24ff-4ff2-935f-5fc34b0e36db', N'215704c6-ebf2-45d0-920c-d5d36e27a843', N'-2011672489', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 2, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'c612aa4b-adf3-4f00-b9ab-6038f5b8cbee', N'c71e1ae9-3a4c-4cbe-add5-e77875460ad1', N'1605965044', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 3, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'c8d73b79-0a1c-4683-bf15-6109e78b4003', N'739c9220-593a-49ca-845f-eb3ac3eae680', N'-2072662211', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 6, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'4e7e9774-45a9-4749-b60c-6239f30b69c9', N'42e84bc9-860b-4ce9-8f40-4296f93d376c', N'-113453672', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 7, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'b95818d6-c909-44d6-8df9-64af406eddcf', N'1a927e72-b824-4e3b-8200-cf2fbcccc46e', N'-1657321966', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 8, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'855bdad3-808d-4203-a1fe-64b3ff4bbd8b', N'98f714d6-08f1-4ed7-83fa-df19260b7b68', N'-8261888', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 1, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'239d106d-6959-4274-976c-67166fea880f', N'78f74b4b-67a5-4fc9-b928-52e1977623e2', N'2013724620', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 3, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'b2556b67-c7ce-4414-86e9-67d6af63c8b0', N'ed673369-ca60-4caf-bc07-99c0874ac053', N'-1863440768', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 2, 8)
GO
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'ac71fd6a-a75a-4c63-9cb0-682e1dfab1e7', N'188ca4c2-7aee-495d-985e-603d172e7632', N'701173937', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 6, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'23d3d331-9a4c-4219-a354-6867b1ac4df4', N'86b69b7e-06cb-4d06-9845-1f8d9fb093ec', N'-219172497', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 4, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'a0d6e09b-6d33-4325-becb-68af96229d7c', N'99e39053-5a74-4366-937d-2db53154ef93', N'805725312', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 1, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'7a216155-ff35-41c0-8d37-6940f3931667', N'3479a772-6cfa-4f0b-948c-466f926b089c', N'480131614', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 3, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'44827642-22ea-4a77-90ee-69441dba8c11', N'68f7b31b-bd78-4e9c-b259-25ddd090c8f0', N'1527775269', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 2, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'3360d4d8-fce8-4537-b725-695e322870fa', N'be9df20d-7577-4318-ad0a-fa7cf2768346', N'-766630475', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 4, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'f74b9982-ba77-46f4-9acb-6bf00539147e', N'aa36f608-97b4-48f3-8edd-be0bc55dd137', N'1069601130', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 5, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'8d8f1581-440b-4c3a-bd2b-6c0ce5dfbc45', N'60049e2e-9108-4ac1-8140-f41ac2a92a5d', N'-2006604334', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 9, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'120b23d3-790b-4285-b4ac-6c5e38673abf', N'8caf74b1-e3e6-4920-a46f-5eb1ccfd6f29', N'-1311207084', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 2, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'329b48bc-2f5d-4416-a27f-6d897d7e7f62', N'ed673369-ca60-4caf-bc07-99c0874ac053', N'-1650497986', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 8, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'2a0e529f-bcd7-4083-be3a-6dc5770d4169', N'6b4462c6-0238-4ff5-8a0b-82bdd7897111', N'-962471551', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 3, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'36e7e1f4-b105-4e1f-b32c-6e6f7aa5c5a7', N'731832f2-d430-4dc7-9903-dd5438fb8645', N'-1336682184', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 6, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'87e3bba2-c8d9-415b-ac7a-726625c331fa', N'731832f2-d430-4dc7-9903-dd5438fb8645', N'1526450930', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 1, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'c4e58dd9-3da5-443b-acd7-7454a21db777', N'd963e821-60bc-4026-8d6d-ad14ff6085dd', N'-1558349198', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 6, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'3c67041b-06e1-4c15-8228-77d1f50bf9d5', N'739c9220-593a-49ca-845f-eb3ac3eae680', N'1962680717', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 8, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'1d4cdd45-09ec-4798-9b23-78104db2727d', N'3b099914-c24c-4189-a884-be6fc9cb58a3', N'937313663', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 1, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'e221d04e-4213-4e02-8b2c-799269791798', N'06f155cf-5264-4be1-83b9-de540aea709e', N'-1504852033', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 8, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'4396f764-a74f-431f-9944-7a420747274c', N'5200462d-4f84-4395-bdab-52b3ca7d8e85', N'248796085', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 1, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'3b43c806-cf44-49d1-8f43-7a76343f9c9a', N'f7a15ee9-2016-41ef-bb53-85a6a2993c3b', N'-1636533255', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 4, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'a59795d1-f3cd-4d48-80c1-7c905bd308c9', N'5200462d-4f84-4395-bdab-52b3ca7d8e85', N'-1314163513', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 4, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'c27bcbf3-0287-40a5-8983-7cc6b10002e1', N'7d17af98-255e-48ba-99d2-278ebf0a89f8', N'-1516221876', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 7, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'f8deb5ca-4ad7-4ac2-b2ee-7d82249f6cc8', N'e633c70f-37d1-426b-80f8-b34fa0f2797c', N'-133329269', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 8, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'2a8b6167-b393-4bce-b0da-7ea8671c3f17', N'56c83af1-91a6-4af4-a132-d70a7736111e', N'-570158045', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 9, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'6f0682fd-911e-4b92-bfaa-8167da04afa9', N'12bc9aa0-e8c4-4a8b-ab01-7681e21d3212', N'-356860538', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 7, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'c363b617-aedd-449d-894f-8326debc65db', N'98f714d6-08f1-4ed7-83fa-df19260b7b68', N'2048453533', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 1, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'186ff9e9-da37-4144-be10-839d5d5e2b74', N'90c4889c-5500-47a2-89d3-aa66f51b98e9', N'-1333564099', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 3, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'6f442d66-3922-48b6-ba23-841751176d88', N'a0418660-0c56-49d7-977b-9ea87c962366', N'-1206181713', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 2, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'6f449bff-4dfa-472f-b95b-86615ca91037', N'3c6e5820-2cc6-40fd-8268-b621a5eaf696', N'2130519264', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 3, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'40df469a-a972-47cb-8c8f-878522a98321', N'7c310e5d-4546-4a34-bfbf-1a3806dd583b', N'-1559180986', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 1, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'd51b70b3-a173-4ddf-850a-87d35967cd38', N'8caf74b1-e3e6-4920-a46f-5eb1ccfd6f29', N'1938734108', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 4, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'79fbe182-388e-4ae3-89b5-8a42accefc1c', N'68f7b31b-bd78-4e9c-b259-25ddd090c8f0', N'1835967017', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 3, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'3f39eb02-ad50-4658-8681-8a4abc8c0860', N'3c6e5820-2cc6-40fd-8268-b621a5eaf696', N'1407404904', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 8, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'0e099775-f39d-4e09-a913-8b660f7b15e2', N'b05c81c4-283b-458e-a9f7-c5eefdb68cf1', N'-996275122', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 1, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'15b49a36-654a-471d-9dc5-8db5da0ad5af', N'80565d07-7c14-4751-80cc-944f2ff11265', N'1223766075', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 3, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'd0e403c3-ae78-44ed-8b94-8e17d67dcbae', N'531b1d0e-65ea-4fec-88f8-9be10d824459', N'759973094', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 1, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'ff0cbb92-44dd-4b19-87e3-8f2105fb5540', N'06f155cf-5264-4be1-83b9-de540aea709e', N'-707794995', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 4, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'2457f35f-ae69-4359-b468-8fa19f18ef11', N'77389250-9a03-47da-85e8-f94d02ab2ad3', N'-680645347', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 3, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'eb73345c-9237-4ffc-83d4-9024d5ed6a7e', N'efec9047-7eda-4abe-a7d7-bfc04d7b591c', N'-25845955', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 7, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'50c36a9e-d96d-4c22-8c51-903ac3dedecb', N'757ca6be-85bd-4c53-8ca4-6b1ce352ceaf', N'-307282756', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 5, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'd0f23250-7e02-45cf-888e-9137007f4af5', N'ed673369-ca60-4caf-bc07-99c0874ac053', N'1474739674', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 1, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'5d9fb753-3aab-43fa-a438-91c991c4d481', N'dd2d6852-faf2-4880-ba65-0f6f03141106', N'1444966861', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 3, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'84a89517-5561-49be-9c6f-91ff4e2ed171', N'e953a16a-5331-425f-bef8-e705d8a11ca3', N'1129742756', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 8, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'4b7f3d56-d77b-4bae-b4b4-946c1426aad6', N'92f86a79-9c25-481e-aeb4-26122b38f548', N'-1158711155', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 9, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'7005b285-b961-4e0e-8730-94ab28acabd6', N'c725427e-4295-4419-8ab1-6a457cfbe0b8', N'1127520075', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 1, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'9eed6b93-ce22-4b2f-abd9-95920297fa6c', N'8caf74b1-e3e6-4920-a46f-5eb1ccfd6f29', N'732818200', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 2, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'214b3902-e34b-425f-84fa-98f0f2482fac', N'35b5a532-d82e-4f14-8e0d-a84e3ae55c24', N'1067673663', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 1, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'14c3e286-ffeb-4bb6-8a97-9a915ef629fa', N'86b69b7e-06cb-4d06-9845-1f8d9fb093ec', N'885423289', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 4, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'0d6cd8b2-5d75-4564-9c3c-9b91c3b2b9fb', N'68093f27-2100-425b-9f4b-38b1a151097b', N'573180824', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 2, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'7e4d6a30-453f-47e9-9812-9bdcf6e9bd5b', N'1a927e72-b824-4e3b-8200-cf2fbcccc46e', N'-1098722207', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 5, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'b7e4dfa0-1626-447c-b8ea-9c59707f8022', N'7c310e5d-4546-4a34-bfbf-1a3806dd583b', N'-2004591538', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 6, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'bd55f7ce-80f3-4e46-b635-9f85815f02a8', N'868ccc61-a666-45be-92f8-5f6d11f1e5da', N'-561111798', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 6, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'e53676af-8093-45d3-86c2-9fd1dd205e7f', N'98f714d6-08f1-4ed7-83fa-df19260b7b68', N'237245543', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 5, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'c08a7d88-4156-43a9-acd9-9fd375a86581', N'68093f27-2100-425b-9f4b-38b1a151097b', N'-774288121', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 2, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'c6e878bf-7618-4f77-a60e-a45907698302', N'49476114-5f77-43b1-b1ec-ba4e1632ffc7', N'-759666426', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 4, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'a7257c1a-d013-49db-a903-a54381c97c04', N'313f87bc-3e86-491c-bdae-96d742afcab7', N'-1457035743', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 9, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'5df5230a-a1ae-48c3-9392-a548cf691fcf', N'32bfbafc-455f-4fba-bf17-c60af0f46f89', N'-1836287496', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 8, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'c73c077a-1fb3-48ab-b728-a68783367cd1', N'aa36f608-97b4-48f3-8edd-be0bc55dd137', N'-649263363', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 3, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'7796d0c5-8cce-48a0-acfa-a724f0f69365', N'e953a16a-5331-425f-bef8-e705d8a11ca3', N'2114080855', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 2, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'eb29e3bf-4c9e-47e7-8f61-a853095e20ef', N'90c4889c-5500-47a2-89d3-aa66f51b98e9', N'273060007', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 1, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'df07b281-7207-4ae8-ba90-a87b8895fb4d', N'3d918938-1696-47ac-963f-7aded5e3b265', N'-1547909708', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 6, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'ff1b54a4-354e-4e22-a190-acbc074219a6', N'3d918938-1696-47ac-963f-7aded5e3b265', N'-1416842420', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 9, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'83066587-ca18-4de3-bdfd-aec76f612633', N'58e8e7f2-2438-439c-b7fe-f055ef053d9b', N'980235085', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 9, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'58fc077e-eefc-4b04-9a16-b077706e6aed', N'12bc9aa0-e8c4-4a8b-ab01-7681e21d3212', N'-1994223256', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 1, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'fa38de89-f18a-4a0e-b9fb-b098524a0ba6', N'dd2d6852-faf2-4880-ba65-0f6f03141106', N'-1903321368', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 9, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'ab251bff-6047-4f8d-8888-b1d91291b1e3', N'34df612d-3eda-4633-a2d9-1ecbc7c21580', N'-559390174', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 6, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'720297c5-e678-40a0-95ab-b1e8bef0f643', N'5e9af171-df7f-437b-822b-be79b5058fcf', N'-1713034602', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 5, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'fccfb00e-d3e5-4c75-aa56-b325204add55', N'60049e2e-9108-4ac1-8140-f41ac2a92a5d', N'-1059815583', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 4, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'4cadfdd2-1e0d-4df7-b642-b57d7061b3cd', N'78f74b4b-67a5-4fc9-b928-52e1977623e2', N'-1319321575', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 5, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'd18eab3d-d40c-41dd-af5b-b8a05543c811', N'dd2d6852-faf2-4880-ba65-0f6f03141106', N'555968459', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 9, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'761c5aca-4a37-4356-8dc2-bb58cd4a4da4', N'f0c173e0-934a-4349-ad73-64b422cf4ea6', N'-910387011', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 9, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'51269e79-7881-48b2-a84a-bbdfda283c44', N'98f714d6-08f1-4ed7-83fa-df19260b7b68', N'-2112650102', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 2, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'182ea00d-1aa2-470f-b3e9-bc31cc9feba4', N'eb3b0b54-b497-4323-baf2-7b1a859483c0', N'-898183984', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 1, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'9717b46a-4e82-4da0-bc9e-bcdbf42212a9', N'34df612d-3eda-4633-a2d9-1ecbc7c21580', N'-1474738528', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 9, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'305fa68e-c266-4fe4-bf14-bde616a6ef2d', N'3b099914-c24c-4189-a884-be6fc9cb58a3', N'-1259743679', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 3, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'ea5d9452-79ca-4b7f-af47-c131463ded48', N'bb8c65d8-9740-4cfd-9c0b-1953d74fdcca', N'-670132367', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 2, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'a2d1211d-788f-48b8-93bc-c1697e9ee4c7', N'aa36f608-97b4-48f3-8edd-be0bc55dd137', N'1145863039', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 2, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'1e107f0c-0c31-447b-817c-c1e626660e2e', N'0406f450-b8a7-463e-8178-22893e7b7a6f', N'-1834718822', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 2, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'e132e767-d79b-4e97-bfd4-c213fa95c54e', N'795c0b0c-ac4e-43b8-a057-1176151ea737', N'-224235079', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 2, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'7c6f9f72-3783-4c9a-96b5-c22c4d1bf2ae', N'5af5f169-cf22-4d27-8739-7712a5b6cc24', N'-1295710678', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 7, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'e645af57-21fe-4972-b07e-c3267bccbe65', N'32bfbafc-455f-4fba-bf17-c60af0f46f89', N'-330679198', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 2, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'fbc740ab-edaf-4639-a375-c3a6e859765d', N'899066c7-9f6a-4a12-8fcb-bab2ca836247', N'1179353423', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 1, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'd5189b51-cbaf-4c69-8b61-c3c926aee2fb', N'15e5a714-8c3b-4def-b78a-a5d1ed3a6a70', N'-1420779693', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 7, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'ae56af89-d5bf-4390-a10d-c4dc3a0a5dac', N'be9df20d-7577-4318-ad0a-fa7cf2768346', N'-1654686291', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 1, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'052e2eff-4304-470c-bfa2-c5a26d15b03f', N'34df612d-3eda-4633-a2d9-1ecbc7c21580', N'-547890647', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 9, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'c1dc6e5a-c2f3-46d3-9c21-c6f76bdd3296', N'757ca6be-85bd-4c53-8ca4-6b1ce352ceaf', N'-419737506', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 5, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'b4ed0904-4290-4a24-8203-c78f846eb07d', N'd726d23a-5ed1-46c2-9853-c0691abbfaa7', N'213788306', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 1, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'725975c2-dfd6-42e7-85ae-c8500806fd06', N'd8bdc87d-84d6-4794-a4e0-6d925f74582f', N'1720386201', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 1, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'efdee785-8af4-4233-b729-c90537bdc068', N'cd70b65f-f514-4782-bd9c-09c800a811a5', N'-1058735631', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 4, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'1a4a0a02-87f7-485e-9dbf-ca492858046f', N'ff9b2f02-dd23-46cc-9cec-609c7146d89d', N'1960471104', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 3, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'19f6a7ae-c473-4f2d-9cbf-ca63a203f1f9', N'739c9220-593a-49ca-845f-eb3ac3eae680', N'-857677853', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 9, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'461ff91c-ad48-496b-b663-cb4090b63e78', N'f449746d-7f3e-4190-9bde-139c498e232c', N'931234162', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 7, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'c7d8e6f1-2daa-4909-8175-cc601fa4dd6f', N'3479a772-6cfa-4f0b-948c-466f926b089c', N'-2118116667', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 7, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'171f4427-d70f-4800-bad3-cc9eb884d88e', N'7fb35273-3b0f-4e76-8b37-db1c9f9dde3a', N'1326171178', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 3, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'ef8c5dcb-5a15-4b79-a327-cdbca67b368d', N'90c4889c-5500-47a2-89d3-aa66f51b98e9', N'-1794221093', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 7, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'7bcfa8fc-5162-431d-9528-ce84a8a72963', N'139034c1-b69f-4735-8f0e-1115e9eb66ae', N'-550144349', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 1, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'092690ec-4d7b-441f-81c1-d1a7f72315ce', N'3479a772-6cfa-4f0b-948c-466f926b089c', N'620576737', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 6, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'0daa98d3-83fa-4e88-8685-d1f6bb8a01cc', N'9d634386-80d9-41f1-b97a-57b0a49b9bbf', N'2045907988', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 2, 8, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'97a8ff7f-d164-4414-8b3e-d2500088766f', N'b05c81c4-283b-458e-a9f7-c5eefdb68cf1', N'-333932400', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 8, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'b62caddf-f640-405c-aad6-d254c3290eec', N'203b94b0-9866-4222-a13b-990d7f963ce4', N'1319937270', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 1, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'16ad8847-2db5-4c69-ab51-d3940e29b81e', N'49476114-5f77-43b1-b1ec-ba4e1632ffc7', N'-793780905', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 4, 1)
GO
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'6cac3b6e-3147-443f-924a-d75442f7c3cb', N'b041f5ac-a478-4271-91ad-4f692611ba28', N'-1215842311', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 2, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'629d9aa9-e2f4-48cf-ab74-d7cff4e44f2b', N'b4577d24-3781-4a9c-bc8d-f73c52cf4284', N'-825563134', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 1, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'f575352e-9a64-4900-ab9c-d87f286c9b34', N'78f74b4b-67a5-4fc9-b928-52e1977623e2', N'-147431479', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 4, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'e823488a-5c57-4b45-bb62-d8f5707a3f56', N'99e39053-5a74-4366-937d-2db53154ef93', N'8457238', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 6, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'bfb52c9a-afbd-47ae-8e1e-d9349204a6a2', N'6aa0b9b2-b26c-4846-8337-9409b0a60346', N'1852086587', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 1, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'23707d13-55d3-42cb-8296-d93b0643bafc', N'32bfbafc-455f-4fba-bf17-c60af0f46f89', N'-1495728828', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 3, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'ffb8d06c-81aa-4c80-b4b2-da3eb8f5c27b', N'f159e6a6-d4d7-4428-b6ad-709d49731e7d', N'-165669174', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 6, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'9cfd3f83-f019-4c6a-876e-da98a5556d92', N'7d17af98-255e-48ba-99d2-278ebf0a89f8', N'-635374408', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 3, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'5482c48f-d43d-4392-8b50-dab244173ab2', N'fd2e15d3-eae1-4b12-9864-f7b2158654e0', N'401627005', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 5, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'778087e2-bab0-4ebb-beec-db9755bc6265', N'28445c7d-6566-4173-98aa-d27a72cf0285', N'-880644679', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 8, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'a5ea366a-7542-4164-9226-de3d7c96d29a', N'5ea34cdb-531c-4406-8022-365c252f13d4', N'1132655558', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 1, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'b63cbca8-9d23-4f49-8adc-de9d4a4ed54c', N'15e5a714-8c3b-4def-b78a-a5d1ed3a6a70', N'679392075', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 8, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'a01277e1-5f73-4cec-b197-e19748c392d1', N'02bbb8d3-a411-425e-8ea6-ff775eacb622', N'-1433568149', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 5, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'43f862f8-0673-48e5-8369-e3ea27ef8a46', N'7ec50a02-a627-480b-bb30-5ee774913a6e', N'-1485512145', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 5, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'21394f48-127e-46d8-bd9e-e4614cb4d324', N'c71e1ae9-3a4c-4cbe-add5-e77875460ad1', N'584480711', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 3, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'41b1e93d-b82f-47d3-bfb1-e47c3425441f', N'92f86a79-9c25-481e-aeb4-26122b38f548', N'1707263385', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 9, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'453ea106-45e2-4307-a86b-e48bd1b3abfc', N'899066c7-9f6a-4a12-8fcb-bab2ca836247', N'1903574173', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 1, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'cc086201-480b-49b7-80ef-e5502c16bbc5', N'80565d07-7c14-4751-80cc-944f2ff11265', N'283235238', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 3, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'66ff923d-adb3-4fe0-a37f-e6fe6ddea1fb', N'899066c7-9f6a-4a12-8fcb-bab2ca836247', N'744005184', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 3, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'2bf16b04-d187-4a95-9cb3-e7cc0004b371', N'06f155cf-5264-4be1-83b9-de540aea709e', N'-600830689', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 4, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'9084059c-64d5-43bc-8778-e7fa8e970faf', N'a0418660-0c56-49d7-977b-9ea87c962366', N'-2033152448', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 6, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'4bc5098c-accb-4659-a3ce-e80267bc5206', N'899066c7-9f6a-4a12-8fcb-bab2ca836247', N'153540483', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 1, 5)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'0ab70846-affc-4fd4-8c70-ea521b0e22e5', N'188ca4c2-7aee-495d-985e-603d172e7632', N'-223618771', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 3, 1)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'035c02a5-0528-4acf-be53-eb429b1e1fb6', N'db057368-2658-419c-8673-109e9e9de76f', N'-1117304152', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 1, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'643bb88d-140e-4329-a4f2-f1470e24df65', N'9ce09b56-c144-4052-b8f1-b5f0d3cd4053', N'87849513', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 6, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'51ac73f8-a160-41f1-a10e-f33d8117f56b', N'75daddfc-f227-408f-ba10-f932f7a69e5f', N'1180421048', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 2, 3)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'e51f156e-ceaa-40a6-bce2-f40269018d5b', N'25e37ea4-b2e0-457b-952d-9f8bdd005d79', N'-54511599', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 5, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'05746883-ce0e-43ed-a0a5-f58d1d6741c1', N'd8bdc87d-84d6-4794-a4e0-6d925f74582f', N'170746928', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 7, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'03556d05-f625-427a-b551-f627d5c01bda', N'e633c70f-37d1-426b-80f8-b34fa0f2797c', N'-1128134080', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 3, 4, 4)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'4faffb1d-a248-45e9-844e-f6a136b490ca', N'15e5a714-8c3b-4def-b78a-a5d1ed3a6a70', N'1629529063', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 1, 1, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'62a97253-bc46-4f56-96cb-f71ec4247334', N'0406f450-b8a7-463e-8178-22893e7b7a6f', N'125509959', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 6, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'23cc1de7-71b2-458e-a608-f799fba2cdd7', N'86b69b7e-06cb-4d06-9845-1f8d9fb093ec', N'679003656', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 9, 2, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'e9a1d7f7-5b08-4fba-9f34-f8be09926f42', N'86b69b7e-06cb-4d06-9845-1f8d9fb093ec', N'1519135337', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 1, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'9503a0a5-7e44-4964-a0b2-f91f0b7172ab', N'3b099914-c24c-4189-a884-be6fc9cb58a3', N'1760304458', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 5, 2, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'8f6b205d-f233-4dc3-9507-f98928e016f2', N'ff9b2f02-dd23-46cc-9cec-609c7146d89d', N'-1186515501', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 3, 7)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'e4745162-9a98-4118-b377-f99563a9392e', N'6b4462c6-0238-4ff5-8a0b-82bdd7897111', N'514594090', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 1, 8)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'da6d7ffe-1d23-4b58-ae38-f9f769e310a1', N'313f87bc-3e86-491c-bdae-96d742afcab7', N'-941836006', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 4, 8, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'e440aa83-b27e-495b-95b9-fad54b061882', N'f449746d-7f3e-4190-9bde-139c498e232c', N'-84302045', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 6, 2)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'4f6d3275-2425-42bf-8031-fee16c86563a', N'dd2d6852-faf2-4880-ba65-0f6f03141106', N'-696606276', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 6, 7, 6)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'94175d9a-eb7b-4dac-b319-ff50abb387bd', N'8caf74b1-e3e6-4920-a46f-5eb1ccfd6f29', N'885202169', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 7, 7, 9)
INSERT [dbo].[ProductVersions] ([ID], [ProductID], [Name], [Description], [CreatingDate], [Width], [Height], [Length]) VALUES (N'cd7cd4dd-19fa-4c11-85b1-fff4e6dcdde9', N'c71e1ae9-3a4c-4cbe-add5-e77875460ad1', N'-1672503228', NULL, CAST(N'2022-09-15T00:12:29.6086022' AS DateTime2), 8, 6, 1)
GO
/****** Object:  Index [IX_EventLog_EventDate]    Script Date: 15.09.2022 1:13:40 ******/
CREATE NONCLUSTERED INDEX [IX_EventLog_EventDate] ON [dbo].[EventLog]
(
	[EventDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Products_Name]    Script Date: 15.09.2022 1:13:40 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Products_Name] ON [dbo].[Products]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVersions_CreatingDate]    Script Date: 15.09.2022 1:13:40 ******/
CREATE NONCLUSTERED INDEX [IX_ProductVersions_CreatingDate] ON [dbo].[ProductVersions]
(
	[CreatingDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVersions_Height]    Script Date: 15.09.2022 1:13:40 ******/
CREATE NONCLUSTERED INDEX [IX_ProductVersions_Height] ON [dbo].[ProductVersions]
(
	[Height] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVersions_Length]    Script Date: 15.09.2022 1:13:40 ******/
CREATE NONCLUSTERED INDEX [IX_ProductVersions_Length] ON [dbo].[ProductVersions]
(
	[Length] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProductVersions_Name]    Script Date: 15.09.2022 1:13:40 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProductVersions_Name] ON [dbo].[ProductVersions]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVersions_ProductID]    Script Date: 15.09.2022 1:13:40 ******/
CREATE NONCLUSTERED INDEX [IX_ProductVersions_ProductID] ON [dbo].[ProductVersions]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVersions_Width]    Script Date: 15.09.2022 1:13:40 ******/
CREATE NONCLUSTERED INDEX [IX_ProductVersions_Width] ON [dbo].[ProductVersions]
(
	[Width] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventLog] ADD  DEFAULT ('d7054c11-cc27-4391-9e74-3661918ffcfd') FOR [ID]
GO
ALTER TABLE [dbo].[EventLog] ADD  DEFAULT ('2022-09-15T00:12:29.6053905+03:00') FOR [EventDate]
GO
ALTER TABLE [dbo].[ProductVersions] ADD  DEFAULT ('2022-09-15T00:12:29.6086022+03:00') FOR [CreatingDate]
GO
ALTER TABLE [dbo].[ProductVersions]  WITH CHECK ADD  CONSTRAINT [FK_ProductVersions_Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductVersions] CHECK CONSTRAINT [FK_ProductVersions_Products_ProductID]
GO
/****** Object:  Trigger [dbo].[TR_Products_Modify]    Script Date: 15.09.2022 1:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_Products_Modify] ON [dbo].[Products] AFTER INSERT, DELETE, UPDATE
            AS BEGIN
                INSERT INTO EventLog(ID, Description) VALUES(NEWID(), 'Product table has been modified.')
            END
GO
ALTER TABLE [dbo].[Products] ENABLE TRIGGER [TR_Products_Modify]
GO
/****** Object:  Trigger [dbo].[TR_ProductVersions_Modify]    Script Date: 15.09.2022 1:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_ProductVersions_Modify] ON [dbo].[ProductVersions] AFTER INSERT, DELETE, UPDATE
            AS BEGIN
                INSERT INTO EventLog(ID, Description) VALUES(NEWID(), 'Product Versions table has been modified.')
            END
GO
ALTER TABLE [dbo].[ProductVersions] ENABLE TRIGGER [TR_ProductVersions_Modify]
GO
