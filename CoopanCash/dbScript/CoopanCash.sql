USE [master]
GO
/****** Object:  Database [CashCoopan]    Script Date: 9/15/2018 10:28:07 PM ******/
CREATE DATABASE [CashCoopan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CashCoopan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CashCoopan.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CashCoopan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CashCoopan_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CashCoopan] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CashCoopan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CashCoopan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CashCoopan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CashCoopan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CashCoopan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CashCoopan] SET ARITHABORT OFF 
GO
ALTER DATABASE [CashCoopan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CashCoopan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CashCoopan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CashCoopan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CashCoopan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CashCoopan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CashCoopan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CashCoopan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CashCoopan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CashCoopan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CashCoopan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CashCoopan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CashCoopan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CashCoopan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CashCoopan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CashCoopan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CashCoopan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CashCoopan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CashCoopan] SET  MULTI_USER 
GO
ALTER DATABASE [CashCoopan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CashCoopan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CashCoopan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CashCoopan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CashCoopan] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CashCoopan]
GO
/****** Object:  Table [dbo].[tblTicketMaster]    Script Date: 9/15/2018 10:28:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTicketMaster](
	[ticketId] [int] IDENTITY(1,1) NOT NULL,
	[ticketName] [nvarchar](50) NULL,
	[ticketType] [nvarchar](50) NULL,
	[ticketDate] [date] NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[updatedDate] [datetime] NULL,
	[updatedBy] [int] NULL,
 CONSTRAINT [PK_tblTicketMaster] PRIMARY KEY CLUSTERED 
(
	[ticketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUserTicket]    Script Date: 9/15/2018 10:28:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserTicket](
	[userTicketId] [int] IDENTITY(1,1) NOT NULL,
	[ticketId] [int] NULL,
	[userId] [int] NULL,
	[status] [int] NULL,
	[ticketDate] [datetime] NULL,
	[ticketEndDate] [datetime] NULL,
 CONSTRAINT [PK_tblUserTicket] PRIMARY KEY CLUSTERED 
(
	[userTicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Addresses]    Script Date: 9/15/2018 10:28:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Addresses](
	[UserAddressID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Address1] [varchar](100) NOT NULL,
	[Address2] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[PinCode] [varchar](8) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDT] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_User_Addresses] PRIMARY KEY CLUSTERED 
(
	[UserAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/15/2018 10:28:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[MName] [nvarchar](50) NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL CONSTRAINT [DF_Users_Email]  DEFAULT (''),
	[DOB] [smalldatetime] NOT NULL,
	[CreatedDT] [smalldatetime] NOT NULL CONSTRAINT [DF_Users_CreatedDT]  DEFAULT (getdate()),
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblTicketMaster] ON 

GO
INSERT [dbo].[tblTicketMaster] ([ticketId], [ticketName], [ticketType], [ticketDate], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (1, N'ticket1', N'amaxone', CAST(N'2018-09-15' AS Date), CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1, CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1)
GO
INSERT [dbo].[tblTicketMaster] ([ticketId], [ticketName], [ticketType], [ticketDate], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (2, N'ticket2', N'amaxone', CAST(N'2018-09-15' AS Date), CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1, CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1)
GO
INSERT [dbo].[tblTicketMaster] ([ticketId], [ticketName], [ticketType], [ticketDate], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (3, N'ticket3', N'amaxone', CAST(N'2018-09-15' AS Date), CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1, CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1)
GO
INSERT [dbo].[tblTicketMaster] ([ticketId], [ticketName], [ticketType], [ticketDate], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (4, N'ticket4', N'amaxone', CAST(N'2018-09-15' AS Date), CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1, CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1)
GO
INSERT [dbo].[tblTicketMaster] ([ticketId], [ticketName], [ticketType], [ticketDate], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (5, N'ticket5', N'amaxone', CAST(N'2018-09-15' AS Date), CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1, CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1)
GO
INSERT [dbo].[tblTicketMaster] ([ticketId], [ticketName], [ticketType], [ticketDate], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (6, N'ticket6', N'amaxone', CAST(N'2018-09-15' AS Date), CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1, CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1)
GO
INSERT [dbo].[tblTicketMaster] ([ticketId], [ticketName], [ticketType], [ticketDate], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (7, N'ticket7', N'amaxone', CAST(N'2018-09-15' AS Date), CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1, CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1)
GO
INSERT [dbo].[tblTicketMaster] ([ticketId], [ticketName], [ticketType], [ticketDate], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (8, N'ticket8', N'amaxone', CAST(N'2018-09-15' AS Date), CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1, CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1)
GO
INSERT [dbo].[tblTicketMaster] ([ticketId], [ticketName], [ticketType], [ticketDate], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (9, N'ticket9', N'amaxone', CAST(N'2018-09-15' AS Date), CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1, CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1)
GO
INSERT [dbo].[tblTicketMaster] ([ticketId], [ticketName], [ticketType], [ticketDate], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (10, N'ticket10', N'amaxone', CAST(N'2018-09-15' AS Date), CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1, CAST(N'2018-09-15 21:20:34.270' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[tblTicketMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUserTicket] ON 

GO
INSERT [dbo].[tblUserTicket] ([userTicketId], [ticketId], [userId], [status], [ticketDate], [ticketEndDate]) VALUES (1, 1, 1, 3, CAST(N'2018-09-01 21:20:34.270' AS DateTime), NULL)
GO
INSERT [dbo].[tblUserTicket] ([userTicketId], [ticketId], [userId], [status], [ticketDate], [ticketEndDate]) VALUES (2, 2, 1, 3, CAST(N'2018-09-04 21:20:34.270' AS DateTime), NULL)
GO
INSERT [dbo].[tblUserTicket] ([userTicketId], [ticketId], [userId], [status], [ticketDate], [ticketEndDate]) VALUES (3, 3, 1, 3, CAST(N'2018-09-05 21:20:34.270' AS DateTime), NULL)
GO
INSERT [dbo].[tblUserTicket] ([userTicketId], [ticketId], [userId], [status], [ticketDate], [ticketEndDate]) VALUES (4, 4, 1, 3, CAST(N'2018-09-06 21:20:34.270' AS DateTime), NULL)
GO
INSERT [dbo].[tblUserTicket] ([userTicketId], [ticketId], [userId], [status], [ticketDate], [ticketEndDate]) VALUES (5, 5, 1, 3, CAST(N'2018-09-11 21:20:34.270' AS DateTime), NULL)
GO
INSERT [dbo].[tblUserTicket] ([userTicketId], [ticketId], [userId], [status], [ticketDate], [ticketEndDate]) VALUES (6, 6, 1, 3, CAST(N'2018-09-12 21:20:34.270' AS DateTime), NULL)
GO
INSERT [dbo].[tblUserTicket] ([userTicketId], [ticketId], [userId], [status], [ticketDate], [ticketEndDate]) VALUES (7, 7, 1, 3, CAST(N'2018-09-13 21:20:34.270' AS DateTime), NULL)
GO
INSERT [dbo].[tblUserTicket] ([userTicketId], [ticketId], [userId], [status], [ticketDate], [ticketEndDate]) VALUES (8, 8, 1, 3, CAST(N'2018-09-15 21:20:34.270' AS DateTime), NULL)
GO
INSERT [dbo].[tblUserTicket] ([userTicketId], [ticketId], [userId], [status], [ticketDate], [ticketEndDate]) VALUES (9, 9, 1, 3, CAST(N'2018-09-15 21:20:34.270' AS DateTime), NULL)
GO
INSERT [dbo].[tblUserTicket] ([userTicketId], [ticketId], [userId], [status], [ticketDate], [ticketEndDate]) VALUES (10, 10, 1, 3, CAST(N'2018-09-15 21:20:34.270' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[tblUserTicket] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [FName], [MName], [LName], [Email], [DOB], [CreatedDT], [IsDeleted]) VALUES (1, N'admin', N'admin', N'jigar', N'k', N'khalas', N'jigs.prince78@gmail.com', CAST(N'1990-09-28 00:00:00' AS SmallDateTime), CAST(N'2018-09-15 21:21:00' AS SmallDateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[User_Addresses] ADD  CONSTRAINT [DF_User_Addresses_Address1]  DEFAULT ('') FOR [Address1]
GO
ALTER TABLE [dbo].[User_Addresses] ADD  CONSTRAINT [DF_User_Addresses_Address2]  DEFAULT ('') FOR [Address2]
GO
ALTER TABLE [dbo].[User_Addresses] ADD  CONSTRAINT [DF_User_Addresses_City]  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[User_Addresses] ADD  CONSTRAINT [DF_User_Addresses_State]  DEFAULT ('') FOR [State]
GO
ALTER TABLE [dbo].[User_Addresses] ADD  CONSTRAINT [DF_User_Addresses_Country]  DEFAULT ('') FOR [Country]
GO
ALTER TABLE [dbo].[User_Addresses] ADD  CONSTRAINT [DF_User_Addresses_PinCode]  DEFAULT ('') FOR [PinCode]
GO
ALTER TABLE [dbo].[User_Addresses] ADD  CONSTRAINT [DF_User_Addresses_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[User_Addresses] ADD  CONSTRAINT [DF_User_Addresses_CreatedDT]  DEFAULT (getdate()) FOR [CreatedDT]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'MName'
GO
USE [master]
GO
ALTER DATABASE [CashCoopan] SET  READ_WRITE 
GO
