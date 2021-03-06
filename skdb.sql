USE [master]
GO
/****** Object:  Database [KOMK_Main_v2]    Script Date: 03.05.2017 18:51:15 ******/
CREATE DATABASE [KOMK_Main_v2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KOMK_Main_v2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\KOMK_Main_v2.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KOMK_Main_v2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\KOMK_Main_v2.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KOMK_Main_v2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KOMK_Main_v2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KOMK_Main_v2] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [KOMK_Main_v2] SET ANSI_NULLS ON 
GO
ALTER DATABASE [KOMK_Main_v2] SET ANSI_PADDING ON 
GO
ALTER DATABASE [KOMK_Main_v2] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [KOMK_Main_v2] SET ARITHABORT ON 
GO
ALTER DATABASE [KOMK_Main_v2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KOMK_Main_v2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [KOMK_Main_v2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KOMK_Main_v2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KOMK_Main_v2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KOMK_Main_v2] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [KOMK_Main_v2] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [KOMK_Main_v2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KOMK_Main_v2] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [KOMK_Main_v2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KOMK_Main_v2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KOMK_Main_v2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KOMK_Main_v2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KOMK_Main_v2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KOMK_Main_v2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KOMK_Main_v2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KOMK_Main_v2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KOMK_Main_v2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KOMK_Main_v2] SET RECOVERY FULL 
GO
ALTER DATABASE [KOMK_Main_v2] SET  MULTI_USER 
GO
ALTER DATABASE [KOMK_Main_v2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KOMK_Main_v2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KOMK_Main_v2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KOMK_Main_v2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [KOMK_Main_v2]
GO
/****** Object:  StoredProcedure [dbo].[inshEventType]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[inshEventType]
	@De nvarchar(50) 
AS
	insert into hEventType([Description]) values (@De)
GO
/****** Object:  StoredProcedure [dbo].[InshSkill]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InshSkill]
	@De nvarchar(50) 
AS
	insert into hSkill([Description]) values (@De)
GO
/****** Object:  StoredProcedure [dbo].[vhPerson]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[vhPerson]
AS
	SELECT hPerson.PersonId, hPerson.FIO, hAccess.[Description], COUNT(jSkillList.PersonId) as Число_навыков from hPerson join hAccess
	on hPerson.AccessId = hAccess.AccessID join jSkillList on hPerson.PersonId = jSkillList.PersonId group by hPerson.PersonId, hPerson.FIO, hAccess.[Description]
GO
/****** Object:  StoredProcedure [dbo].[vjQuery]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[vjQuery]
AS
	SELECT jQuery.QueryId, jQuery.DateIn, hState.[Description], 'Текст' AS Текст_Заявки, A.FIO AS Отправитель,  jQuery.DeadLine, jQuery.DateOut, B.FIO AS Обработал
	from jQuery	join hState on  jQuery.StateId = hState.StateId join hPerson A on jQuery.PersonId = A.PersonId join hPerson B on jQuery.PersonSpId = B.PersonId
	where jQuery.Relevance = 1
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Fio] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hEventType]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hEventType](
	[EventTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_hEventType] PRIMARY KEY CLUSTERED 
(
	[EventTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hSkill]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hSkill](
	[SkillId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_hSkill] PRIMARY KEY CLUSTERED 
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hState]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hState](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_hState] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hStateWork]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hStateWork](
	[StateWorkId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_hStateWork] PRIMARY KEY CLUSTERED 
(
	[StateWorkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hWorkType]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hWorkType](
	[WorkTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[SkillId] [int] NOT NULL,
 CONSTRAINT [PK_hWorkType] PRIMARY KEY CLUSTERED 
(
	[WorkTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[jJournal]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jJournal](
	[Date] [datetime] NOT NULL,
	[EventTypeId] [int] NOT NULL,
	[WorkListId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[JournalId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_jJournal] PRIMARY KEY CLUSTERED 
(
	[JournalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[jQuery]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jQuery](
	[QueryId] [int] IDENTITY(1,1) NOT NULL,
	[DateOut] [date] NULL,
	[DateIn] [date] NULL,
	[DateModification] [datetime] NOT NULL,
	[DeadLine] [date] NULL,
	[Text] [nvarchar](max) NULL,
	[StateId] [int] NOT NULL,
	[PersonId] [nvarchar](128) NOT NULL,
	[PersonSpId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_jQuery] PRIMARY KEY CLUSTERED 
(
	[QueryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[jSkillList]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jSkillList](
	[SkillListId] [int] IDENTITY(1,1) NOT NULL,
	[SkillId] [int] NOT NULL,
	[PersonId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_jSkillList] PRIMARY KEY CLUSTERED 
(
	[SkillListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[jWorkList]    Script Date: 03.05.2017 18:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jWorkList](
	[WorkListId] [int] IDENTITY(1,1) NOT NULL,
	[DateIn] [date] NULL,
	[DateOut] [date] NULL,
	[DateModifcation] [datetime] NOT NULL,
	[Deadline] [date] NOT NULL,
	[QueryId] [int] NOT NULL,
	[WorkTypeId] [int] NOT NULL,
	[PersonExecId] [nvarchar](128) NOT NULL,
	[StateWorkId] [int] NOT NULL,
	[Verification] [bit] NOT NULL,
 CONSTRAINT [PK_jWorkList] PRIMARY KEY CLUSTERED 
(
	[WorkListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 03.05.2017 18:51:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 03.05.2017 18:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 03.05.2017 18:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 03.05.2017 18:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 03.05.2017 18:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 03.05.2017 18:51:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[hWorkType]  WITH CHECK ADD  CONSTRAINT [FK_jSkillList_hWorkType] FOREIGN KEY([SkillId])
REFERENCES [dbo].[hSkill] ([SkillId])
GO
ALTER TABLE [dbo].[hWorkType] CHECK CONSTRAINT [FK_jSkillList_hWorkType]
GO
ALTER TABLE [dbo].[jJournal]  WITH CHECK ADD  CONSTRAINT [FK_jJournal_AspNetUsers] FOREIGN KEY([PersonId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[jJournal] CHECK CONSTRAINT [FK_jJournal_AspNetUsers]
GO
ALTER TABLE [dbo].[jJournal]  WITH CHECK ADD  CONSTRAINT [FK_jJournal_hEventType] FOREIGN KEY([EventTypeId])
REFERENCES [dbo].[hEventType] ([EventTypeId])
GO
ALTER TABLE [dbo].[jJournal] CHECK CONSTRAINT [FK_jJournal_hEventType]
GO
ALTER TABLE [dbo].[jJournal]  WITH CHECK ADD  CONSTRAINT [FK_jJournal_jWorkList] FOREIGN KEY([WorkListId])
REFERENCES [dbo].[jWorkList] ([WorkListId])
GO
ALTER TABLE [dbo].[jJournal] CHECK CONSTRAINT [FK_jJournal_jWorkList]
GO
ALTER TABLE [dbo].[jQuery]  WITH CHECK ADD  CONSTRAINT [FK_jQuery_AspNetUsers] FOREIGN KEY([PersonId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[jQuery] CHECK CONSTRAINT [FK_jQuery_AspNetUsers]
GO
ALTER TABLE [dbo].[jQuery]  WITH CHECK ADD  CONSTRAINT [FK_jQuery_AspNetUsers1] FOREIGN KEY([PersonSpId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[jQuery] CHECK CONSTRAINT [FK_jQuery_AspNetUsers1]
GO
ALTER TABLE [dbo].[jQuery]  WITH CHECK ADD  CONSTRAINT [FK_jQuery_hState] FOREIGN KEY([StateId])
REFERENCES [dbo].[hState] ([StateId])
GO
ALTER TABLE [dbo].[jQuery] CHECK CONSTRAINT [FK_jQuery_hState]
GO
ALTER TABLE [dbo].[jSkillList]  WITH CHECK ADD  CONSTRAINT [FK_jSkillList_AspNetUsers] FOREIGN KEY([PersonId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[jSkillList] CHECK CONSTRAINT [FK_jSkillList_AspNetUsers]
GO
ALTER TABLE [dbo].[jSkillList]  WITH CHECK ADD  CONSTRAINT [FK_jSkillList_hSkill] FOREIGN KEY([SkillId])
REFERENCES [dbo].[hSkill] ([SkillId])
GO
ALTER TABLE [dbo].[jSkillList] CHECK CONSTRAINT [FK_jSkillList_hSkill]
GO
ALTER TABLE [dbo].[jWorkList]  WITH CHECK ADD  CONSTRAINT [FK_jWorkList_AspNetUsers] FOREIGN KEY([PersonExecId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[jWorkList] CHECK CONSTRAINT [FK_jWorkList_AspNetUsers]
GO
ALTER TABLE [dbo].[jWorkList]  WITH CHECK ADD  CONSTRAINT [FK_jWorkList_hStateWork] FOREIGN KEY([StateWorkId])
REFERENCES [dbo].[hStateWork] ([StateWorkId])
GO
ALTER TABLE [dbo].[jWorkList] CHECK CONSTRAINT [FK_jWorkList_hStateWork]
GO
ALTER TABLE [dbo].[jWorkList]  WITH CHECK ADD  CONSTRAINT [FK_jWorkList_hWorkType] FOREIGN KEY([WorkTypeId])
REFERENCES [dbo].[hWorkType] ([WorkTypeId])
GO
ALTER TABLE [dbo].[jWorkList] CHECK CONSTRAINT [FK_jWorkList_hWorkType]
GO
ALTER TABLE [dbo].[jWorkList]  WITH CHECK ADD  CONSTRAINT [FK_jWorkList_jQuery] FOREIGN KEY([QueryId])
REFERENCES [dbo].[jQuery] ([QueryId])
GO
ALTER TABLE [dbo].[jWorkList] CHECK CONSTRAINT [FK_jWorkList_jQuery]
GO
USE [master]
GO
ALTER DATABASE [KOMK_Main_v2] SET  READ_WRITE 
GO
