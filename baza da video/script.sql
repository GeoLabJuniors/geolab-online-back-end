/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [GeoLabOnlinedb]    Script Date: 04/01/2019 19:30:00 ******/
CREATE DATABASE [GeoLabOnlinedb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GeoLabOnlinedb', FILENAME = N'C:\Users\fidoo\GeoLabOnlinedb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GeoLabOnlinedb_log', FILENAME = N'C:\Users\fidoo\GeoLabOnlinedb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GeoLabOnlinedb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GeoLabOnlinedb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GeoLabOnlinedb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET ARITHABORT OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GeoLabOnlinedb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GeoLabOnlinedb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GeoLabOnlinedb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GeoLabOnlinedb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GeoLabOnlinedb] SET  MULTI_USER 
GO
ALTER DATABASE [GeoLabOnlinedb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GeoLabOnlinedb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GeoLabOnlinedb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GeoLabOnlinedb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GeoLabOnlinedb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GeoLabOnlinedb] SET QUERY_STORE = OFF
GO
USE [GeoLabOnlinedb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [GeoLabOnlinedb]
GO
/****** Object:  Schema [HangFire]    Script Date: 04/01/2019 19:30:00 ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[ID] [int] NOT NULL,
	[CourseTitle] [nvarchar](150) NOT NULL,
	[CourseDesc] [nvarchar](max) NULL,
	[CourseVideoLink] [varchar](150) NULL,
	[DirectionId] [int] NOT NULL,
 CONSTRAINT [PK_Program] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseSubject]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseSubject](
	[courseSubjectID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectID] [int] NULL,
	[CourseID] [int] NULL,
 CONSTRAINT [PK_CourseSubject] PRIMARY KEY CLUSTERED 
(
	[courseSubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direction]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DirectionTitle] [nvarchar](50) NULL,
	[DirectionDesc] [nvarchar](max) NULL,
	[DirectionImage] [varchar](150) NULL,
	[DirectionImageExt] [varchar](10) NULL,
	[DirectionDescMini] [nvarchar](max) NULL,
 CONSTRAINT [PK_Direction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecture]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecture](
	[ID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserBio] [ntext] NULL,
	[UserMail] [varchar](150) NULL,
	[UserPhoto] [varchar](150) NULL,
	[UserSubject] [int] NULL,
	[UserSubjectName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Lecture] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonQuiz]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonQuiz](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LessonId] [int] NOT NULL,
	[Question] [nvarchar](400) NOT NULL,
	[CreateDate] [date] NULL,
 CONSTRAINT [PK_LessonQuiz] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonQuizAnswers]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonQuizAnswers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
	[Correct] [nvarchar](1) NOT NULL,
	[QuizId] [int] NULL,
 CONSTRAINT [PK_LessonQuizAnswers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LessonsTitel] [nvarchar](50) NOT NULL,
	[LessonsDesc] [nvarchar](max) NULL,
	[LessonsVideoLink] [varchar](150) NULL,
	[SubjectId] [int] NOT NULL,
	[CreateDate] [date] NULL,
	[CodeType] [int] NULL,
	[LessonsLvl] [int] NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonsCodeType]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonsCodeType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SourceType] [nvarchar](50) NULL,
	[source] [nvarchar](max) NULL,
 CONSTRAINT [PK_LessonsCodeType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[ID] [int] NOT NULL,
	[SubjectTitle] [nvarchar](150) NULL,
	[SubjectDesc] [nvarchar](max) NULL,
	[SubjectVideoLink] [varchar](150) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject_Lecture]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject_Lecture](
	[Subject_LecturerID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[LecturerID] [int] NOT NULL,
 CONSTRAINT [PK_Subject_Lecture] PRIMARY KEY CLUSTERED 
(
	[Subject_LecturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCodes]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCodes](
	[UserId] [int] NULL,
	[Code] [nvarchar](max) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LessonId] [int] NULL,
 CONSTRAINT [PK_UserCodes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCurse]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCurse](
	[UserId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_UserCurse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLessons]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLessons](
	[UserId] [int] NOT NULL,
	[LessonsId] [int] NOT NULL,
	[LessonsStatus] [varchar](1) NOT NULL,
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_UserLessons] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserNotes]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LessonsId] [int] NOT NULL,
	[NoteText] [nvarchar](max) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_UserNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserQuiz]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserQuiz](
	[UserId] [int] NOT NULL,
	[QuizId] [int] NOT NULL,
	[AnswerID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_UserQuiz] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](150) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [varchar](100) NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[CreateDate] [date] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 04/01/2019 19:30:00 ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](100) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 04/01/2019 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (3, N'პოლიგრაფიული დიზაინი', N'<p>დღეს ადამიანებს დიდი მოცულობის ინფორმაციასთან გვაქვს შეხება, შესაბამისად, არ გვრჩება დრო რომელიმე ერთ ინფორმაციის წყაროზე კონცენტრაციისთვის. სწორედ ამიტომ, მნიშვნელოვანია ჩვენი სამიზნე აუდიტორიისათვის ინფორმაციის მიწოდების სწრაფი და გამორჩეული ხერხი მოვძებნოთ.
</p>
<p>
კომპლექსური იდეა შეიძლება, მხოლოდ ერთი გრაფიკული გამოსახულებით გამოიხატოს, რაც პირდაპირ ეხმაურება გრაფიკული დიზაინის დანიშნულებას და ვიზუალურ კომუნიკაციას, რომელიც, ძირითადად, ტექსტისა და სურათის ოსტატური და ჰარმონიული კომბინირებით ხორციელდება. სწორედ ამიტომ მიიჩნევენ გრაფიკული დიზაინის პროდუქტებს ინფორმაციის გადმოცემის ერთ-ერთ ყველაზე სწრაფ და ეფექტურ საშუალებად.

</p>
<p>
კურსი პრაქტიკული ხასიათისაა, რომლის განმავლობაში მსმენელები Adobe Photoshop-სა და Adobe Illustrator-ს ეუფლებიან. პროგრამის ფარგლებში სტუდენტები თავად ქმნიან ისეთ პოლიგრაფიულ პროდუქტებს, როგორებიცაა: პლაკატი, ბანერი, ბუკლეტი და სხვა.

</p>', NULL, 1)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (4, N'ინტერფეისის დიზაინი', N'<p>
ინტერფეისის დიზაინი ვიზუალური ნიშნების ენაა, რომელიც თითქოს შეუმჩნეველ, სრულიად ბუნებრივ ადგილს იმკვიდრებს. ამ კურსის ფარგლებში სტუდენტები თავად ქმნიან ელექტრონული მოწყობილობების, ვებგვერდებისა და მობილური აპლიკაციების დიზაინსა და აიქონებს, რომლებიც ნებისმიერი ადამიანისათვის მარტივად აღსაქმელი იქნება.
</p>
<p>
კურსი პრაქტიკული ხასიათისაა და მის ფარგლებში სრუდენტები Adobe Illustrator-ს დაეუფლებიან. სასწავლო გეგმა რამდენიმე საგნისგან შედგება და ოთხი თვე გრძელდება. სტუდენტები ბოლო ერთი თვის განმავლობაში, ლექტორების დახმარებით, საკუთარ პროექტებზე იმუშავებენ.

</p>', NULL, 1)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (5, N'3D დიზაინი', N'<p>
3D მოდელების შექმნა შემოქმედებითი პროცესია, რომლის განმავლობაში ადამიანის წარმოსახვაში არსებული სურათი რეალურ კონტურებს იძენს, მატერიალიზდება. ამ პროცესის სწორად წარმართვისათვის საჭიროა როგორც საკუთარი შემოქმედებითი პოტენციალის მართვა, ასევე, კონკრეტული პროგრამების ძალიან კონკრეტული ფუნქციების ზედმიწევნით კარგი ცოდნა.

</p>
<p>
კურსის განმავლობაში სტუდენტები მონაწილეობას მიიღებენ პროექტის ჩამოყალიბებაში და შემდეგ მის განხორციელებაში. პროექტი შეიქმნება პრაქტიკულ მაგალითზე და შეიძლება მოითხოვოს სხვა სფეროს სტუდენტებთან კოლაბორაცია. (მაგალითად, კომპიუტერული თამაშის შექმნა Unity3D-ს და სხვა ინტერაქტიული პროგრამირების სტუდენტებთან ერთად).

</p>
<p>
კურსის ფარგლებში სტუდენტები, Cinema4D-ს საშუალებით, თამაშების პერსონაჟების და მოკლე ანიმაციური ვიდეო რგოლებისათვის გარემოს შექმნაზე იმუშავებენ. სტუდენტები საკუთარ ნამუშევრებს VR (ვირტუალური რეალობის) მოწყობილობებისათვის დაარენდერებენ. კურსი რამდენიმე საგნისგან შედგება და ოთხი თვე გრძელდება.

</p>
<p>
კურსის ფარგლებში სტუდენტები ბოლო ერთი თვის განმავლობაში, ლექტორების დახმარებით, საკუთარ პროექტებზე მუშაობენ.

</p>', NULL, 1)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (6, N'ვებ პროგრამირება Front-End (HTML)', N'<p>
არსებობს წარმოდგენა, რომ ვებგვერდის აწყობა მხოლოდ ტექნიკური განათლების მქონე ადამიანს შეუძლია ისწავლოს. თუმცა, რაც დრო გადის, საპირისპირო სურათს ვხედავთ. სულ უფრო მეტი, სხვადასხვა პროფესიის ადამიანი სწავლობს პროგრამირებას, სხვადასხვა სირთულის აპლიკაციებს ქმნის და თავად აწყობს ვებგვერდებს. ტექნოლოგიების განვითარებამ შესაძლებელი გახადა, რომ სხვადასხვა პროფესიის ადამიანებმა თავად შეძლონ საკუთარი იდეების რეალიზება. თუკი ადრე ინოვაციური იდეის რეალიზებისათვის საჭირო იყო ფინანსები, დღეს ადამიანს შეუძლია, თავად დაეუფლოს იდეის რეალიზებისათვის საჭირო ტექნიკურ ცოდნას, მაგალითად, შეისწავლოს ვებგვერდის აწყობა და შექმნას საკუთარი კომპანიის ვებგვერდი, ააწყოს ონლაინ მაღაზია ან რაიმე სხვა ვირტუალური ონლაინ სერვისი. 
</p>
<p>
ამ კურსის ფარგლებში მსმენელები იმ ცოდნას ეუფლებიან, რომელიც მათ საშუალებას აძლევს, გაერკვნენ ვებგვერდის ფუნქციონირების პრინციპებში, ააწყონ სტატიკური ვებგვერდი ან, საჭიროების შემთხვევაში, ცვლილებები შეიტანონ არსებული ვებგვერდის პროგრამულ კოდში, დაგეგმონ და მენეჯმენტი გაუწიონ ვებგვერდის შექმნასთან დაკავშირებულ სამუშაოებს. კურსი პრაქტიკული ხასიათისაა, რომლის ფარგლებში მსმენელები მარტივ ვებგვერდებს ქმნიან HTML პროგრამულ ენაზე CSS-ის გამოყენებით.
</p>
<p>
კურსი არ მოითხოვს პროგრამირების საბაზისო ცოდნას და ნებისმიერი დაინტერესებული პირისათვის ხელმისაწვდომია.
</p>', NULL, 2)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (7, N'ვებ პროგრამირება PHP', N'
<p>
PHP ვებპროგრამირების ერთ-ერთი ყველაზე პოპულარული ენაა. დღეს ინტერნეტში განთავსებული ვებგვერდების დიდი ნაწილი სწორედ ამ ენაზეა შექმნილი - მათ შორის, მსოფლიოში ყველაზე პოპულარული სოციალური ქსელი Facebook. PHP-ს დინამიური ვებგვერდების შესაქმნელად იყენებენ.  
</p>
<p>
ინტერნეტში უამრავი ღია რესურსია განთავსებული, რომელშიც დეტალურად არის განხილული PHP-ს ესა თუ ის ბრძანება, ან PHP კოდის საშუალებით შექმნილი ფუნქცია. შესაძლებელია ასევე PHP კოდის „სნიპეტების“ - კოდის ერთგვარი ნაგლეჯების მოძიება. PHP პროგრამისტები ხშირად იყენებენ გამზადებული კოდის ნაგლეჯებს, რომელთა საკუთარი საჭიროებისათვის მორგება, გადაკეთებაა შესაძლებელი. მიუხედავად სნიპეტების, ბიბლიოთეკების, ფრეიმვორკების (ყველა ეს სიტყვა გამზადებული კოდის პატარა, ან ძალიან დიდ ნაწილებს გულისხმობს) არსებობისა, PHP პროგრამისტს თავად უწევს კოდის დიდი ნაწილის დაწერა. ეს მას საშუალებას აძლევს, ზედმიწევნით ზუსტად, ოპტიმალურად გამოიყენოს PHP პროგრამული ენის შესაძლებლობები. 
</p>

<p>
კურსის განმავლობაში, სტუდენტები ლექტორების მიერ მოწოდებულ სასწავლო მასალაზე დაყრდნობით, თავად ქმნიან ვებგვერდებს. სწავლობენ, როგორც უშუალოდ PHP პროგრამულ ენაზე წერას, ასევე არსებული სნიპეტების, ფუნქციების, ბიბლიოთეკების, ფრეიმვორკების გამოყენებას და საკუთარ საჭიროებებზე მორგებას, გადაკეთებას. კურსი რამდენიმე საგნისაგან შედგება და ოთხი თვე გრძელდება. კურსის ფარგლებში სტუდენტები ბოლო ერთი თვის განმავლობაში, ლექტორების დახმარებით საკუთარ პროექტებზე მუშაობენ.
</p>', NULL, 2)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (8, N'ვებ პროგრამირება ASP.NET MVC', N'<p>
.NET კომპანია Microsoft-ის ოფიციალური პროდუქტია, ამიტომ მას აქვს სრულყოფილი, ოფიციალური დოკუმენტაცია, რომელიც მუდმივად განახლების პროცესშია. ჰყავს ასევე ძლიერი Community. ინტერნეტში არის ბევრი ღია რესურსი ამ ინსტრუმენტის შესახებ.  .NET-ზე მუშაობისას, თქვენ შეხება გექნებათ ერთ-ერთ ყველაზე კარგ სამუშაო გარემოსთან Visual Studio-სთან. ეს არის ძვირადღირებული პროგრამა, რომელიც სტუდენტებისათვის უფასოა. სწავლის დროს უფასოდ ისარგებლებთ Microsoft-ის სერვერული პაკეტით DreamSpark for Students.
</p>
<p>
კურსის განმავლობაში, სტუდენტები ლექტორების მიერ მოწოდებული სასწავლო მასალის მიხედვით, თავად ქმნიან ვებგვერდებს. სწავლობენ, როგორც უშუალოდ C# პროგრამულ ენაზე წერას, ასევე არსებული სნიპეტების, ფუნქციების, ბიბლიოთეკების, ფრეიმვორკების გამოყენებას და საკუთარ საჭიროებებზე მორგებას, გადაკეთებას. კურსი რამდენიმე საგნისგან შედგება და ოთხი თვე გრძელდება. კურსის ფარგლებში სტუდენტები ბოლო ერთი თვე, ლექტორების დახმარებით საკუთარ პროექტებზე მუშაობენ.
</p>
<p>
ASP.NET MVC არის ვებ აპლიკაციის ერთ-ერთი ფრეიმვორკი. მისი გამოყენებით ვებ აპლიკაციები იგება MVC (Model View Controller) მოდელის გამოყენებით: Model  (business layer) წარმოადგენს აპლიკაციის ბირთვს (მაგალითად, მონაცემთა ბაზა), View (display layer) არის აპლიკაციის ინტერფეისი, ხოლო Controller (input control)-ში იგულისხმება კავშირი Model-სა და View-ს შორის.
</p>', NULL, 2)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (9, N'მობილური პროგრამირება iOS', N'<p>
კომპანია Apple არაერთხელ დასახელდა მსოფლიოში ნომერ პირველ ბრენდად. Apple-ის პროდუქტები, ისევე როგორც ამ პროდუქტებისათვის შექმნილი პროგრამები და მობილური აპლიკაციები, განსაკუთრებული ხარისხითა და დახვეწილი დიზაინით გამოირჩევა. თუ გსურთ გახდეთ ამ ბრენდის ნაწილი, შექმნათ სხვადასხვა პროგრამული პროდუქტი iPhone-ისა და iPad-ისათვის, მაშინ swift-ის შესწავლას უნდა შეუდგეთ. ეს პროგრამირების ენა, პირველად 2014 წლის იანვარში წარმოადგინა კომპანია Apple-მა. მიუხედავად იმისა, რომ Swift შედარებით ახალი ენაა, მასზე უკვე შესაძლებელია სრულფასოვანი მობილური აპლიკაციებისა და პროგრამების შექმნა. ვინაიდან Apple დიდ იმედებს ამყარებს ამ პროგრამულ ენაზე, ის ძალიან პერსპექტიულია. სავარაუდოდ, გარკვეული პერიოდის შემდეგ, Apple უარს განაცხადებს იმ პროგრამულ ენებზე, რომლებითაც აქამდე იყო შესაძლებელი „ნეითივ“ აპლიკაციების შექმნა Apple-ის პროდუქტებისათვის და ძირითად აქცენტს ამ თანამედროვე სტანდარტებით შექმნილ პროგრამულ ენაზე გააკეთებს. შესაბამისად, თუკი თქვენ  iPhone-ისა და iPad-ისათვის გნებავთ აპლიკაციების და პროგრამების შექმნა, უმჯობესია, ის პროგრამული ენა შეისწავლოთ, რომელიც დღეს უკვე აქტიურად გამოიყენება და ამავე დროს მომავალზე არის ორიენტირებული.
</p>
<p>
კურსის ფარგლებში სტუდენტები Swift -ის პროგრამულ ენაზე კოდის შექმნას და Xcode-ის პროგრამულ გარემოში მუშაობას  სწავლობენ. ლექტორის მიერ მომზადებული სასწავლო მასალის მიხედვით, iPhone-ისა და iPad-ისათვის მობილურ აპლიკაციებს თავად ქმნიან. ჯეოლაბის სტუდენტები უზრუნველყოფილნი არიან Mac-ის კომპიუტერებით. ამასთან მათ საშუალება აქვთ საკუთარი iOS აპლიკაციები ჯეოლაბში არსებული iPhone-ისა და iPad-ის დახმარებით დატესტონ. კურსი რამდენიმე საგნისგან შედგება და ოთხი თვე გრძელდება. კურსის ფარგლებში სტუდენტები ბოლო ერთი თვე, ლექტორების დახმარებით საკუთარ პროექტებზე მუშაობენ.
</p>
', NULL, 3)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (11, N'მობილური პროგრამირება ANDROID (Java)', N'<p>
პროგრამირების ენა JAVA, Android აპლიკაციების შექმნისას, გარკვეული თვალსაზრისით შეუცვლელია, ვინაიდან JAVA „native“, ბუნებრივ ენად ითვლება Android ოპერაციულ სისტემაზე მომუშავე მოწყობილობებისათვის. შესაბამისად, ამ პროგრამულ ენაზე Android აპლიკაციის შექმნისას, შესაძლებელია ყველა იმ შესაძლებლობის სრულად გამოყენება, რომელსაც Android ოპერაციული სისტემა გვაძლევს. ვინაიდან ამ ოპერაციულ სისტემაზე დღეს Google ზრუნავს და მისი უშუალო პატრონაჟით ვითარდება, ძალიან მარტივად ხდება JAVA-ზე დაწერილი აპლიკაციის Google-ს სხვადასხვა სერვისთან მიერთება, როგორიცაა, მაგალითად Google Maps. შესაბამისად, თუ თქვენს აპლიკაციაში რუკის გამოყენებას გადაწყვეტთ, შეგეძლებათ არა მარტო Google-ის მზა რუკების გამოყენება, არამედ უამრავი სხვადასხვა სერვისის, რომელიც Google-ის ამ პროდუქტთან არის დაკავშირებული.  
</p>
<p>
JAVA-ზე სამუშაოდ Google-მა სპეციალური პროგრამაც გამოუშვა, რომელსაც Android Studio ჰქვია. Android Studio-ში არა მარტო მობილური მოწყობილობებისათვის არის შესაძლებელი სხვადასხვა აპლიკაციის შექმნა, არამედ ისეთი ინოვაციური პროდუქტებისათვის, როგორიცაა Pepper და Android სისტემაზე მომუშავე Smartwatch. 
</p>
<p>
კურსის ფარგლებში სტუდენტები სწავლობენ JAVA-ზე პროგრამული კოდის შექმნას და Android Studio-ს პროგრამულ გარემოში მუშაობას. სტუდენტებს საშუალება აქვთ, მეცადინეობისას გამოიყენონ არა მარტო სმარტფონები, არამედ Pepper და Smartwatch,  ანუ, შექმნან პროგრამული კოდი ამ ინოვაციური მოწყობილობებისათვის და თავად დატესტონ, როგორ მუშაობს მათი შექმნილი აპლიკაციები ამ მოწყობილობებზე. კურსი რამდენიმე საგნისაგან შედგება და ოთხი თვე გრძელდება. კურსის ფარგლებში სტუდენტები ბოლო ერთი თვის განმავლობაში, ლექტორების დახმარებით, საკუთარ პროექტებზე მუშაობენ.
</p>', NULL, 3)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (12, N'პროგრამირება Unity 3D', N'<p>
Unity კროსპლატფორმული პროგრამაა, რომელიც, ძირითადად, კომპიუტერული თამაშების შესაქმნელად გამოიყენება. Unity 2005 წელს შეიქმნა, როგორც Apple-ის კომპიუტერებისათვის (OS X) კომპიუტერული თამაშების შესაქმნელი სისტემა. შემდეგ, დროთა განმავლობაში, ის კროსპლატფორმულ სისტემად ტრანსფორმირდა. კროსპლატფორმულობა საშუალებას იძლევა, პროგრამისტის მიერ შექმნილმა კომპიუტერულმა თამაშმა სხვადასხვა პლატფორმაზე იმუშაოს. ადრე თამაშების შემქმნელები კონკრეტულად რომელიმე პლატფორმისთვის, ოპერაციული სისტემისათვის ქმნიდნენ თამაშს. შესაბამისად, მაგალითად, Windows პლატფორმისთვის შექმნილი თამაში არ მუშაობდა, ვერ ეშვებოდა Apple-ის კომპიუტერებზე. Unity-ს საშუალებით შექმნილი თამაშები, შეიძლება 20-ზე მეტ პლათფორმაზე გაეშვას. მათ შორის, Windows, Android, Mac OS, iOS, Xbox, Wii და ა. შ. ასევე სხვადასხვა ვებ ბრაუზერში. Unity 3D სხვადასხვა სახის 2D და 3D გამოსახულების იმპორტირების საშუალებას იძლევა (Autodesk 3ds Max, Maya, Softimage, Blender, Modo, ZBrush, Cinema 4D, Cheetah 3D, Adobe Photoshop, Adobe Fireworks). შესაბამისად, Unity-ში შესაძლებელია 2D და 3D თამაშების შექმნა. Unity 3D-ში ინტეგრირებული თაიმლაინი თამაშის შემქმნელებს მნიშვნელოვნად უადვილებს საქმეს. 
</p>
<p>
კურსის ფარგლებში სტუდენტები იმ ძირითად პრინციპებს სწავლობენ, რომელზე დაყრდნობითაც კომპიუტერული თამაშები იქმნება. ლექტორის მომზადებული სასწავლო მასალის მიხედვით, სტუდენტები თავად ქმნიან Unity-ში კროსპლატფორმულ თამაშებს. კურსი რამდენიმე საგნისგან შედგება და ოთხი თვე გრძელდება. კურსის ფარგლებში სტუდენტები ბოლო ერთი თვის განმავლობაში, ლექტორების დახმარებით, საკუთარ პროექტებზე მუშაობენ.
</p>', NULL, 4)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (13, N'პროგრამირება C#', N'<p>
2012 წლის დასაწყისში, ნიუ იორკის მერმა მაიკლ ბლუმბერგმა (Michael Rubens Bloomberg) განაცხადა, რომ მან მიიღო გადაწყვეტილება, მომავალი წლის განმავლობაში, მისი უშუალო მოვალეობების პარალელურად, პროგრამული ენების შესწავლასაც დაუთმოს დრო. ბლუმბერგის ნაბიჯი კიდევ ერთხელ ცხადყოფს, რომ პროგრამულ კოდთან მუშაობა ნებისმიერი პროფესიის ადამიანისათვის აუცილებელია. 
</p>
<p>
2014 წელს ამერიკის პრეზიდენტი, ბარაკ ობამა „პროგრამირების საათს“ (Hour of Code) დაესწრო და თავადაც დაწერა პროგრამული კოდი. „პროგრამირების საათი“ ფართომასშტაბიანი კამპანიაა, რომლის ფარგლებშიც მთელ მსოფლიოში, სხვადასხვა სასწავლებლის მოსწავლეები, ერთი საათის განმავლობაში, ეცნობიან პროგრამულ კოდთან მუშაობის საწყისებს, რათა თავად სცადონ და დაინტერესდნენ. როგორც ჟურნალისტებმა აღნიშნეს, ბარაკ ობამა პირველია ამერიკის პრეზიდენტებს შორის, ვინც პროგრამული კოდი დაწერა.    
</p>
<p>
კურსის მიზანია, მსურველებს პროგრამირების საწყისები გააცნოს. ის პრაქტიკული ხასიათისაა, რომლის განმავლობაში მსმენელები მარტივ პროგრამებს აწყობენ, დღეს მსოფლიოში ერთ-ერთ პოპულარულ ენაზე, C#-ზე. კურსის განმავლობაში სტუდენტები ეცნობიან ობიექტზე ორიენტირებულ და პროგრამების მთავარ პრინციპებს. 
</p>
<p>
კურსი არ მოითხოვს პროგრამირების საბაზისო ცოდნას და ნებისმიერი მსურველისათვის არის განკუთვნილი. 
</p>', NULL, 5)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (14, N'სოციალური მედია მენეჯმენტი', N'<p>
სოციალური მედია მენეჯერი დღეს ერთ-ერთი ყველაზე მოთხოვნადი პროფესიაა. ინტერნეტ მომხმარებლების რიცხვის ზრდასთან ერთად, კომპანიები სულ უფრო დიდ ყურადღებას აქცევენ მომხმარებლებთან ონლაინ კომუნიკაციას.
</p>
<p>
უამრავი დამხმარე კომპიუტერული პროგრამისა თუ ონლაინ სერვისის საშუალებით, დღეს საკუთარი ძალებითაც არის შესაძლებელი იმის გაკეთება, რისთვისაც ბევრ კომპანიას სპეციალისტის დახმარება სჭირდება.
</p>
<p>
კურსის მიზანია, სტუდენტებს გააცნოს ახალი მედიის შესაძლებლობები, დაეხმაროს სოციალური მედიის ეფექტურად გამოყენებაში, გააცნოს Facebook-ისა და სხვა სოციალური მედიის არხების დამატებითი შესაძლებლობები, რათა მომავალში მსმენელებმა შეძლონ ამ სოციალური არხების თავიანთ საჭიროებებზე მორგება. კურსი პრაქტიკული ხასიათისაა და კურსის განმავლობაში მსმენელებს მოუწევთ თავად შექმნან და გამართონ სოციალური მედიის არხები.
</p>', NULL, 6)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (15, N'შრიფტის დიზაინის საფუძვლები და ფონტ-ინჟინერია', N'<p>
იმისათვის, რომ შეიქმნას კომპიუტერული შრიფტი, რასაც ფონტს ვეძახით, საჭიროა ხანგრძლივი და შრომატევადი პროცესი. ყველაფერი იწყება შრიფტის დიზაინით, რომელიც, მოგვიანებით, გრაფიკულ პროგრამებში იხაზება, კონტურები იხვეწება და მზადდება ინჟინერიისთვის. ხშირად თავად დიზაინშიც არის საჭირო იმ დეტალების გათვალისწინება, რის გარეშეც შემდგომში სრულყოფილი ფონტ-ფაილი ვერ შეიქმნება. აღნიშნულ პროცესში, გარდა დიზაინერისა და ფონტ-ინჟინერისა, მრავალი ადამიანი იღებს მონაწილეობას, მაგალითად, მტესტავი, ჰინტირების სპეციალისტი და ა.შ.
</p>
<p>
აღნიშნული კურსის მიზანია ძირითადი ფოკუსის ფონტ-ინჟინერზე შეჩერება, რომელიც ამ პროცესში ერთ-ერთ უმთავრეს როლს თამშობს. კურსის განმავლობაში მოხდება შრიფტის დიზაინისა და სხვა მნიშვნელოვანი დეტალების გათვალისწინებაც, რის გარეშეც სრულყოფილი ფონტ-ფაილი ვერ მიიღება.

</p>
<p>
ფონტ-ინჟინერი პასუხისმგებელია შექმნილი დიზაინის ფონტ-ფაილად გარდაქმნაზე, რაც ხშირ შემთხვევაში დიდ დაკვირვებას, პროგრამული კოდებისა და ხელსაწყოების ცოდნას მოითხოვს.

</p>
<p>
სამწუხაროდ, საქართველოში ფონტ-ინჟინერიის პროფესია არ არსებობს და ის ფონტები, რომლებიც გავრცელებულია, ტექნიკურ სტანდარტებს ვერ აკმაყოფილებენ.

</p>
<p>
კურსის მიზანია, სტუდენტებს გადასცეს სიღრმისეული ცოდნა ფონტ-ინჟინერიის შესახებ. ეს მათ მომავალში დაეხმარება, გარკვეული დიზაინის საფუძველზე შექმნან ისეთი პროდუქტი - ფონტი, რომელიც გამართულად იმუშავებს ყველა გრაფიკულ პროგრამაში, გათვალისწინებული იქნება სხვადასხვა ფუნქცია, როგორებიცაა ლიგატურები, ალტერნატივები. გათვლილი იქნება როგორც პრინტ, ასევე, ეკრანული გამოსახულებისათვის.
</p>', NULL, 1)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (16, N'ვიდეო გრაფიკა და მონტაჟი', N'<p>
ადამიანი თავისი ისტორიის მანძილზე მუდამ ცდილობდა გამოსახულების საშუალებით აღეწერა და გადმოეცა ის, რაც მისთვის მნიშვნელოვანი იყო. ამის ნათელი მაგალითია ვიზუალური ხელოვნების მთელი ისტორია. დღემდე შემორჩა უამრავი ნახატი და ქანდაკება, რომელზეც ისტორიული ბრძოლები, მნიშვნელოვანი ცერემონიები და რელიგიური ხასიათის სიუჟეტებია გამოსახული. მართალია, ისტორიის მანძილზე ადამიანს ჰქონდა მცდელობა, რომ მოძრავი გამოსახულებაც შეექმნა, მაგრამ დღევანდელ დღემდე ამის ტექნიკური შესაძლებლობა არ არსებობდა. დღემდე, მოძრაობის გადმოცემის სურვილის მიუხედავად, ვიზუალური გზავნილი სტატიკური იყო. შესაბამისად, დღემდე მოღწეული ხელოვნების ყველა შედევრი საბოლოო ჯამში ერთ ადგილზე არის გაჩერებული. 
</p>
<p>
დღეს უკვე შესაძლებელია საკუთარი გზავნილის მოძრაობის საშუალებით გადმოცემა, ვიდეო გამოსახულებისა და გრაფიკული ელემენტების გაერთიანებით ვიდეო პროდუქტების შექმნა. დღეს ადამიანის თვალი იმდენად მიჩვეულია ვიდო გზავნილებს, რომ ძალიან ძნელია მისი ყურადღების მიპყრობა სტატიკური გამოსახულებით. ამიტომ სხვადასხვა ორგანიზაცია, კომერციული კომპანია, უამრავ რესურსს ხარჯავს მოკლე სარეკლამო რგოლებისა და ინფორმაციული ვიდეო გზავნილების შესაქმნელად. 
</p>
<p>
კურსი პრაქტიკული ხასიათისაა, რომლის განმავლობაში მსმენელები შეისწავლიან როგორც ვიდეო გადაღებას, ასევე, Adobe After Effects-სა და Adobe Premier-ში მუშაობას. ასევე, ხმის ჩაწერასა და დამუშავებას. კურსის განმავლობაში მსმენელები ასევე რეალურ პროექტებზე იმუშავებენ და თავად შექმნიან ვიდეო პროდუქტებს. 
</p>', NULL, 1)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (19, N'Facebook Ads, Google AdWords, Google Analytics, SEO', N'<p>დღეს, როცა ყველა მიისწრაფვის ციფრულ სივრცეში მაქსიმალური ხილვადობისკენ, მხოლოდ ვებსაიტის ან სოციალური ქსელის გვერდის ფლობა აღარ არის საკმარისი წარმატებისთვის...</p>
<p>საძიებო სისტემებში მოწინავე პოზიციებისთვის კომპანიებს შორის ნამდვილი ომია გაჩაღებული, სოციალური პლატფორმები სულ უფრო მეტ პირობას უყენებენ რეკლამის განმთავსებლებს - ჯამში კი გამოდის, რომ თუ თქვენ წარმატებულ SEO პრაქტიკებსა და ციფრულ რეკლამას (თავისი მძიმე არტილერიით) ერთად არ იყენებთ, თქვენ ვერ მოიგებთ ციფრულ ომს.</p>
<p>ციფრული რეალობიდან გამომდინარე, რეკლამის განმთავსებლისთვის მთავარი ამოცანაა - მიაწოდოს მომხარებელს საინტერესო ინფორმაცია ოპტიმალურ დროს, კონკრეტულ ადგილას, კონკრეტული მოწყობილობის გამოყენებისას. ამ კურსის ფარგლებში სტუდენტები სწორედ ამ ამოცანის ამოხსნის გზებს შეისწავლიან - როგორ განსაზღვრონ, რა არის რელევანტური კონკრეტული აუდიტორიისთვის, როგორ იპოვონ ეს აუდიტორია იქ, სადაც კომფორტულად გრძნობს თავს, როგორ შეარჩიონ ინფორმაციის მიწოდების ოპტიმალური ფორმატი, რას უნდა მიაქციონ ყურადღება რეპორტებში, როგორ უნდა გამოიყენონ მიღებული ინფორმაცია და მთავარი, რა ტექნიკური შესაძლებლობები არსებობს ციფრული ომის მოსაგებად.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>კურსის გავლის შედეგად სტუდენტებს ეცოდინებათ:</strong></p>
<ul>
<li>ვებგვერდების ოპტიმიზაცია საძიებო სისტემებისთვის</li>
<li>ეფექტური ლენდინგის შექმნა</li>
<li>ციფრული რეკლამის მნიშვნელობა და უპირატესობები</li>
<li>ციფრული რეკლამის ძირითადი არხები, მათი სარეკლამო ფორმატები და შესაძლებლობები</li>
<li>Facebook-ზე რეკლამის შექმნა, შედეგების კონტროლი, ანალიზი და ოპტიმიზაცია</li>
<li>Google-ში რეკლამის შექმნა, შედეგების კონტროლი, ანალიზი და ოპტიმიზაცია</li>
</ul>
', NULL, 6)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (21, N'პროგრამირება და ლოგიკა', N'<p>იმ საქმის დიდი ნაწილს, რომელსაც წარსულში ადამიანი აკეთებდა, დღეს კომპიუტერი ასრულებს.
გამოთვლებს კომპიუტერების ეპოქაში ჩვენ მაგივრად მანქანები ანხორციელებენ. სავარაუდოდ ის,
რაშიც დღეს ადამიანების დახმარება გვჭირდება, მომავალში კომპიუტერების საზრუნავი იქნება.
დიდი ხანია აზრი დაკარგა კომპიუტერთან მუშაობის შემსწავლელმა კურსებმა, დღეს კომპიუტერთან,
კომპიუტერულ პროგრამებთან მუშაობას ადამიანი პატარაობიდანვე, სიარულისა და ლაპარაკის
პარალელურად სწავლობს. პარადოქსია მაგრამ როდესაც საქმე ჭკვიან მოწყობილობებს ეხება,
ხშირად პატარებმა, დიდებზე უფრო მეტი იციან. მაგრამ პატარების ცოდნა, როგორც წესი არ არის
სისტემატიზირებული და გართობისკენ, თამაშისაკენ არის მიამრთული. არადა თუკი
ტექნოლოგიებით დაინტერესებული ბავშვები, პატარაობაშივე შეისწავიან პროგრამულ კოდთან
მუშაობის პრონციპებს. თუკი ეს რთული პროცესი სახალისო თამაშის ფორმით იქნება
წარმოდგენილი, ბავშვობაში მიღებული ცოდნა, მომავალში არჩეული პროფესიის მიუხედავად,
დაეხმარება მათ რთული ამოცანებისა და პრობლემების გადაჭრაში. ყველ წელს მცირდება იმ
პროფესიების რაოდენობა რომლებშიც კომპიუტერთან მუშაობის ცოდნა, სამსახურის დაწყების
აუცილებელი პირობა არ არის. ბევრი ავტოტრიტეულ წყაროში დღეს ღიად საუბრობენ იმაზე რომ
პროგრამულ კოდთან მუშაობა მომავალში, ერთ-ერთი აუცილებელი უნარი იქნება სხვადახვა
სამსახურში აყვანისას.</p>
<p>პროგრამული კოდის სახელოსნოში პატარები პროგრამირების საფუძვლებსა და ციფრულ ლოგიკას
შეისწავლიან. სასწავლო მასალა, ინტერაქტიული თამაშის, playground-ის სახით იქნება
წარმოდგენილი. სწავლის განმავლობაში ბავშვები თავად შექმნიან სხვადასხვა ალგორითმებს,
ინტერაქტიულ თამაშში წამოჭრილი პრობელმებისა და ამოცანების გადასაჭრელად. ამ პროცესში
მათ კოდის დაწერაც მოუწევთ. ბრძანებები რომლებიც გამოიყენება კოდის დასაწერად კომპანია
APPLE-ის მიერ შექმნილი, ერთ-ერთი ყველაზე თანამედროვე პროგრამული ენის swift-ის სინტაქსს
შიცავს. მიღებული ცოდნა პატარებს დაეხმარება შეიმუშავონ პროგრამულ ენებთან მუშაობის
მიდგომები და საფუძვლებთან ერთად შეისწავლონ პროგრამული ენის საწყისები. ერთად ავუწყოთ
ფეხი ტექნოლოგიებს და ვასწავლოთ პროგრამირება პატარებს სანამ ეს მათვის სახალისო თამაშს
წარმოადგენს..</p>
', NULL, 5)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (22, N'Wordpress', N'<p><strong>ზოგადი ინფორმაცია:</strong></p>
<p><span style="font-weight: 400;">WordPress პირველად &nbsp;2003 წელს გამოჩნდა, მისი დამაარსებლები, მეტ მალენგვეგი და მაიკლ ლიტლი არიან. </span></p>
<p><span style="font-weight: 400;">საიტებისა და ბლოგების მართვის სისტემა დაწერილია PHP პროგრამირების ენაზე, დღევანდელი მონაცემებით, მას 60 მილიონზე მეტი საიტი იყენებს.</span></p>
<p><span style="font-weight: 400;">უამრავი დამხმარე კომპიუტერული პროგრამისა თუ ონლაინ სერვისის საშუალებით, ვებგვერდის შექმნა უფრო და უფრო მარტივი ხდება. თანამედროვე პოპულარული პლატფორმა Wordpress-იც სწორედ სიმარტივეს ემსახურება.</span></p>
<p>&nbsp;</p>
<p><strong>სწავლის შედეგი:</strong></p>
<p><span style="font-weight: 400;">ამ კურსის ფარგლებში მსმენელები სრულფასოვანი ვებგვერდის შექმნას, მსოფლიოში ერთ-ერთი ყველაზე პოპულარული CMS სისტემის, wordpress-ის საშუალებით შეისწავლიან. კურსის ბოლოს მათ ეცოდინებათ, ინტერნეტის ფუნქციონირების პრინციპები, wordpress-ის ბაზაზე საკუთარი ვებგვერდის შექმნა, და მართვა, Embed კოდებთან მუშაობა.</span></p>
<p><br /><br /></p>', NULL, 2)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (23, N'Drupal', N'<p><strong>ზოგადი ინფორმაცია:</strong></p>
<p><span style="font-weight: 400;">ვებ-ტექნოლოგიების ყოველდღიური განვითარების სისწრაფე შეუფასებელია. ცვლილებები იმდენად ხშირია, რომ სპეციალისტებისგან გამუდმებით მოითხოვს გადაწყვეტილებების სწრაფ და ხარისხიანად მიღებას. Drupal </span><span style="font-weight: 400;">ერთ&ndash;ერთი &nbsp;პოპულარული და სანდო პროგრამული პროდუქტია ვებ-საიტების შესაქმნელად. ის ფართოდ გამოიყენება დასავლეთ ვებ-სივრცეში ისეთი ორგანიზაციების მიერ როგორებიცაა: NBA, MTV, WHITE HOUSE. მის ძირითად ინტერესში შედის მომხმარებელზე მაქსიმალურად ადაპტირებული სამუშაო სისტემა. მრავალ ენაზე არის ნათარგმნი (მათ შორის ქართულად) და 4500-ზე მეტი მზა მოდული გააჩნია სხვადასხვა პრინციპის საიტთა შესაბამისად.</span></p>
<p><span style="font-weight: 400;">უნდა აღინიშნოს, რომ დრუპალ-დეველოპერის პროფესია, საკმაოდ მოთხოვნადი და მაღალ ანაზღაურებადია.</span></p>
<p>&nbsp;</p>
<p><strong>სწავლის შედეგი:</strong></p>
<p><span style="font-weight: 400;">კურსის გავლის შემდეგ სტუდენტებს ეცოდინებათ:</span></p>
<ul>
<li style="font-weight: 400;"><span style="font-weight: 400;">Drupal </span><span style="font-weight: 400;">8 ფრეიმვორკზე მუშაობის ძირითადი პრინციპები</span><span style="font-weight: 400;">;</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">მარტივი და საშუალო დონის ვებ-გადაწყვეტილებების ორგანიზება Drupal 8-ის ბაზაზე;</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">სრულფასოვანი ვებგვერდის აწყობა Drupal 8-ის საშუალებით;</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Drupal 8 სისტემის ადმინისტრირება/მართვა.</span></li>
</ul>', NULL, 2)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (24, N'Meanlab', N'<p><strong>ზოგადი ინფორმაცია</strong></p>
<p><strong>Meanlab </strong><span style="font-weight: 400;">რამდენიმე ვებ და სერვერულ ტექნოლოგიას აერთიანებს; ესენია:</span></p>
<p><strong>MongoDB</strong><span style="font-weight: 400;">, free, open-source, მულტი-პლატფორმული, დოკუმენტზე-ორიენტირებული, არარელაციური მონაცემთა ბაზა. მას აქტიურად იყენებენ: Twitter, SurveyMonkey, IBM, Github.</span></p>
<p><strong>Node.js </strong><span style="font-weight: 400;">Javascript-ზე დაფუძნებული ასინქრონული, back end ტექნოლოგია, რომელიც უზრუნველყოფს აპლიკაციის ბიზნეს ლოგიკის ენკაპსულირებას. დაშენებული არის google chrome V8 ძრავზე. იყენებენ შემდეგი კომპანიებისთვის Microsoft, IBM, Paypal, Netflix, Cisco, Uber.</span></p>
<p><strong>Angular 4</strong><span style="font-weight: 400;"> &nbsp;front-end ტექნოლოგია "single page application"-ების შესაქმნელად, &nbsp;რომელიც ჩამოყალიბდა google-ის მხარდაჭერითა და ინიციატივით. ბოლო 1 წლის მანძილზე მას აქტიურად იყენებენ ისეთი კომპანიები, როგორებიც არიან: Google, Youtube, Netflix, </span><span style="font-weight: 400;">Upwork, Paypal.</span></p>
<p><span style="font-weight: 400;">ამგვარი თანამედროვე ტექნოლოგიების გამოყენებით, მხოლოდ ერთი ენის საშუალებით შესაძლებელია შევქმნათ, როგორც web, ასევე mobile და desktop აპლიკაციები.</span></p>
<p>&nbsp;</p>
<p><strong>კურსის მიზანი</strong></p>
<p><span style="font-weight: 400;">კურსის მიზანია, სტუდენტებს შეეძლოთ დამოუკიდებლად, მხოლოდ Javascript-ის გამოყენებით &nbsp;შექმნან, ნებისმიერი სირთულის მქონე სწრაფი და სტრუქტურიზებული ვებ-აპლიკაცია.</span></p>', NULL, 2)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (26, N'ციფრული პროდუქტის შექმნა და მართვა ', N'<p>"იდეები ყველას აქვს, მაგრამ მათი გასაგებად გადმოცემის ცოდნა ძალიან ცოტას!" - ასე გვგონია ჯეოლაბში!<br /><br />ამიტომ&hellip;<br /><br />მისთვის ვინც, პრობლემებში უმეტესად შესაძლებლობებს ხედავს, ყოველ დღე მინიმუმ ერთი სტარტაპ ან &bdquo;რა-კარგი-იქნებოდა-ტიპის&rdquo; იდეა აქვს, მიუხედავად იმისა სტარტაპერია, ენტრეპრენერი, კორპორატიული თანამშრომელი, თუ რომელიმე მათგანი მომავალში, ჯეოლაბი იწყებს სპეციალურ Product Design-ის კურსს, სადაც ისწავლი, როგორ გარდაქმნა იდეა კონცეფციად და შესაბამის ფორმატში გამოსახო.<br /><br />კონცეფციებს (ანუ დაღვინებულ-გააზრებულ-ჩამოყალიბებულ იდეებს) სტანდარტული ფორმატი აქვთ იმისათვის, რომ გასაგები იყოს ინვესტორისთვის, პარტნიორისთვის, მენეჯერისთვის თუ კომპანიებისთვის, რომელსაც &bdquo;ფროდაქშენის&ldquo; დაკვეთას აძლევთ. კურსი, რომელიც ასწავლის პროცესს, თუ როგორ უნდა გარდაიქმნას &bdquo;მოფრენილი&ldquo; იდეა დადოკუმენტებულ კონცეფციად, არის &bdquo;ფრეიმვორკი&ldquo; (ესეც კომპეტენტურად ჟღერს), რომელიც იდეების გენერირების პროცესს საგრძნობლად აჩქარებს და წარმადობასაც მნიშვნელოვნად ზრდის.</p>', NULL, 6)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (27, N'ჯავასკრიპტი', N'<p>დღეს კომპიუტერული ტექნოლოგიების სფერო ძალიან სწრაფად ვითარდება. ჩნდება ახალი კომპიუტერული მოწყობილობები, მატულობს მოთხოვნა პროგრამისტებზე, ადამიანებზე რომლებსაც კომპიუტერული მოწყობილობების &bdquo;გაცოცხლება&ldquo; შეუძლიათ. შესაბამისად ჩნდება ახალი პროგრამული ენები, რომლებიც კონკრეტული ტიპის პროგრამების შესაქმნელად გამოიგონეს. დღეს პროგრამისტები იძულებულები არიან რამოდენიმე ენა შეისწავლონ. ვინაიდან ერთი შეხედვით არ არსებობს, ერთი უნივერსალიური ენა, რომლითაც დღეს არსებული მრავალფეროვანი ოპერაციული სისტემებისა და კომპიუტერული მოწყობილობებისათვის კომპიუტერული კოდის შექმნა იქნებოდა შესაძლებელი.</p>
<p>მაგრამ JavaScript-ი რომელიც არ არის ახლად შექმნილი ენა და თავის დროზე სკრიპტების (კომპიუტერული მოწყობილობებისათვის მარტივი ინსტრუქციების) შესაქმნელად გამოიგონეს დღეს სრულფასოვან პროგრამულ ენად ჩამოყალიბდა.</p>
<p>ვებ საიტების აბსოლუტური უმრავლესობა სწორედ ამ ენას იყენებს რათა მომხმარებელს მრავალფეროვანი და მოსახერხებელი ფუნციონალი შეთავაზოს. უფრო მეტიც, ამ პროგრამულ ენაზე უკვე შესაძლებელია როგორც ვებგვერდის ვიზუალური ნაწილის გაცოცხლება (FrontEnd) ასევე მისი უკანა მხარის (BackEnd) აწყობაც და მონაცემთა ბაზების მართვა. თუმცა JavaScript-ის შესაძლებლობები ამით არ ამოიწურება. ბოლო წლებში შექმნილი სხვადასხვა ტექნოლოგიების წყალობით, ჯავასკრიპტი უნივერსალურ ენად გადაიქცა, რომელიც ძალიან ბევრი დანიშნულებით შეგვიძლია გამოვიყენოთ. მხოლოდ ჯავასკრიპტით უკვე შესაძლებელია მობილურ აპლიკაციებზე მუშაობა, რომლებიც თავსებადი იქნება როგორც iOS, ისე Android სისტემებზე. შესაძლებელია თამაშების აწყობა და მიკრო კონტროლიორების დაპროგრამებაც კი. შესაბამისად JavaScript-ი მულტიფუქციონალურ, უნივერსალურ პროგრამირების ენად ყალიბდება.</p>
<p>ამას ემატება თავად ენის სიმარტივე და ამ ენის განვითარებაზე მომუშავე პროგრამისტების გაერთიანებები, რომელბიც მუშაობენ ეკოსისტემის გაუმჯობესებაზე. JavaScript-ს შეუცვლელ ტექნოლოგიად აქცევს მისი უნივერსალურობა. ამას ადასტურებს ისიც რომ უამრავი ტექნოლოგიური კომპანია უკვე აქტიურად იყენებს ჯავასკრიპტზე დაფუძნებულ ტექნოლოგიებს და მათი რიცხვი ძალიან სწრაფად იზრდება.</p>', NULL, 2)
INSERT [dbo].[Courses] ([ID], [CourseTitle], [CourseDesc], [CourseVideoLink], [DirectionId]) VALUES (28, N'ქოფირაითინგი', N'<p>ჯერ კიდევ უხსოვარი დროიდან, როცა გამყიდველები ყურადღების მისაქცევად ხმამაღლა გაჰყვიროდნენ ბაზარში, საჭირო იყო ისეთი ადამიანი, რომელიც ყველაზე მახვილგონივრულ ფრაზასა თუ ლექსს მოიფიქრებდა. მაშინ მოშაირეს თუ მოლექსეს დაუძახებდნენ ხოლმე დასახმარებლად.</p>
<p>დღეს, როცა ტექნოლოგიურმა პროგრესმა და არხების მრავალფეროვნებამ კომუნიკაცია გაამარტივა, მახვილგონივრულობა და მრავალფეროვანი იდეების მოფიქრება პროფესიად იქცა. ასეთ ადამიანებს ახლა ქოფირაითერებს ეძახიან.
 კურსის განმავლობაში, კარგი გამგონეები, კარგ მთქმელებად ჩამოყალიბდებიან და იდეათა მორევიდან საჭირო დინებაში შეცურვას ისწავლიან.</p>
', NULL, 6)
SET IDENTITY_INSERT [dbo].[CourseSubject] ON 

INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1324, 1, 3)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1325, 2, 4)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1326, 3, 4)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1327, 4, 4)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1328, 5, 4)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1329, 6, 4)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1330, 2, 5)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1331, 3, 5)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1332, 4, 5)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1333, 5, 5)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1334, 7, 5)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1335, 8, 6)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1336, 2, 7)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1337, 10, 7)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1338, 11, 7)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1339, 2, 8)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1340, 9, 8)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1341, 10, 8)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1342, 12, 8)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1343, 2, 9)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1344, 14, 9)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1345, 15, 9)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1346, 2, 11)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1347, 13, 11)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1348, 28, 11)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1349, 16, 11)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1350, 2, 12)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1351, 3, 12)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1352, 4, 12)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1353, 17, 12)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1354, 18, 13)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1355, 19, 14)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1356, 24, 5)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1357, 37, 7)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1358, 37, 8)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1359, 37, 11)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1360, 24, 12)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1361, 25, 15)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1362, 26, 16)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1363, 27, 19)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1364, 29, 7)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1365, 5, 12)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1366, 30, 4)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1367, 30, 5)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1368, 30, 12)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1369, 30, 7)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1370, 30, 8)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1371, 30, 11)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1372, 30, 9)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1373, 32, 21)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1374, 33, 22)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1375, 34, 23)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1376, 35, 24)
INSERT [dbo].[CourseSubject] ([courseSubjectID], [SubjectID], [CourseID]) VALUES (1377, 38, 9)
SET IDENTITY_INSERT [dbo].[CourseSubject] OFF
SET IDENTITY_INSERT [dbo].[Direction] ON 

INSERT [dbo].[Direction] ([ID], [DirectionTitle], [DirectionDesc], [DirectionImage], [DirectionImageExt], [DirectionDescMini]) VALUES (1, N'დიზაინი', N'<p>
დიზაინერი ის ადამიანია, რომელიც გარკვეულ ფორმას ანიჭებს ჩანაფიქრს, ან მას გრაფიკული გამოსახულებით გადმოსცემს. გრაფიკული დიზაინის სპეციალისტი სხვადასხვა ვიზუალური ელემენტის შერჩევითა და შეხამებით (შრიფტი, გამოსახულება, ფერი, ფორმა და ა. შ.) აუდიტორიას გარკვეულ გზავნილს უზიარებს. 3D დიზაინერი კი სამგანზომილებიან ობიექტებს, პეიზაჟებსა და არსებებს ქმნის. დიზაინის მიმართულებით ჯეოლაბი, მსურველებს რამდენიმე კურსს სთავაზობს:
</p>
<p>
ჯეოლაბში ისწავლება როგორც პოლიგრაფიული დიზაინი - საბაზისო კურსის სახით, ასევე, ინტერფეისის პროფესიული (მობილური აპლიკაციის, ვებგვერდისა და ა. შ.) დიზაინი. პირველ შემთხვევაში სტუდენტები, კურსის ფარგლებში, პლაკატის, ბუკლეტისა და სხვა პოლიგრაფიული პროდუქტის დიზაინზე მუშაობენ, მეორე შემთხვევაში კი მოსწავლეები თავად ქმნიან ელექტრონული მოწყობილობის, ვებგვერდისა და მობილური აპლიკაციის დიზაინსა და აიქონებს. ორივე შემთხვევაში სტუდენტების ძირითადი სამუშაო ინსტრუმენტი Adobe Illustrator-ია. კურსის ფარგლებში სტუდენტები Illustrator-ის გარდა სხვა გრაფიკულ პროგრამებშიც მუშაობენ, მაგალითად, Adobe Photoshop-ში.

</p>
<p>
დიზაინის მიმართულებით ჯეოლაბი კიდევ ერთ, 3D დიზაინის პროფესიულ კურსს სთავაზობს მსურველებს. ამ კურსის ფარგლებში სტუდენტები სივრცული ობიექტების შექმნას, მათ ანიმაციასა და ვიზუალიზაციას სწავლობენ. კურსის ფარგლებში სტუდენტები Cinema 4D-ს იყენებენ, რომელიც იდეალურია ზემოხსენებული ამოცანებისთვის. ამ ძლიერი 3D ინსტრუმენტის საშუალებით შესაძლებელია სარეკლამო რგოლების, მოკლემეტრაჟიანი ვიდეო პროდუქტებისა და თამაშების პერსონაჟების შექმნა.
</p>
', N'NoIADUU6a4IpdqUgk1aRTm3H2yvG4GDJ', N'.png', N'თუ შეგიძლია წარმოიდგინო, შეგიძლია გააკეთო')
INSERT [dbo].[Direction] ([ID], [DirectionTitle], [DirectionDesc], [DirectionImage], [DirectionImageExt], [DirectionDescMini]) VALUES (2, N'ვებ პროგრამირება', N'<p>ვებგვერდი ჩვენი ყოველდღიური ცხოვრების განუყოფელი ნაწილია. საქმეს, რომელსაც ადრე ჩვენთვის სხვადასხვა კომპანიისა და სახელმწიფო სტრუქტურების კლერკები ასრულებდნენ, დღეს  ვებგვერდისა და ვებ სერვისის დახმარებით თავად ვაკეთებთ. ეს შეიძლება იყოს თვითმფრინავის ბილეთის ონლაინ სერვისის საშუალებით შეძენა, სასტუმროს დაჯავშნა და სხვადასხვა მნიშვნელოვანი ოპერაცია.</p>
<p>ჯეოლაბში ვებპროგრამირების მიმართულებით დინამიური ვებგვერდების შექმნა და გამართვა ისწავლება. დინამიური ვებგვერდი ვებ სერვერზე სკიპტრების, შაბლონების, მონაცემთა ბაზაში განთავსებული ინფორმაციის სახით ინახება. ასეთი ვებგვერდი სერვერზე ცალკეული კომპონენტების სახით არის მოთავსებული. ყოველი ახალი მომხმარებლისათვის სერვერი ხელახლა აწყობს ცალკეული კომპონენტებისაგან იმ ვებგვერდს, რომელსაც მომხმარებელი თავის ბრაუზერში ხედავს. მაგალითად, ახალი ამბების პორტალი, ხშირ შემთხვევაში, დინამიური ვებგვერდია.</p>

<p>
ჯეოლაბში ვებპროგრამირება სამ კურსს მოიცავს: ვებპროგრამირება PHP-ზე, ვებპროგრამირება .NET-ზე და Front End (HTML). PHP-ზე სხვადასხვა ბიზნეს კომპანიისა და ახალი ამბების სააგენტოების ვებგვერდების უმეტესობაა შექმნილი, ხოლო .NET-ზე მრავალფუნქციურ, კორპორატიულ ვებგვერდებს ქმნიან. ამ პროგრამულ ენებზე მომუშავე სპეციალისტები ვებგვერდის „ბექს“ (BACK) ანუ მის სერვერულ, ლოგიკურ ნაწილს აწყობენ. ორივე კურსი პროფესიულია და სტუდენტები ბოლო ერთი თვის განმავლობაში, ლექტორების დახმარებით, საკუთარ პროექტებზე მუშაობენ. მესამე ვებ პროგრამირებისკურსი Front End (HTML) - საბაზისო კურსია და ორი თვე გრძელდება. ამ კურსის ფარგლებში ვებგვერდის „ფრონტის“ ანუ იმ ნაწილის აწყობა ისწავლება, რომელსაც უშუალოდ მომხმარებელი ხედავს. შესაბამისად, ვებ სპეციალისტები ორ ჯგუფად იყოფიან: „ბექენდის“ (Back-End) სპეციალისტები ანუ ისინი, ვინც ვებგვერდის დაფარულ, მომხმარებლისათვის უხილავ, სერვერულ ნაწილს აწყობენ და „ფრონტენდის“ (Front End) სპეციალისტებად, რომლებიც ვებგვერდის ვიზუალურ ნაწილს აკეთებენ.
</p>', N'gz7deGgyqKpzr77Jv5ZFUK3XimP5UnBT', N'.png', N'თუ კომპანიას არ აქვს ვებგვერდი, ის არ არსებობს')
INSERT [dbo].[Direction] ([ID], [DirectionTitle], [DirectionDesc], [DirectionImage], [DirectionImageExt], [DirectionDescMini]) VALUES (3, N'მობილური პროგრამირება', N'<p>
იმ საქმის დიდ ნაწილს, რომელსაც წარსულში ადამიანი აკეთებდა, დღეს კომპიუტერი ასრულებს. ის, რაშიც დღეს ადამიანების დახმარება გვჭირდება, მომავალში კომპიუტერების საზრუნავი იქნება. ამიტომაც საჭიროა იმ ენის ცოდნა, რომლის საშუალებითაც კომპიუტერისათვის დავალების მიცემაა შესაძლებელი. დღეს პროგრამისტები „ჯადოქრებს“ გვანან. ისინი  პროგრამული კოდის ჯადოსნური სიტყვებით ადამიანისათვის წარმოუდგენელ პროცესებს მართავენ.
</p>
<p>
თავის მხრივ სმარტფონიც ადამიანისათვის შეუცვლელია და ისიც ჯადოსნურ მოწყობილობად შეგვიძლია მივიჩნიოთ.  იგი არა მარტო საკომუნიკაციო საშუალებაა, არამედ მისი დახმარებით სოციალურ ქსელში მეგობრებთან ვურთიერთობთ, მასში საკუთარი ფოტოებისა და ვიდეო ჩანაწერების უზარმაზარ არქივს ვინახავთ, მულტიმედიურ ჩანაწერებს ვაკეთებთ და მობილური თამაშებით ვირთობთ თავს. საქმეშიც შეუცვლელია, ონლაინ ბანკინგისა და სხვადასხვა სერვისების საშუალებით ყოველდღიურ პრობლემებს ვწყვეტთ. 
</p>
<p>
ჯეოლაბში ისწავლება მობილური აპლიკაციების დაპროგრამება, როგორც აიფონისათვის (iOS ოპერაციული სისტემისთვის) ასევე Android ტელეფონებისათვის. პირველ შემთხვევაში სტუდენტები Apple-ის მიერ ახლად შექმნილ პროგრამულ ენას, swift-ს სწავლობენ, მეორე შემთხვევაში კი JAVA-ს Android-ისათვის. კურსი პრაქტიკული ხასიათისაა, ამიტომ სტუდენტები მობილურ აპლიკაციებს თავად ქმნიან. GeoLab-ის სტუდენტები უზრუნველყოფილნი არიან Mac-ის კომპიუტერებით, ასევე მათ შეუძლიათ საკუთარი iOS აპლიკაციების GeoLab-ში არსებული iPhone-ისა და iPad-ის საშუალებით დატესტვა. 
</p>', N'2nZwceASeMaCZfjlRKJSJCuZf8PxLG3T', N'.png', N'მოწინავე ტექნოლოგია არაფრით განსხვავდება მაგიისაგან')
INSERT [dbo].[Direction] ([ID], [DirectionTitle], [DirectionDesc], [DirectionImage], [DirectionImageExt], [DirectionDescMini]) VALUES (4, N'თამაშების დეველოპმენტი', N'<p>
კომპიუტერული თამაშების ინდუსტრიამ, თავისი ბრუნვით, უკვე დიდი ხანია, ფილმების ინდუსტრიას გაასწრო. თანამედროვე კომპიუტერულ თამაშებში იქმნება როგორც არსებული სამყაროს ვირტუალური ასლები, ასევე არარსებული, ფანტასტიკური სამყაროები. თამაშების გრაფიკაც არ ჩამოუვარდება თანამედროვე კინოინდუსტრიის პროდუქტებს. 3D გრაფიკით გაჯერებული კომპიუტერული თამაშის შექმნა რთულია და დიდ რესურსს მოითხოვს, მაგრამ ამ მიმართულების უპირატესობა სწორედ ისაა, რომ პირველ ეტაპზე საკუთარი ძალებისა და შესაძლებლობების მარტივ თამაშებში გამოცდა შეიძლება. ასეთი თამაშები არანაკლები პოპულარობით სარგებლობს და უამრავი წარმატების მაგალითად იქცა. 
</p>
<p>
ჯეოლაბში თამაშების შექმნა Unity-ს პროგრამაში ისწავლება. ამ პროგრამულ სივრცეში შექმნილი თამაშის დაექსპორტება 20-ზე მეტ პლათფორმაზეა შესაძლებელი. თამაშების დეველოპერი ქმნის თამაშს და შემდეგ მისი შექმნილი თამაშის განთავსება 16-ზე მეტ პლათფორმაზე არის შესაძლებელი: ისეთზე, როგორიცაა Windows, Android, Mac OS, iOS, Xbox, Wii და ა. შ.
</p>
<p>
ჯეოლაბში სასწავლო პროცესს შესაბამისი სფეროს გამოცდილი პრაქტიკოსი სპეციალისტები უძღვებიან და სწავლის პარალელურად სტუდენტები პრაქტიკულ სამუშაოში არიან ჩართულები.
</p>', N'M7IzCd1xwpmITjj66zixfzc3t7IrKtWN', N'.png', N'ცხოვრება მოკლეა, დაიწყე საუკეთესო თამაშის შექმნა დღეს')
INSERT [dbo].[Direction] ([ID], [DirectionTitle], [DirectionDesc], [DirectionImage], [DirectionImageExt], [DirectionDescMini]) VALUES (5, N'კოდირება', N'<p>
ბევრი ფიქრობს, რომ კომპიუტერულ კოდთან მუშაობა, კომპიუტერის ენაზე საუბარი, მხოლოდ ტექნიკური განათლების მქონე ადამიანს შეუძლია, მაგრამ ეს ასე არ არის. მრავალ ქვეყანაში სხვადასხვა პროფესიის ადამიანები კომპიუტერულ კოდთან მუშაობას - „კოდირებას“ სწავლობენ. რადგან უცხო ენის შესწავლა ყველას შეუძლია, პროგრამული კოდის სწავლაც ნებისმიერი მსურველისთვის არის შესაძლებელი. 
</p>
<p>
ჯეოლაბის კოდირების მიმართულება ნებისმიერი დაინტერესებული პირისთვისაა, მათთვისაც, ვისაც ჯერ  პროგრამირებასთან შეხება არ ჰქონია, მაგრამ აინტერესებს როგორ იქმნება პროგრამული კოდი. ჯეოლაბი სტუდენტებს კოდირების მიმართულებით ერთ კურსს სთავაზობს. კურსი პრაქტიკული ხასიათისაა, სტუდენტები სწავლების პროცესში ერთ-ერთ თანამედროვე პროგრამულ ენაზე, C#-ზე მუშაობენ.
</p>
', N'4Kud4DEaatp2p6qZGZdzoQZtcuTroWQE', N'.png', N'ენა, რომელიც კომპიუტერმა იცის
')
INSERT [dbo].[Direction] ([ID], [DirectionTitle], [DirectionDesc], [DirectionImage], [DirectionImageExt], [DirectionDescMini]) VALUES (6, N'კომუნიკაცია', N'<p>
დღეს ორგანიზაციების უმეტესობას ინტერნეტში საკუთარი საინფორმაციო არხი აქვს. ეს შეიძლება იყოს ვებგვერდი, ან რომელიმე სოციალური მედიის ონლაინ პროფილი. თუ ადრე ინფორმაციის გავრცელება მხოლოდ ტრადიციული მედიის დახმარებით ხდებოდა (ტელევიზია, რადიო, ჟურნალი), დღეს საინფორმაციო ველი ფრაგმენტირებულია და სხვადასხვა ორგანიზაციას საკუთარი საინფორმაციო არხი აქვს. სხვადასხვა სფეროს კომპანიების საზოგადოებასთან ურთიერთობის სამსახურები, ფაქტობრივად, მედიის როლს ითავსებენ და საკუთარი არხებით ინფორმაციას თავად ავრცელებენ. ამით ორგანიზაციები ცდილობენ, პირდაპირი და უშუალო კავშირი დაამყარონ საკუთარ მომხმარებლებთან.
</p>
<p>
კურსის განმავლობაში მსმენელები შეისწავლიან როგორც ონლაინ მედია არხების ფუნქციონირების პრინციპებს, ასევე, საკუთარი საინფორმაციო არხების მართვასა და განვითარებას.
</p>
<p>
ლექციების მსვლელობისას გათვალისწინებულია პრაქტიკული სამუშაოები, რომლის დროსაც მსმენელები თავად ქმნიან და მართავენ სხვადასხვა სოციალურ მედია არხს და შეისწავლიან წარმატებული ციფრული მარკეტინგისთვის საჭირო ყველა საკითხს.
</p>', N'QHFHqATfe1EiipMBXme1NO57CkecizDh', N'.png', N'იყავი იქ, სადაც შენი მომხმარებლები არიან – თავად მართე სოციალური მედიის არხები')
SET IDENTITY_INSERT [dbo].[Direction] OFF
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (1, N'ანი', N'ასათიანი', N'<p>
2014 წლიდან მუშაობს როგორც freelancer, სხვადასხვა ქართული და საერთაშორისო ორგანიზაციისთვის, მათ შორის: მარკეტინგული კომპანია - „Connect”.
</p>
<p>
2012-2014 წწ. - გერმანული უნივერსიტეტის „HFG OFFENBACH” კურსდამთავრებული ვიზუალური კომუნიკაციის მიმართულებით. პარალელურად მუშობდა ვიზბადენში, კომპანია „Lange von muenchhausen”-ში ვებ დეველოპერად.
</p>
<p>
2014 წ. GDE (Google Developer Expert) გაიარა ანდროიდ ექსპერტების ჯგუფის ტრენინგი.
</p>
<p>
აქვს რამდენიმეწლიანი პედაგოგიური გამოცდილება. კითხულობდა ლექციებს ილიას სახელმწიფო უნივერსიტეტში, ონლაინ კომუნიკაციის მიმართულებით.
</p>
<p>პროექტები:</p>
<p>გერმანიაში სწავლის პერიოდში მოამზადა რამდენიმე პროექტი SKODA და SMART-ისთვის.
</p>', N'a.asatiani@geolab.edu.ge', N'/Photos/Lecturers/ani-asatiani.png', 8, N'ვებ პროგრამირება Front-End (HTML)')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (3, N'გიორგი', N'ვახტანგიშვილი', N'<p>
2015 წლიდან დღემდე - Geolab-ის ტექნიკური დირექტორი. ასწავლის თბილისის თავისუფალ უნივერსიტეტსა და საქართველოს საზოგადოებრივ საქმეთა ინსტიტუტში (GIPA). არის GDG Tbilisi-ის (Google’s Developer Groups Tbilisi) ერთ-ერთი მთავარი ორგანიზატორი.

</p>
<p>
თბილისის თავისუფალი უნივერსიტეტის ბაკალავრი, მათემატიკისა და კომპიუტერული მეცნიერებების მიმართულებით. გავლილი აქვს GDE-ის (Google Developer Expert) ანდროიდ ექსპერტების ჯგუფის ტრენინგი.

</p>
<p>
2011-2012 წწ. მოიპოვა ACM-ის ნახევარფინალის მესამე ხარისხის დიპლომი.
</p>
<p>
2013 წ. მესამე ადგილი დაიკავა Unihack-ის ჰაკათონზე, პროექტით - “Cloud Library”.

</p>
<p>
2014-2015 წწ. - კომპანია „Altasoftware”-ის ანდროიდ დეველოპერი. აქვს ICT სფეროში რამდენიმეწლიანი სამუშაო გამოცდილება.

</p>
<p>
პროექტები:

</p>
<p>
სხვადასხვა პროექტში იყო freelancer;

</p>
<p>
B2B პროექტებზე მუშაობდა ბანკებთან “კონსტანტა“ და „TBC”.

</p>
', N'g.vakhtangishvili@geolab.edu.ge', N'/Photos/Lecturers/giorgi-vakhtangishvili.png', 13, N'ინტერნეტი და ვებ ტექნოლოგიები ')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (4, N'დავით', N'გოჩავა', N'<p>
2016 წლიდან მუშაობს “Lemondo GAMES”-ში, პარალელურად, 2014 წლიდან, ივანე ჯავახიშვილის სახელობის თბილისის სახელწიფო უნივერსიტეტში ფილოსოფიის ფაკულტეტზე სწავლობს.

</p>
<p>
2014-2016 წწ. -  დეველოპერული კომპანია “მობიუს”-ის Lead Game Developer-ი.

</p>
<p>
2014 წ. -  თბილისის თავისუფალი უნივერსიტეტის (ESM) ბაკალავრი ბიზნესის ადმინისტრირების მიმართულებით, მეორადი სპეციალობა (minor) - მათემატიკა და კომპიუტერული მეცნიერებები (MACS).

</p>
', N'd.gochava@geolab.edu.ge', N'/Photos/Lecturers/davit-gochava.png', 23, N'ციფრული ლოგიკა')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (5, N'თამარ', N'კაპანაძე', N'<p>
მუშაობს მიკროსაფინანსო ორგანიზაციაში “ბონაკო” და საქართველოს საზოგადოებრივ ინსტიტუტში (GIPA).

</p>
<p>
2013-2015 წწ. NET დეველოპერი ელ. წიგნების სახლში “საბა” და ინფორმაციული ტექნოლოგიების კოლეჯ “მზიური”-ის მასწავლებლი.
</p>
<p>
2014 წელს, როგორც ჯგუფ ურბანპედიას წევრმა, ჰაკათონზე საპრიზო ადგილი დაიკავა.

</p>
<p>
გავლილი აქვს უკრაინული კომპანია “Skill Up”-ის ტრენინგი iOS-ში.
</p>
<p>
ივანე ჯავახიშვილის სახელობის თბილისის სახელმწიფო უნივერსიტეტის მაგისტრანტი.

</p>
<p>
უყვარს პროგრამირება და ჩართულია არაერთ პროექტში.

</p>
', N't.kapanadze@geolab.edu.ge', N'/Photos/Lecturers/tamar-kapanadze.png', 14, N'მობილური პროგრამირება ')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (6, N'ირაკლი', N'ღარიბაშვილი', N'<p>
2002 წლიდან მუშაობს კომპიუტერული გრაფიკის, ძირითადად, კომერციული და არქიტექტურული ვიზუალიზაციის სფეროში.
</p><p>
მონაწილეობს არქიტექტურულ კონკურსებში, მაგალითად - <a href=" https://www.behance.net/gallery/20296317/Mirza-Shafi-Old-Tbilisi-Emanation-2008" target="_blank">“2009 ტიფლისი - ძველი ქალაქის გაბრწყინება”. </a> 
</p>
<p>2004 წ. <a href="http://iraklisan.deviantart.com/art/Garikula-quot-Center-for-the-Arts-quot-198779764"  target="_blank">"გარიყულა - ხელოვნების ცენტრი"</a>.  ვენეცია მე-9 არქიტექტურული ბიენალე „Metamorph“ .
</p>

<p>
2013 წელს დააარსა კომპანია “ქუბიტსი” (QuBiTz), რომელიც გრაფიკული ვიზუალიზაციის, ანიმაციისა და ვიდეო თამაშების სფეროში საქმიანობს. კომპანია აქტიურად თანამშრომლობს როგორც ქართულ, ისე უცხოურ კომპანიებთან. ეს კომპანიებია: “UNICARD”, “GPI Holding”, “SIM”, Windfor’s”, “ABK”, “Betterfly\DDB”, “StadyLogic”, “Streaming Tutors”, “Brand New Pixels” და ა.შ.

</p>
', N'i.gharibashvili@geolab.edu.ge', N'/Photos/Lecturers/irakli-garibashvili.png', 7, N'3D დიზაინი ')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (7, N'ლევან', N'ასათიანი', N'<p>
2004 წლიდან მუშაობს ვიზუალური კომუნიკაციის (ილუსტრაცია, გრაფიკული დიზაინი, ვებდიზაინი) მიმართულებით.

</p>
<p>
2010 წ. მეგობრებთან ერთად დააარსა ონლაინ ჟურნალი “WAS”, რომლის არტ დირექტორიც არის დღემდე.

</p>
<p>
2011 წლიდან ლექციებს კითხულობს საქართველოს სხვადასხვა უნივერსიტეტში: “CSB”, “UG”, “GIPA”.

</p>
<p>
ვიზუალური კომუნიკაციის მიმართულებით სხვადასხვა კომპანიასთნ თანამშრომლობდა: ”საქართველოს ბანკი”, ჟურნალი “ტაბულა”, “ჟურნალი “ლიბერალი”, კაზინო “აჭარა”, “თელიანი ველი” და სხვა.

</p>
<p>პროექტები:
</p><p>
განხორციელებული აქვს პროექტები, როგორც პრინტ დიზაინში (ჟურნალი “ანაბეჭდი”, ჟურნალი “MODI TO GEORGIA”, ესტონური ჟურნალი “Look” და ა.შ.), ასევე ვებდიზაინის მიმართულებითაც (“Europe House”, სტუდია “მონიტორი”, თბილისის სახელმწიფო უნივერსიტეტის ვებგვერდი).

</p>
', N'l.asatiani@geolab.edu.ge', N'/Photos/Lecturers/levan-asatiani.png', 1, N'პოლიგრაფიული დიზაინი')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (8, N'ლევან', N'მელიქიშვილი', N'<p>
2009-2015 წწ. - ვებ დეველოპერი კომპანიაში - “ლივინგსტონი”.

</p>
<p>
ხარისხიანი ვებპროდუქტები აქვს შექმნილი არაერთი ქართული კომპანიისთვის. მათ შორის გამორჩეულია: <a href="http://wissol.ge/"  target="_blank">„wissol.ge“ </a> და <a href="http://support.geocell.ge/front/index.php/web_client"  target="_blank">„support.geocell.ge“</a>.

</p>
<p>
ივანე ჯავახიშვილის სახელობის თბილისის სახელწიფო უნივერსიტეტის ბაკალავრი.
ლევანს განსაკუთრებით მოსწონს ვებპროგრამირება და ყველაფერი, რაც მასთანაა დაკავშირებული. თვლის, რომ ვებს შეუძლია ჩვენი ცხოვრება უკეთესობისკენ შეცვალოს და მისი სრულყოფის პროცესი არასდროს დამთავრდება.

</p>', N'l.melikishvili@geolab.edu.ge', N'/Photos/Lecturers/levan-melikishvili.png', 11, N'ვებ პროგრამირება - PHP ')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (9, N'მარი', N'მელიქიშვილი', N'<p>
2015 წლიდან - ნიუტონის თავისუფალ სკოლაში პროგრამირების მასწავლებელი. 

</p>
<p>
2016 წ. ლექციებს კითხულობდა საქართველოს საზოგადოებრივ საქმეთა ინსტიტუტში (GIPA). ასევე, გააჩნია პედაგოგად მუშაობის რამდენიმეწლიანი გამოცდილება.

</p>
<p>
2015 წ. გაიარა უკრაინული კომპანია “Skill Up”-ის მიერ ორგანიზებული ტრენინგი iOS-ში.

</p>
<p>
ივაჯე ჯავახიშვილის სახელობის თბილისის სახელწიფო უნივერსიტეტის ბაკალავრი.

</p>
<p>
პროექტები:</p>


<p>1. <a href="https://itunes.apple.com/us/app/geolari/id1018841831?mt=8"  target="_blank">GeoLari</a></p> 
', N'm.melikishvili@geolab.edu.ge', N'/Photos/Lecturers/mari-melikishvili.png', 14, N'მობილური პროგრამირება ')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (10, N'მარინა', N'ბალავაძე', N'<p>
ჟურნალის “Forbeswoman” არტ-დირექტორ\დიზაინერი.

</p>
<p>
2002-2005 წწ. - კომპანიაში “Calamus Graphic Studio” არაერთი წიგნის, პლაკატის, ლოგოს, ბროშურისა და სხვა გრაფიკული ნამუშევრების დიზაინერი.

</p>
<p>
მუშაობის მრავალწლიანი გამოცდილება აქვს საქართველოში გამოცემულ ცნობილ ჟურნალებში: ”Cosmopolitan”, “Science & Vie Junior”, “National Geographic” და “Forbeslife”.

</p>
<p>
თბილისის სახელმწიფო სამხატვრო აკადემიის კომპიუტერული გრაფიკის ფაკულტეტის ბაკალავრი.

</p>', N'm.balavadze@geolab.edu.ge', N'/Photos/Lecturers/marina-balavadze.png', 5, N'გრაფიკულ რედაქტორებთან მუშაობა 
(Photoshop, Illustrator)')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (11, N'ნიკოლოზ', N'ასტამიძე', N'
<p>
სწავლობს საქართველოს საპატრიარქოს წმინდა ანდრია პირველწოდებულის სახელობის ქართულ უნივერსიტეტში ინფორმატიკის, მათემატიკისა და საბუნებისმეტყველო მეცნიერებების ფაკულტეტზე.

</p>
<p>
აქვს ბლოგი, სადაც განთავსებულია სტატიები თანამედროვე და მომავლის ტექნოლოგიებზე.

</p>
<p>
2012 წ. ელ. წიგნების სახლში “საბა”, ვებდეველოპერი.

</p>
<p>
გააჩნია პედაგოგიური გამოცდილება და ჩატარებული აქვს სოციალური მედიის ტრენინგები.

</p>
<p>
ვებდეველოპერი კომპანიებში “Octappus Studio” და “Nextep”.

</p>
<p>
მუშაობდა აუდიტორიების სამართავ ელექტრონულ პლატფორმაზე საქართველოს საპატრიარქოს წმინდა ანდრია პირველწოდებულის სახელობის ქართული უნივერსიტეტისათვის.

</p>
<p>
საქართველოს ინოვაციებისა და ტექნოლოგიების სააგენტოს მიწვევით, ლექციათა კურსი ჩაატარა თემაზე „თამაშების შექმნა Unity-ში“, ქალაქ გორის ინოვაციების ლაბორატორიაში.

</p>
<p>
ჩატარებული აქვს ტრენინგები თემაზე “მომავლის ტექნოლოგიები” და “როგორ ვმართოთ ბლოგი” ბანაკ “EGMA Camp”-ში, ბაკურიანსა და წყალტუბოში.
</p>
<p>
პროექტები:
</p>
<p>
მუშაობდა განათლების სამინისტროსა და  კომპანია „Microsoft“-ის პროექტზე, რომლის ფარგლებშიც შეიქმნა ინტერაქციული თამაშები დაწყებითი კლასებისთვის.
</p>

<p>
მისი ბოლო პროექტებია:

</p>

<p>
<a href="https://play.google.com/store/apps/details?id=ge.geolab.spacex"  target="_blank">Space X</a>
</p>

<p>
<a href="https://play.google.com/store/apps/details?id=com.Geolab.interactiveBook"  target="_blank">Sort And Recycle</a>

</p>

', N'n.astamidze@geolab.edu.ge', N'/Photos/Lecturers/nikoloz-astamidze.png', 3, N'შესავალი პროგრამირებაში ')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (14, N'პავლე', N'ტაბატაძე', N'<p>
სწავლობს წმინდა ანდრია პირველწოდებულის სახელობის ქართულ უნივერსიტეტში, ინფორმატიკის, მათემატიკისა და საბუნებისმეტყველო მეცნიერებების ფაკულტეტზე.
</p>
<p>
აქვს ბლოგი, სადაც განთავსებულია სტატიები თანამედროვე და მომავლის ტექნოლოგიებზე.

</p>
<p>
ჩატარებული აქვს: ტრენინგები თემებზე - „მომავლის ტექნოლოგიები“, „როგორ შევქმნათ და ვმართოთ ბლოგი“ ბანაკში „EGMA Camp“;  ტრენინგები სოციალური მედიის მიმართულებით და სამოქალაქო განათლების საკითხებზე. ასევე, ლექციათა კურსი თემაზე „როგორ შევქმნათ თამაში Unity-ში“.

</p>
<p>
მუშაობდა კომპანიებში:  „Octappus Studio”, „Nextep” და ელ. წიგნების სახლში „საბა“. ასევე, აუდიტორიების სამართავ ელექტრონულ პლატფორმაზე წმ. ანდრია პირველწოდებულის სახელობის ქართულ უნივერსიტეტში. პროგრამულად და ტექნიკურად უზრუნველყო კომპანია „ლივინგსტონის“ მიერ შექმნილი ინტერაქციული სტენდი და ე.წ. „ჯეოსელის ქუდები“.

</p>
<p>
„Game Jam Tbilisi 2015“ - ის გამარჯვებული.

</p>
<p>
პროექტები:

</p>
<p>1. ინტერაქციული წიგნები დაწყებითი კლასების მოსწავლეებისთვის;
</p>
<p>2. ინტერაქციული თამაშები დაწყებითი კლასების მოსწავლეებისთვის.
</p>
<p>3. <a href="https://play.google.com/store/apps/details?id=ge.geolab.spacex"  target="_blank">Space X</a></p>
<p>4. <a href="https://play.google.com/store/apps/details?id=com.Geolab.interactiveBook"  target="_blank">Sort And Recycle</a></p>

', N'p.tabatadze@geolab.edu.ge', N'/Photos/Lecturers/pavle-tabatadze.png', 3, N'შესავალი პროგრამირებაში ')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (15, N'სანდრო', N'ასათიანი', N'<p>“ჯეოლაბ”-ის ერთ-ერთი დამფუძნებელი.</p>
<p>2013 წლიდან დღემდე - საქართველოს საზოგადოებრივ საქმეთა ინსტიტუტი (GIPA) ასისტენტ-პროფესორი.</p>
<p>2009 წლიდან - კითხულობს ლექციებს საქართველოს სხვადასხვა უმაღლეს სახელწიფო თუ კერძო სასწავლებელში: ილიას სახელმწიფო უნივერსიტეტი, საქართველოს საზოგადოებრივ საქმეთა ინსტიტუტი (GIPA), კავკასიის უნივერსიტეტი (CU).</p>
<p>პირველი ქართულენოვანი სოციალური მედიის სახელძღვანელოს ავტორი და ასევე, თანაავტორი წიგნებისა: ”ახალი მედია ჟურნალისტებისათვის”, “ვიდეო ადვოკატირება” და სხვა. წერს სტატიებს სხვადასხვა გამოცემისათვის.</p>
<p>პროექტები:</p>
<p><a href="http://saba.com.ge/" target="_blank">saba.com.ge</a>, <a href="https://cybergala.me/" target="_blank">cybegala.me</a>, <a href="http://kavshirebi.ge/" target="_blank">kavshirebi.ge</a> და სხვა.</p>

', N's.asatiani@geolab.edu.ge', N'/Photos/Lecturers/sandro-asatiani.png', 2, N'ადამიანისა და კომპიუტერის ინტერაქცია ')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (16, N'შოთა', N'იორამაშვილი', N'<p>
კომპანია “ლივინგსტონ”-ის iOS დეველოპერი. 

</p>
<p>
2014-2016 წწ. - ვებ დეველოპერი ელ. წიგნების სახლში “საბა”.

</p>
<p>
2015 წ. ჩაატარა უკრაინული კომპანია “Skill Up”-ის მიერ ორგანიზებული ტრენინგი iOS-ში.

</p>
<p>
2014-2015 წწ. ასწავლიდა ინფორმაციული ტექნოლოგიების კოლეჯში “მზიური”.

</p>
<p>
2013-2015 წწ. - საქართველოს საზოგადოებრივ საქმეთა ინსტიტუტი, ვებ-დეველოპერი.
</p>
<p>
ივანე ჯავახიშვილის სახელობის თბილისის სახელწიფო უნივერსიტეტის ბაკალავრი.

</p>
<p>
პროექტები:

</p>

<p>1. <a href="https://itunes.apple.com/us/app/ipn/id1122925269?mt=8"  target="_blank"> IPN</a></p>
<p>2. <a href="https://itunes.apple.com/nz/app/radio-shokoladi/id1095214510?mt=8"  target="_blank">Radio Shokoladi</a></p>
<p>3. <a href="https://itunes.apple.com/us/app/geolari/id1018841831?mt=8"  target="_blank">GeoLari</a></p>
<p>4. <a href="https://cybergala.me/"  target="_blank">Cybergala</a></p>
<p>5. <a href="http://lucapolare.net/"  target="_blank">lukapolare</a></p>

', N'sh.ioramashvili@geolab.edu.ge', N'/Photos/Lecturers/shota-ioramashvili.png', 14, N'მობილური პროგრამირება ')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (17, N'ალექსი', N'ამნიაშვილი', N'
<p>
2012 წლიდან დღემდე - NET დეველოპერი ელ. წიგნების სახლში „საბა“.
</p>
<p>
2013-2015 წწ. - ინფორმაციული ტექნოლოგიების კოლეჯის - „მზიური“ მასწავლებელი.
</p>
<p>
ივანე ჯავახიშვილის სახელობის თბილისის სახელწიფო უნივერსიტეტის ბაკალავრი, კომპიუტერული მეცნიერებების მიმართულებით და ამავე სპეციალობის მაგისტრანტი. 
</p>
<p>
გავლილი აქვს უკრაინული ტრენინგ ცენტრის - “Skill Up” ტრენინგი „Front End“-ში.
</p>
<p>
გუნდთან ერთად მიღებული აქვს მონაწილეობა სამ ჰაკათონში. აქედან ერთ-ერთი იყო პროექტი <a href="http://challengepost.com/software/urbanpedia-3e10d"  target="_blank">"Urbanpedia"</a>, რომელშიც საპრიზო ადგილი დაიკავა. 
</p>
<p>
ჯგუფთან ერთად შესრულებული პროექტები : </p>

<p>1. <a href="http://volgasalon.ge/"  target="_blank">Volgasalon.ge</a></p>
<p>2. <a href="http://kavshirebi.ge/"  target="_blank">Kavshirebi.ge</a></p>
<p>3. <a href="http://lucapolare.net/"  target="_blank">Lucapolare.ge</a></p>
<p>4. <a href="https://cybergala.me/"  target="_blank">Cybergala.me</a></p>
<p>5. <a href="http://microsofttranslate.azurewebsites.net/"  target="_blank">Microsofttranslate.azurewebsites.net</a></p>

', N'a.amniashvili@geolab.edu.ge', N'/Photos/Lecturers/alexi-amniashvili.png', 9, N'შესავალი პროგრამირებაში და პროგრამირება C#')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (22, N'ანანო', N'ასპანიძე', N'<p>
2017 წლიდან მუშაობს საქართველოს საზოგადოებრივ საქმეთა ინსტიტუტში (GIPA) და ჯეოლაბში ლექტორად. </p>
<p>
2016 წლიდან ჯეოლაბში მუშაობს პროგრამისტად და ლექტორის ასისტენტად - ASP.NET.MVC კურსზე.
</p>
<p>
აქვს სხვადასხვა კომპანიაში გაყიდვების, მარკეტინგის, HR და ღონისძიებების მენეჯერად მუშაობის გამოცდილება. 
</p>

<p>
იგი მუშაობდა თარჯიმნად რუსულ, ინგლისურ და გერმანულ ენებზე.

</p>

<p>
ანანო არის ივანე ჯავახიშვილის სახელობის თბილისის სახელმწიფო უნივერსიტეტის ბიზნესისა და მართვის ფაკულტეტის ბაკალავრი საერთაშორისო ბიზნესის მიმართულებით. 
</p>

<p>
2015-2017 წლებში სწავლობდა საქართველოს საზოგადოებრივ საქმეთა ინსტიტუტში (GIPA), ახალი მედია ტექნოლოგიების ინჟინერიის სამაგისტრო პროგრამაზე. პროგრამირება მისი საყვარელი საქმიანობაა.

</p>', N'anano.aspanidze@geolab.edu.ge', N'/Photos/Team/anano-aspanidze.png', 12, N'ვებ პროგრამირება - ASP .NET MVC ')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (1022, N'ნინო', N'გელაშვილი', N'<p>
2010 წლიდან დღემდე - სოციალური მედიის ტრენერი. 

</p>
<p>
თბილისის სახელწიფო უნივერსიტეტის დოქტორანტია და მუშაობს თემაზე - “მონაცემების ვიზუალიზაცია ქართულ ონლაინ მედიაში”.

</p>
<p>
ადგილობრივ და საერთაშორისო მედიაში მუშაობის ათწლიანი გამოცდილება აქვს. ამასთან, რამდენიმე მედია კვლევის ავტორი და თანაავტორია.

</p>

<p>
გავლილი აქვს პროფესიული ტრენინგები როგორც საქართველოში, ისე საზღვარგარეთ.

</p>
<p>
მიიღო რამდენიმე სტიპენდია, მათ შორის, “ევროსაბჭოსა” და “ევროპარლამენტში” სტაჟირების გასავლელად, ასევე, კანის კინოფესტივალის გასაშუქებლად.

</p>

<p>
საქართველოს საზოგადოებრივ საქმეთა ინსტიტუტის (GIPA) მაგისტრი ჟურნალისტიკაში.

</p>
<p>
პროექტები:
</p>

<p>
მონაწილეობდა ვებპროექტებში: “ევროკავკასიური ახალი ამბები” და “კანის კინოფესტივალის ონლაინ გაშუქება”.

</p>', N'n.gelashvili@geolab.edu.ge', N'/Photos/Lecturers/nino-gelashvili.png', 19, N'სოციალური მედია მენეჯმენტი ')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (1024, N'ლიკა', N'მოშიაშვილი', N'<p>
ტექნოლოგიებისა და ინოვაციების სასწავლო ცენტრ “ჯეოლაბ”-ის პიარისა და კომუნიკაციის მენეჯერი და ლექტორი სოციალურ მედია მენეჯმენტსა და ციფრულ მარკეტინგში.

</p>
<p>
სადაზღვევო კომპანია “ალდაგი”-ს პიარის სპეციალისტი.

</p>
<p>
ლიკას, როგორც ჟურნალისტს, წამყვანსა და რედაქტორს ქართულ და უცხოურ მედია საშუალებებში მუშაობის მრავალწლიანი გამოცდილება აქვს.

</p>
<p>
ივანე ჯავახიშვილის სახელობის თბილისის სახელმწიფო უნივერსიტეტის სოციალურ და პოლიტიკურ მეცნიერებათა ფაკულტეტის ბაკალავრია. ჟურნალისტიკისა და მედიამენეჯმენტის მაგისტრის ხარისხი კი მიიღო საქართველოს საზოგადოებრივ საქმეთა ინსიტუტში (GIPA).

</p>

<p>
გავლილი აქვს პროფესიული ტრენინგები როგორც საქართველოში, ისე მის ფარგლებს გარეთ.

</p>

<p>
პროექტები:

</p>

<p>
ციფრული მარკეტინგის კომპანია - “Owl Group”-ის დამფუძნებელი.

</p>
', N'l.moshiashvili@geolab.edu.ge', N'/Photos/Lecturers/lika-moshiashvili.png', 19, N'სოციალური მედია მენეჯმენტი ')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (1026, N'კოკო', N'რაზმაძე', N'<p>
აქვს რამდენიმეწლიანი მუშაობის გამოცდილება. ასევე, კითხულობდა ლექციებს გრაფიკული და შრიფტის დიზაინის მიმართულებით.

</p>
<p>
გერმანიაში მიიღო საკომუნიკაციო დიზაინერის მაგისტრის ხარისხი. აქვე გაიარა პრაქტიკა კომპანიაში „Monotype”.

</p>
<p>
თბილისის სახელმწიფო სამხატვრო აკადემიის ბაკალავრი გრაფიკის განხრით.

</p>
<p>
პროექტები:

</p>
<p> <a href="http://razmadze.ge/
"  target="_blank">http://razmadze.ge/
</a></p>

<p><a href="https://www.behance.net/razmadze
"  target="_blank">https://www.behance.net/razmadze
</a></p>
<p> <a href="https://www.linotype.com/2075326/neue-helvetica-georgian-family.html
"  target="_blank">https://www.linotype.com/2075326/neue-helvetica-georgian-family.html
</a>
</p>', N'a_razmadze_f@geolab.edu.ge', N'/Photos/Lecturers/akaki-razmadze.png', 25, N'შრიფტის დიზაინის საფუძვლები და ფონტ-ინჟინერია')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (1034, N'ლანა', N'ლაბაძე', NULL, N'lana@geolab.edu.ge', N'/Photos/Team/lana-labadze.png', 1, N'პოლიგრაფიული დიზაინი')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (1035, N'თემურ', N'ეზუგბაია', N'


<p>
2005 წლიდან დღემდე მუშაობს სხვადასხვა სარეკლამო სტუდიაში.

</p>
<p>
სხვადასხვა პერიოდში მუშაობდა სტუდიებში: „TBC  TV“ და  „Stromboli“; აქვს ტელევიზიებში მუშაობის გამოცდილება: საზოგადოებრივი მაუწყებელი, „Artarea”.

</p>
<p>
შოთა რუსთაველის სახელობის თეატრალური ინსტიტუტის ბაკალავრი.

</p>
<p>
პროექტები:

</p>
<p>
<a href="https://www.youtube.com/watch?v=d8HG0OqkcZE" target="_blank">"პოპ-მოპედი"</a>, <a href="https://vimeo.com/42507082" target="_blank">"სელექტ2"</a>.
</p>
<p>
მუსიკალური ვიდეოები და სარეკლამო რგოლები:

</p>
<p> <a href="https://vimeo.com/32287677" target="_blank">Landmark - Northern Lights</a>, <a href="https://www.youtube.com/watch?v=tbCUeKx4Fc0&feature=youtu.be" target="_blank">Eko & Vinda Folio - Shen Anateb</a>, <a href="https://vimeo.com/87504010" target="_blank">Kolga Tbilisi Photo</a>.</p>
', N'temur.ezugbaia@geolab.edu.ge', N'/Photos/Lecturers/temur-ezugbaia.png', 26, N'ვიდეო გრაფიკა და მონტაჟი')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (1036, N'ანდრო', N'ბორცვაძე', N'<p>
2015 წლიდან დღემდე - ციფრული რეკლამის მენეჯერი კომპანიაში „ლივინგსტონი“.

</p>
<p>
2015 წლიდან - „Google“ - ის სერტიფიცირებული ედვერთაიზერი.
</p>
<p>
ილიას სახელმწიფო უნივერსიტეტის ბაკალავრი, ბიზნესის ადმინისტრირების მიმართულებით.

</p>', N'andro@geolab.edu.ge', N'/Photos/Lecturers/andro-bortsvadze.jpg', 27, N'Facebook Ads, Google AdWords, Google Analytics, SEO')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (1037, N'პავლე ', N'გაბრიჭიძე', N'<p>
2015 წლიდან არის „Google“-ის სერტიფიცირებული ედვერთაიზერი.

</p>
<p>
2014 წლიდან დღემდე -  კომპანიის „ლივინგსტონი“ ციფრული რეკლამის განყოფილების უფროსი.

</p>
<p>
2013-2014 - მარკეტინგის მენეჯერი მართვის საინფორმაციო სისტემების კომპანიაში „ოპტიმუსი“.

</p>
<p>
2011-2012 - კორპორატიული კლიენტების გაყიდვების წარმომადგენელი კომპანიაში „მობიფეი“.

</p>
<p>
2009-2010 - პიარ მენეჯერის ასისტენტი „თავისუფალ უნივერსიტეტში“.

</p>
<p>
თბილისის თავისუფალი უნივერსიტეტის ბაკალავრი, ბიზნესის ადმინისტრირების მიმართულებით.

</p>', N'pavle@geolab.edu.ge', N'/Photos/Lecturers/pavle-gabritchidze.jpg', 27, N'Facebook Ads, Google AdWords, Google Analytics, SEO')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (1222, N'ჯემო', N'მღებრიშვილი', N'<p>
2015 წლიდან მუშაობს კომპანიაში - ლივინგსტონი, ანდროიდ დეველოპერის პოზიციაზე. ჯეოლაბში არის ლექტორის ასისტენტი - მობილური პროგრამირება ANDROID (Java) კურსზე.
</p>
<p>
ჯემო არის ივანე ჯავახიშვილის სახელობის თბილისის სახელმწიფო უნივერსიტეტის სტუდენტი, კომპიუტერული მეცნიერებების სპეციალობით.

</p>

<p>
ჯეოლაბში გაიარა კურსი, ანდროიდის მიმართულებით.

</p>

<p>
მიღებული აქვს მონაწილეობა ბევრ პროექტში. გუნდთან ერთად, garage48-ის ჰაკათონზე მოიპოვა მეორე ადგილი პროექტით - <a href="http://garage48.org/blog/article-2" target="_blank">REHAPP.</a>
</p>
<p>
პროექტები:
<a href="https://goo.gl/HseHme" target="_blank">Movla App</a>, <a href="https://goo.gl/EkLG7l" target="_blank">iPrice Georgia</a>, <a href="https://goo.gl/oIuiSI" target="_blank">აცრები</a>, <a href="https://goo.gl/3JmUR2" target="_blank">Joker | ჯოკერი</a>, <a href="https://goo.gl/zNGzMn" target="_blank">AdBlackSea</a>, <a href="https://goo.gl/sRnhdo" target="_blank">Dags</a>.
</p>
', N'jemo.mgebrishvili@geolab.edu.ge', N'/Photos/AssistantLecturers/jemo-mgebrishvili.jpg', 16, N'Java ')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (1223, N'ნინი', N'თევდორაშვილი', N'
<p>
2016 წლიდან კომპანიაში Betterfly მუშაობს დიზაინერად. ჯეოლაბში არის ლექტორის ასისტენტი დიზაინის მიმართულებით. კითხულობს ლექციებს საქართველოს კერძო სასწავლებელში - IT Academy Step.
</p>
<p>
სხვადასხვა პროექტის ფარგლებში კითხულობს სოციალური მედია მენეჯმენტის ლექციებს.

</p>

<p>
ნინი არის საქართველოს ტექნიკური უნივერსიტეტის, ინფორმატიკისა და მართვის სისტემების ბაკალავრი.

</p>

<p>
2015 წელს ჯეოლაბში გაიარა ინტერფეისის დიზაინის კურსი.

</p>
<p>
პროექტები:

</p>
<p>
განხორციელებული აქვს სხვადასხვა პროექტი პოლიგრაფიული დიზაინისა და ინტერფეისის დიზაინის მიმართულებით: <a href="http://soplidan.ge/" target="_blank">soplidan.ge</a>, <a href="http://yid.geolab.club/" target="_blank">ახალგაზრდები ინოვაციური განვითარებისთვის</a>, <a href="http://www.devfest.ge/" target="_blank">DevFest </a> და ა.შ.

</p>
', N'nini.tevdorashvili@geolab.edu.ge', N'/Photos/AssistantLecturers/ninn-tevdorashvili.jpg', 1, N'პოლიგრაფიული დიზაინი')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (1224, N'ოთო', N'ალხანიშვილი', N'<p>
2016 წლიდან მუშაობს კომპანიაში - ლივინგსტონი მობილური აპლიკაციების სერვისების დეველოპერად. ჯეოლაბში არის ლექტორის ასისტენტი, PHP-ის კურსზე. 
</p>
<p>
ოთო არის ივანე ჯავახიშვილის სახელობის თბილისის სახელმწიფო უნივერსიტეტის ბაკალავრი, ელექტროინჟინერიის მიმართულებით. 
</p>

<p>
2015 წელს გაიარა ჯეოლაბის კურსები, სადაც პროფესიულად დაეუფლა პროგრამირებას.
</p>

<p>
მომავალი პროფესიის ძიების პროცესში, რამდენიმე კომპანიაში მუშაობდა სხვადასხვა პოზიციაზე. 
</p>
', N'otar.alhanishvili01@geolab.edu.ge', N'/Photos/AssistantLecturers/oto-alkhanishvili.jpg', 11, N'ვებ პროგრამირება - PHP ')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (1225, N'თემო', N'ფხალაძე', N'<p>
2016 წლიდან კომპანიაში Adjarabet მუშაობს, Front-end Developer-ის პოზიციაზე. ჯეოლაბში არის ლექტორის ასისტენტი, Front-End-ის კურსზე. 
</p>
<p>
ამავე მიმართულებით მუშაობდა კომპანიაში - ლივინგსტონი 2015-2016 წლებში. 
</p>
<p>
თემო არის საქართველოს ტექნიკური უნივერსიტეტის, საინფორმაციო ტექნოლოგიების ფაკულტეტის სტუდენტი.  
</p>

<p>
მან 2015 წელს ჯეოლაბში გაიარა PHP-ის კურსი.
</p>
<p>
მონაწილეობა აქვს მიღებული რამდენიმე ჰაკათონში. 

</p>

<p>
პროექტები: <a href="http://electionwarz.com/" target="_blank">electionwarz.com</a>, <a href="http://nebula.ge/" target="_blank">nebula.ge</a>, <a href="http://sport.adjara.com/" target="_blank">sport.adjara.com</a>, <a href="https://www.adjarabet.com/" target="_blank">adjarabet.com</a>.

</p>', N'temo@geolab.edu.ge', N'/Photos/AssistantLecturers/temo-pkhaladze.jpg', 8, N'ვებ პროგრამირება Front-End (HTML)')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (1295, N'გიორგი', N'ყავლაშვილი', N'<p>
2015 წელს ჯეოლაბში გაიარა 3D დიზაინის კურსი.
</p>
<p>
ამავე წლიდან მოღვაწეობს გრაფიკული ვიზუალიზაციის ანიმაციისა და ვიდეო თამაშების სფეროში.
</p>
', N'giorgi.kavlashvili01@geolab.edu.ge', N'/Photos/AssistantLecturers/giorgi-kavlashvili.png', 24, N'3D რედაქტორებთან მუშაობა (3D max, Maya 3D, Cinema 4D)')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (1424, N'მიხეილ', N'ქანთარია', N'<p><span style="font-weight: 400;">საეთაშორისო საჭადრაკო პორტალის &ldquo;Chess-News&rdquo;-ის ვებ-დეველოპერი;</span></p><p><span style="font-weight: 400;">ქართულ–გერმანული სამეცნიერო ხიდის &ldquo;FZ-Juelich&rdquo; ვებ–გვერდის პროგრამისტი;</span></p><p>&nbsp;</p><p><span style="font-weight: 400;">საერთაშორისო სუპერკომპიუტინგის კონფერენციების ორგანიზატორი კომპანია &ldquo;ISC Group&rdquo;-ის IT-მენეჯერი და პროგრამისტი</span></p><p>&nbsp;</p><p><span style="font-weight: 400;">ეკონომიკის დოქტორი, ინფორმატიკის მიმართულებით;</span></p><p><span style="font-weight: 400;">მოწვეული ლექტორი, კილის გამოყენებითი მეცნიერებების უნივერსიტეტი( გერმანია ) - Drupal დეველოპმენტის მიმართულებით;</span></p><p>&nbsp;</p><p><span style="font-weight: 400;">სტუ-ს სტუდენტური რადიო-პორტალის (BIT,&ldquo;START&ldquo;, Studmedia) შემქმნელი (2010-2014 წწ.)</span></p><p><span style="font-weight: 400;">&ldquo;Hackathon-2015, Tbilisi&rdquo; - პრიზიორი( II ადგილი ) ინოვაციური პროდუქტის &ldquo;Social Cube&rdquo;-ის ერთ-ერთი შემქმნელი ( cube.sky21.net );</span></p><p><span style="font-weight: 400;">&ldquo;Media-Hackathon 2017, Tbilisi&rdquo; - გამარჯვებული პროექტი (I ადგილი) ინოვაციური ვებ-აპლიკაციის შემქნელი &ldquo;MiXeR&rdquo;.</span></p>', N'm.kantaria@geolab.edu.ge', N'/Photos/Lecturers/mikheil-kantaria.jpg', 34, N'Drupal')
INSERT [dbo].[Lecture] ([ID], [FirstName], [LastName], [UserBio], [UserMail], [UserPhoto], [UserSubject], [UserSubjectName]) VALUES (1425, N'გიორგი', N'ქოჩაკიძე', N'<p><span style="font-weight: 400;">2015 წლიდან დღემდე - კომპანია Lucy-ის თანადამფუძნებელი და Software Engineer;</span></p>
<p><span style="font-weight: 400;">.</span><span style="font-weight: 400;">კომპანია &bdquo;Azry&rdquo;-ის ვებ-დეველოპერი.კომპანია &bdquo;DDRC&rdquo;-ის embedded სისტემების დეველოპერი;</span></p>
<p><span style="font-weight: 400;">კომპანია &bdquo;Bank of Georgia&rdquo;-ის &nbsp;ანალიტიკოს-დეველოპერი.</span></p>
<p><span style="font-weight: 400;">მის მიერ განხორციელებული პროექტებია:</span></p>
<p><a href="https://www.tbilisimarathon.ge/"><span style="font-weight: 400;">TbilisiMarathon.ge</span></a></p>
<p><a href="http://franko.tv/"><span style="font-weight: 400;">Franko.ge</span></a></p>
<p><a href="https://kvlevebi.ge/"><span style="font-weight: 400;">Kvlevebi.ge</span></a></p>
<p><a href="https://montegudauri.com/"><span style="font-weight: 400;">Montegudauri.com</span></a></p>
<p><a href="http://gustav.ge/"><span style="font-weight: 400;">Gustav.ge</span></a></p>
<p><span style="font-weight: 400;">Unihack-ის ჰაკათონზე, პროექტით - &ldquo;Rooms&rdquo; მეოთხე ადგილი დაიკავა. </span></p>
<p><span style="font-weight: 400;">Newton free School-ის - ინფორმატიკის მასწავლებელი;</span></p>
<p><span style="font-weight: 400;">თბილისის თავისუფალი უნივერსიტეტის ბაკალავრი, მათემატიკისა და კომპიუტერული მეცნიერებების მიმართულებით.</span></p>', N'g.kochakidze@geolab.edu.ge', N'/Photos/Lecturers/giorgi-kochakidze.jpg', 35, N'Meanlab')
SET IDENTITY_INSERT [dbo].[LessonQuiz] ON 

INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (1, 8, N'<p>fff</p>', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (2, 13, N'<p>პოლიგრაფიული დიზაინი</p>', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (3, 8, N'<p>sssss</p>', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (4, 8, N'<p>sssss</p>', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (5, 8, N'<p>asdasd</p>', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (6, 8, N'<p>asdasd</p>', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (7, 14, N'<p>ადამიანისა და კომპიუტერის ინტერაქცია&nbsp;</p>', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (8, 14, N'<p>ადამიანისა და კომპიუტერის ინტერაქცია&nbsp;</p>', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (9, 8, N'<p>sss</p>', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (10, 8, N'<p>Cannot add an entity with a key that is already in use.</p>', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (11, 8, N'<p>Cannot add an entity with a key that is already in use.</p>', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (12, 16, N'<p>ფრონტენდიფრონტენდი</p>', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (13, 16, N'<p>ფრონტენდი</p>', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (14, 8, N'<p>ფრონტენდი</p>', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (15, 8, N'<p>ფრონტენდი</p>', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (1014, 10, N'<p>kitxva</p>', CAST(N'2018-05-20' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (1015, 10, N'<p>kitxva</p>', CAST(N'2018-05-20' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (1016, 10, N'<p>kitxva</p>', CAST(N'2018-05-20' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (1017, 10, N'<p>kitxva</p>', CAST(N'2018-05-20' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (1018, 10, N'<p>adasd111</p>', CAST(N'2018-05-20' AS Date))
INSERT [dbo].[LessonQuiz] ([ID], [LessonId], [Question], [CreateDate]) VALUES (1019, 1013, N'<p>Swift შესავალი პირველი კითხვა</p>', CAST(N'2018-05-20' AS Date))
SET IDENTITY_INSERT [dbo].[LessonQuiz] OFF
SET IDENTITY_INSERT [dbo].[LessonQuizAnswers] ON 

INSERT [dbo].[LessonQuizAnswers] ([ID], [Answer], [Correct], [QuizId]) VALUES (0, N'1', N'N', 6)
INSERT [dbo].[LessonQuizAnswers] ([ID], [Answer], [Correct], [QuizId]) VALUES (1, N'ფრონტენდი', N'Y', 14)
INSERT [dbo].[LessonQuizAnswers] ([ID], [Answer], [Correct], [QuizId]) VALUES (2, N'ფრონტენდი', N'N', 15)
INSERT [dbo].[LessonQuizAnswers] ([ID], [Answer], [Correct], [QuizId]) VALUES (3, N'ფრონტენდი', N'Y', 15)
INSERT [dbo].[LessonQuizAnswers] ([ID], [Answer], [Correct], [QuizId]) VALUES (4, N'ფრონტენდი', N'N', 15)
SET IDENTITY_INSERT [dbo].[LessonQuizAnswers] OFF
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([ID], [LessonsTitel], [LessonsDesc], [LessonsVideoLink], [SubjectId], [CreateDate], [CodeType], [LessonsLvl]) VALUES (8, N'შესავალი პროგრამირებაში და პროგრამირება C#', N'<p>შესავალი პროგრამირებაში და პროგრამირება C#</p>', N'https://www.youtube.com/watch?v=t0IziCyyMaE', 9, CAST(N'2018-05-11' AS Date), 3, 2)
INSERT [dbo].[Lessons] ([ID], [LessonsTitel], [LessonsDesc], [LessonsVideoLink], [SubjectId], [CreateDate], [CodeType], [LessonsLvl]) VALUES (10, N'შესავალი პროგრამირებაში და პროგრამირება C#', N'<p>შესავალი პროგრამირებაში და პროგრამირება C#</p>', NULL, 9, CAST(N'2018-05-11' AS Date), 3, 0)
INSERT [dbo].[Lessons] ([ID], [LessonsTitel], [LessonsDesc], [LessonsVideoLink], [SubjectId], [CreateDate], [CodeType], [LessonsLvl]) VALUES (11, N'2', N'<p>2</p>', N'2', 9, CAST(N'2018-05-11' AS Date), NULL, 2)
INSERT [dbo].[Lessons] ([ID], [LessonsTitel], [LessonsDesc], [LessonsVideoLink], [SubjectId], [CreateDate], [CodeType], [LessonsLvl]) VALUES (12, N'ადამიანისა ', N'<p>ადამიანისა&nbsp;</p>', NULL, 2, CAST(N'2018-05-13' AS Date), NULL, 1)
INSERT [dbo].[Lessons] ([ID], [LessonsTitel], [LessonsDesc], [LessonsVideoLink], [SubjectId], [CreateDate], [CodeType], [LessonsLvl]) VALUES (13, N'პოლიგრაფიული დიზაინი', N'<p>პოლიგრაფიული დიზაინი</p>', NULL, 1, CAST(N'2018-05-13' AS Date), NULL, 0)
INSERT [dbo].[Lessons] ([ID], [LessonsTitel], [LessonsDesc], [LessonsVideoLink], [SubjectId], [CreateDate], [CodeType], [LessonsLvl]) VALUES (14, N'ადამიანისა და კომპიუტერის ინტერაქცია ', N'<p>ადამიანისა და კომპიუტერის ინტერაქცია&nbsp;</p>', NULL, 2, CAST(N'2018-05-13' AS Date), NULL, 0)
INSERT [dbo].[Lessons] ([ID], [LessonsTitel], [LessonsDesc], [LessonsVideoLink], [SubjectId], [CreateDate], [CodeType], [LessonsLvl]) VALUES (15, N'sss', N'<p>ss</p>', N'ss', 10, CAST(N'2018-05-13' AS Date), NULL, 0)
INSERT [dbo].[Lessons] ([ID], [LessonsTitel], [LessonsDesc], [LessonsVideoLink], [SubjectId], [CreateDate], [CodeType], [LessonsLvl]) VALUES (16, N'ფრონტენდი', N'<p>ფრონტენდი</p>', N'?????????', 10, CAST(N'2018-05-13' AS Date), NULL, 0)
INSERT [dbo].[Lessons] ([ID], [LessonsTitel], [LessonsDesc], [LessonsVideoLink], [SubjectId], [CreateDate], [CodeType], [LessonsLvl]) VALUES (17, N'ფრონტენდი', N'<p>ფრონტენდი</p>', N'?????????', 10, CAST(N'2018-05-13' AS Date), NULL, 0)
INSERT [dbo].[Lessons] ([ID], [LessonsTitel], [LessonsDesc], [LessonsVideoLink], [SubjectId], [CreateDate], [CodeType], [LessonsLvl]) VALUES (1013, N'Swift შესავალი', N'<p>Swift შესავალი</p>', NULL, 15, CAST(N'2018-05-20' AS Date), NULL, 1)
SET IDENTITY_INSERT [dbo].[Lessons] OFF
SET IDENTITY_INSERT [dbo].[LessonsCodeType] ON 

INSERT [dbo].[LessonsCodeType] ([ID], [SourceType], [source]) VALUES (1, N'HTML/CSS', NULL)
INSERT [dbo].[LessonsCodeType] ([ID], [SourceType], [source]) VALUES (2, N'PHP', NULL)
INSERT [dbo].[LessonsCodeType] ([ID], [SourceType], [source]) VALUES (3, N'C#', NULL)
SET IDENTITY_INSERT [dbo].[LessonsCodeType] OFF
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (1, N'პოლიგრაფიული დიზაინი', N'პოლიგრაფიული დიზაინი პოლიგრაფიული დიზაინი პოლიგრაფიული დიზაინი', NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (2, N'ადამიანისა და კომპიუტერის ინტერაქცია ', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (3, N'შესავალი პროგრამირებაში ', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (4, N'ინფორმაციის ვიზუალიზაცია ', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (5, N'გრაფიკულ რედაქტორებთან მუშაობა 
(Photoshop, Illustrator)', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (6, N'გრაფიკული დიზაინი ელექტრონული მოწყობილობებისათვის ', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (7, N'3D დიზაინი ', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (8, N'ვებპროგრამირება Front End (HTML)', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (9, N'შესავალი პროგრამირებაში და პროგრამირება C#', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (10, N'ფრონტენდი', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (11, N'ვებპროგრამირება - PHP ', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (12, N'ვებპროგრამირება - ASP .NET MVC ', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (13, N'ინტერნეტი და ვებ ტექნოლოგიები ', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (14, N'მობილური პროგრამირება ', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (15, N'Swift ', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (16, N'Java ', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (17, N'Unity 3D ', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (18, N'პროგრამირება C#', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (19, N'სოციალური მედია მენეჯმენტი ', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (20, N'ციფრული ლოგიკა', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (21, N'3D რედაქტორებთან მუშაობა (3D max, Maya 3D, Cinema 4D)', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (22, N'შრიფტის დიზაინის საფუძვლები და ფონტ-ინჟინერია', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (23, N'ციფრული ლოგიკა', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (24, N'3D რედაქტორებთან მუშაობა (3D max, Maya 3D, Cinema 4D)', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (25, N'შრიფტის დიზაინის საფუძვლები და ფონტ-ინჟინერია', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (26, N'ვიდეო გრაფიკა და მონტაჟი', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (27, N'Facebook Ads, Google AdWords, Google Analytics, SEO', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (28, N'შესავალი პროგრამირებაში', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (29, N'შესავალი პროგრამირებაში PHP-სთვის', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (30, N'ჯეოტონები', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (31, N'ციფრული რეალობა', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (32, N'პროგრამირება და ლოგიკა', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (33, N'Wordpress', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (34, N'Drupal', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (35, N'Meanlab', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (37, N'JavaScript', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [SubjectTitle], [SubjectDesc], [SubjectVideoLink]) VALUES (38, N'რელაციური მონაცემთა ბაზების დაპროექტება', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [FirstName], [LastName], [Email], [Status], [Password], [CreateDate]) VALUES (3013, N'fidofido21@mail.ru', N'fidofido21@mail.ru', N'fidofido21@mail.ru', N'fidofido21@mail.ru', N'A', N'202cb962ac59075b964b07152d234b70', CAST(N'2018-03-04' AS Date))
INSERT [dbo].[Users] ([ID], [UserName], [FirstName], [LastName], [Email], [Status], [Password], [CreateDate]) VALUES (4017, N'admin@gmail.com', N'fido', N'osiashvili', N'admin', N'A', N'202cb962ac59075b964b07152d234b70', CAST(N'2018-04-05' AS Date))
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:deleted', 7, NULL)
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded', 60, NULL)
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2019-01-04', 2, CAST(N'2019-02-04T15:07:26.160' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2019-01-04-15', 2, CAST(N'2019-01-05T15:07:26.160' AS DateTime))
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.CourseMigr', N'CreatedAt', N'2018-03-11T15:52:24.0099434Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.CourseMigr', N'Cron', N'0 0 2 * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.CourseMigr', N'Job', N'{"t":"Geo_Lab_Online.Models.Jobs, Geo_Lab_Online","m":"CourseMigr"}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.CourseMigr', N'LastExecution', N'2019-01-04T15:07:00.3521583Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.CourseMigr', N'LastJobId', N'3059', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.CourseMigr', N'NextExecution', N'2019-02-02T00:00:00.0000000Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.CourseMigr', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.CourseMigr', N'TimeZoneId', N'UTC', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.DirectionMigr', N'CreatedAt', N'2018-03-11T15:52:23.8775924Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.DirectionMigr', N'Cron', N'0 0 1 * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.DirectionMigr', N'Job', N'{"t":"Geo_Lab_Online.Models.Jobs, Geo_Lab_Online","m":"DirectionMigr"}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.DirectionMigr', N'LastExecution', N'2019-01-04T15:07:00.4385385Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.DirectionMigr', N'LastJobId', N'3060', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.DirectionMigr', N'NextExecution', N'2019-02-01T00:00:00.0000000Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.DirectionMigr', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.DirectionMigr', N'TimeZoneId', N'UTC', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.LectureMig', N'CreatedAt', N'2018-03-19T14:35:14.0622996Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.LectureMig', N'Cron', N'0 0 4 * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.LectureMig', N'Job', N'{"t":"Geo_Lab_Online.Models.Jobs, Geo_Lab_Online","m":"LectureMig"}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.LectureMig', N'LastExecution', N'2019-01-04T15:07:00.5010243Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.LectureMig', N'LastJobId', N'3061', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.LectureMig', N'NextExecution', N'2019-02-04T00:00:00.0000000Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.LectureMig', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.LectureMig', N'TimeZoneId', N'UTC', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.SubjectMigr', N'CreatedAt', N'2018-03-11T15:52:24.0500497Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.SubjectMigr', N'Cron', N'0 0 3 * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.SubjectMigr', N'Job', N'{"t":"Geo_Lab_Online.Models.Jobs, Geo_Lab_Online","m":"SubjectMigr"}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.SubjectMigr', N'LastExecution', N'2019-01-04T15:07:00.5873385Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.SubjectMigr', N'LastJobId', N'3062', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.SubjectMigr', N'NextExecution', N'2019-02-03T00:00:00.0000000Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.SubjectMigr', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Jobs.SubjectMigr', N'TimeZoneId', N'UTC', NULL)
SET IDENTITY_INSERT [HangFire].[Job] ON 

INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (3059, 4250, N'Succeeded', N'{"t":"Geo_Lab_Online.Models.Jobs, Geo_Lab_Online","m":"CourseMigr"}', N'', CAST(N'2019-01-04T15:07:00.360' AS DateTime), CAST(N'2019-01-05T15:07:26.160' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (3060, 4249, N'Succeeded', N'{"t":"Geo_Lab_Online.Models.Jobs, Geo_Lab_Online","m":"DirectionMigr"}', N'', CAST(N'2019-01-04T15:07:00.440' AS DateTime), CAST(N'2019-01-05T15:07:01.237' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (3061, 4290, N'Scheduled', N'{"t":"Geo_Lab_Online.Models.Jobs, Geo_Lab_Online","m":"LectureMig"}', N'', CAST(N'2019-01-04T15:07:00.500' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (3062, 4294, N'Scheduled', N'{"t":"Geo_Lab_Online.Models.Jobs, Geo_Lab_Online","m":"SubjectMigr"}', N'', CAST(N'2019-01-04T15:07:00.587' AS DateTime), NULL)
SET IDENTITY_INSERT [HangFire].[Job] OFF
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3059, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3059, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3059, N'RecurringJobId', N'"Jobs.CourseMigr"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3060, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3060, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3060, N'RecurringJobId', N'"Jobs.DirectionMigr"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3061, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3061, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3061, N'RecurringJobId', N'"Jobs.LectureMig"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3061, N'RetryCount', N'6')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3062, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3062, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3062, N'RecurringJobId', N'"Jobs.SubjectMigr"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3062, N'RetryCount', N'6')
INSERT [HangFire].[Schema] ([Version]) VALUES (6)
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'desktop-hluj0il:14652:d94089c6-9ca8-49a7-af9a-2302c86061e9', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2019-01-04T15:06:39.6368646Z"}', CAST(N'2019-01-04T15:29:54.090' AS DateTime))
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 0, N'Jobs.CourseMigr', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 0, N'Jobs.DirectionMigr', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 0, N'Jobs.LectureMig', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 0, N'Jobs.SubjectMigr', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'retries', 0, N'3061', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'retries', 0, N'3062', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1546616076, N'3061', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1546616039, N'3062', NULL)
SET IDENTITY_INSERT [HangFire].[State] ON 

INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4241, 3059, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2019-01-04T15:07:00.393' AS DateTime), N'{"EnqueuedAt":"2019-01-04T15:07:00.3521583Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4243, 3059, N'Processing', NULL, CAST(N'2019-01-04T15:07:00.453' AS DateTime), N'{"StartedAt":"2019-01-04T15:07:00.4229173Z","ServerId":"desktop-hluj0il:14652:d94089c6-9ca8-49a7-af9a-2302c86061e9","WorkerId":"e9a90d0c-f79e-49bb-a920-646539c9f88e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4250, 3059, N'Succeeded', NULL, CAST(N'2019-01-04T15:07:26.160' AS DateTime), N'{"SucceededAt":"2019-01-04T15:07:26.1532100Z","PerformanceDuration":"25653","Latency":"125"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4242, 3060, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2019-01-04T15:07:00.453' AS DateTime), N'{"EnqueuedAt":"2019-01-04T15:07:00.4385385Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4244, 3060, N'Processing', NULL, CAST(N'2019-01-04T15:07:00.487' AS DateTime), N'{"StartedAt":"2019-01-04T15:07:00.4697807Z","ServerId":"desktop-hluj0il:14652:d94089c6-9ca8-49a7-af9a-2302c86061e9","WorkerId":"c94a2369-eb36-48cd-a7e8-7f0f9a308166"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4249, 3060, N'Succeeded', NULL, CAST(N'2019-01-04T15:07:01.230' AS DateTime), N'{"SucceededAt":"2019-01-04T15:07:01.2113374Z","PerformanceDuration":"702","Latency":"61"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4245, 3061, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2019-01-04T15:07:00.527' AS DateTime), N'{"EnqueuedAt":"2019-01-04T15:07:00.5010243Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4246, 3061, N'Processing', NULL, CAST(N'2019-01-04T15:07:00.580' AS DateTime), N'{"StartedAt":"2019-01-04T15:07:00.5433409Z","ServerId":"desktop-hluj0il:14652:d94089c6-9ca8-49a7-af9a-2302c86061e9","WorkerId":"3be14600-5a4e-40c8-a9e5-db16414737c1"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4253, 3061, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2019-01-04T15:07:28.050' AS DateTime), N'{"FailedAt":"2019-01-04T15:07:28.0362465Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"The null value cannot be assigned to a member with type System.Int32 which is a non-nullable value type.","ExceptionDetails":"System.InvalidOperationException: The null value cannot be assigned to a member with type System.Int32 which is a non-nullable value type.\r\n   at Read_<>f__AnonymousType8`8(ObjectMaterializer`1 )\r\n   at System.Data.Linq.SqlClient.ObjectReaderCompiler.ObjectReader`2.MoveNext()\r\n   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)\r\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\r\n   at Geo_Lab_Online.Models.Jobs.LectureMig() in C:\\geolab\\geolab-online-back-end\\GeolabOnline\\Geo_Lab_Online\\Models\\Jobs.cs:line 176"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4254, 3061, N'Scheduled', N'Retry attempt 1 of 10: The null value cannot be assigned to a member wit…', CAST(N'2019-01-04T15:07:28.050' AS DateTime), N'{"EnqueueAt":"2019-01-04T15:08:06.0490839Z","ScheduledAt":"2019-01-04T15:07:28.0490839Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4255, 3061, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2019-01-04T15:08:11.127' AS DateTime), N'{"EnqueuedAt":"2019-01-04T15:08:11.1208012Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4256, 3061, N'Processing', NULL, CAST(N'2019-01-04T15:08:11.177' AS DateTime), N'{"StartedAt":"2019-01-04T15:08:11.1697190Z","ServerId":"desktop-hluj0il:14652:d94089c6-9ca8-49a7-af9a-2302c86061e9","WorkerId":"3da84025-0b0f-4601-8ef1-7e6a295b87b9"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4259, 3061, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2019-01-04T15:08:14.303' AS DateTime), N'{"FailedAt":"2019-01-04T15:08:13.2614438Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"The null value cannot be assigned to a member with type System.Int32 which is a non-nullable value type.","ExceptionDetails":"System.InvalidOperationException: The null value cannot be assigned to a member with type System.Int32 which is a non-nullable value type.\r\n   at Read_<>f__AnonymousType8`8(ObjectMaterializer`1 )\r\n   at System.Data.Linq.SqlClient.ObjectReaderCompiler.ObjectReader`2.MoveNext()\r\n   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)\r\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\r\n   at Geo_Lab_Online.Models.Jobs.LectureMig() in C:\\geolab\\geolab-online-back-end\\GeolabOnline\\Geo_Lab_Online\\Models\\Jobs.cs:line 176"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4260, 3061, N'Scheduled', N'Retry attempt 2 of 10: The null value cannot be assigned to a member wit…', CAST(N'2019-01-04T15:08:14.303' AS DateTime), N'{"EnqueueAt":"2019-01-04T15:08:48.3041607Z","ScheduledAt":"2019-01-04T15:08:14.3041607Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4263, 3061, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2019-01-04T15:08:56.320' AS DateTime), N'{"EnqueuedAt":"2019-01-04T15:08:56.3142326Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4264, 3061, N'Processing', NULL, CAST(N'2019-01-04T15:08:56.353' AS DateTime), N'{"StartedAt":"2019-01-04T15:08:56.3402936Z","ServerId":"desktop-hluj0il:14652:d94089c6-9ca8-49a7-af9a-2302c86061e9","WorkerId":"e9a90d0c-f79e-49bb-a920-646539c9f88e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4266, 3061, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2019-01-04T15:10:50.360' AS DateTime), N'{"FailedAt":"2019-01-04T15:10:49.6713943Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"The null value cannot be assigned to a member with type System.Int32 which is a non-nullable value type.","ExceptionDetails":"System.InvalidOperationException: The null value cannot be assigned to a member with type System.Int32 which is a non-nullable value type.\r\n   at Read_<>f__AnonymousType8`8(ObjectMaterializer`1 )\r\n   at System.Data.Linq.SqlClient.ObjectReaderCompiler.ObjectReader`2.MoveNext()\r\n   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)\r\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\r\n   at Geo_Lab_Online.Models.Jobs.LectureMig() in C:\\geolab\\geolab-online-back-end\\GeolabOnline\\Geo_Lab_Online\\Models\\Jobs.cs:line 176"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4268, 3061, N'Scheduled', N'Retry attempt 3 of 10: The null value cannot be assigned to a member wit…', CAST(N'2019-01-04T15:10:50.360' AS DateTime), N'{"EnqueueAt":"2019-01-04T15:11:39.3590684Z","ScheduledAt":"2019-01-04T15:10:50.3590684Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4271, 3061, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2019-01-04T15:11:51.017' AS DateTime), N'{"EnqueuedAt":"2019-01-04T15:11:51.0064626Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4272, 3061, N'Processing', NULL, CAST(N'2019-01-04T15:11:51.050' AS DateTime), N'{"StartedAt":"2019-01-04T15:11:51.0392457Z","ServerId":"desktop-hluj0il:14652:d94089c6-9ca8-49a7-af9a-2302c86061e9","WorkerId":"e9a90d0c-f79e-49bb-a920-646539c9f88e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4273, 3061, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2019-01-04T15:11:53.457' AS DateTime), N'{"FailedAt":"2019-01-04T15:11:53.4438938Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"The null value cannot be assigned to a member with type System.Int32 which is a non-nullable value type.","ExceptionDetails":"System.InvalidOperationException: The null value cannot be assigned to a member with type System.Int32 which is a non-nullable value type.\r\n   at Read_<>f__AnonymousType8`8(ObjectMaterializer`1 )\r\n   at System.Data.Linq.SqlClient.ObjectReaderCompiler.ObjectReader`2.MoveNext()\r\n   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)\r\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\r\n   at Geo_Lab_Online.Models.Jobs.LectureMig() in C:\\geolab\\geolab-online-back-end\\GeolabOnline\\Geo_Lab_Online\\Models\\Jobs.cs:line 176"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4274, 3061, N'Scheduled', N'Retry attempt 4 of 10: The null value cannot be assigned to a member wit…', CAST(N'2019-01-04T15:11:53.457' AS DateTime), N'{"EnqueueAt":"2019-01-04T15:14:41.4566435Z","ScheduledAt":"2019-01-04T15:11:53.4566435Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4279, 3061, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2019-01-04T15:14:41.907' AS DateTime), N'{"EnqueuedAt":"2019-01-04T15:14:41.8997633Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4280, 3061, N'Processing', NULL, CAST(N'2019-01-04T15:14:41.930' AS DateTime), N'{"StartedAt":"2019-01-04T15:14:41.9259832Z","ServerId":"desktop-hluj0il:14652:d94089c6-9ca8-49a7-af9a-2302c86061e9","WorkerId":"e9a90d0c-f79e-49bb-a920-646539c9f88e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4281, 3061, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2019-01-04T15:15:42.270' AS DateTime), N'{"FailedAt":"2019-01-04T15:15:42.2573267Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"The null value cannot be assigned to a member with type System.Int32 which is a non-nullable value type.","ExceptionDetails":"System.InvalidOperationException: The null value cannot be assigned to a member with type System.Int32 which is a non-nullable value type.\r\n   at Read_<>f__AnonymousType8`8(ObjectMaterializer`1 )\r\n   at System.Data.Linq.SqlClient.ObjectReaderCompiler.ObjectReader`2.MoveNext()\r\n   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)\r\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\r\n   at Geo_Lab_Online.Models.Jobs.LectureMig() in C:\\geolab\\geolab-online-back-end\\GeolabOnline\\Geo_Lab_Online\\Models\\Jobs.cs:line 176"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4282, 3061, N'Scheduled', N'Retry attempt 5 of 10: The null value cannot be assigned to a member wit…', CAST(N'2019-01-04T15:15:42.270' AS DateTime), N'{"EnqueueAt":"2019-01-04T15:20:58.2687296Z","ScheduledAt":"2019-01-04T15:15:42.2687296Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4287, 3061, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2019-01-04T15:20:58.833' AS DateTime), N'{"EnqueuedAt":"2019-01-04T15:20:58.8272818Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4288, 3061, N'Processing', NULL, CAST(N'2019-01-04T15:20:58.883' AS DateTime), N'{"StartedAt":"2019-01-04T15:20:58.8693979Z","ServerId":"desktop-hluj0il:14652:d94089c6-9ca8-49a7-af9a-2302c86061e9","WorkerId":"e9a90d0c-f79e-49bb-a920-646539c9f88e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4289, 3061, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2019-01-04T15:21:02.043' AS DateTime), N'{"FailedAt":"2019-01-04T15:21:02.0148389Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"The null value cannot be assigned to a member with type System.Int32 which is a non-nullable value type.","ExceptionDetails":"System.InvalidOperationException: The null value cannot be assigned to a member with type System.Int32 which is a non-nullable value type.\r\n   at Read_<>f__AnonymousType8`8(ObjectMaterializer`1 )\r\n   at System.Data.Linq.SqlClient.ObjectReaderCompiler.ObjectReader`2.MoveNext()\r\n   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)\r\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\r\n   at Geo_Lab_Online.Models.Jobs.LectureMig() in C:\\geolab\\geolab-online-back-end\\GeolabOnline\\Geo_Lab_Online\\Models\\Jobs.cs:line 176"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4290, 3061, N'Scheduled', N'Retry attempt 6 of 10: The null value cannot be assigned to a member wit…', CAST(N'2019-01-04T15:21:02.043' AS DateTime), N'{"EnqueueAt":"2019-01-04T15:34:36.0435074Z","ScheduledAt":"2019-01-04T15:21:02.0435074Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4247, 3062, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2019-01-04T15:07:00.617' AS DateTime), N'{"EnqueuedAt":"2019-01-04T15:07:00.5873385Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4248, 3062, N'Processing', NULL, CAST(N'2019-01-04T15:07:00.660' AS DateTime), N'{"StartedAt":"2019-01-04T15:07:00.6393389Z","ServerId":"desktop-hluj0il:14652:d94089c6-9ca8-49a7-af9a-2302c86061e9","WorkerId":"927c4f16-b4f9-4add-a3a2-dcf2a244bd2f"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4251, 3062, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2019-01-04T15:07:26.153' AS DateTime), N'{"FailedAt":"2019-01-04T15:07:26.1147629Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Cannot insert the value NULL into column ''ID'', table ''GeoLabOnlinedb.dbo.Subject''; column does not allow nulls. INSERT fails.\r\nThe statement has been terminated.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Cannot insert the value NULL into column ''ID'', table ''GeoLabOnlinedb.dbo.Subject''; column does not allow nulls. INSERT fails.\r\nThe statement has been terminated.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.ExecuteReader()\r\n   at System.Data.Linq.SqlClient.SqlProvider.Execute(Expression query, QueryInfo queryInfo, IObjectReaderFactory factory, Object[] parentArgs, Object[] userArgs, ICompiledSubQuery[] subQueries, Object lastResult)\r\n   at System.Data.Linq.SqlClient.SqlProvider.ExecuteAll(Expression query, QueryInfo[] queryInfos, IObjectReaderFactory factory, Object[] userArguments, ICompiledSubQuery[] subQueries)\r\n   at System.Data.Linq.SqlClient.SqlProvider.System.Data.Linq.Provider.IProvider.Execute(Expression query)\r\n   at System.Data.Linq.ChangeDirector.StandardChangeDirector.DynamicInsert(TrackedObject item)\r\n   at System.Data.Linq.ChangeDirector.StandardChangeDirector.Insert(TrackedObject item)\r\n   at System.Data.Linq.ChangeProcessor.SubmitChanges(ConflictMode failureMode)\r\n   at System.Data.Linq.DataContext.SubmitChanges(ConflictMode failureMode)\r\n   at System.Data.Linq.DataContext.SubmitChanges()\r\n   at Geo_Lab_Online.Models.Jobs.SubjectMigr() in C:\\geolab\\geolab-online-back-end\\GeolabOnline\\Geo_Lab_Online\\Models\\Jobs.cs:line 141\r\nClientConnectionId:09d8ce16-cb5a-4a52-afbe-1d40a05d56e7\r\nError Number:515,State:2,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4252, 3062, N'Scheduled', N'Retry attempt 1 of 10: Cannot insert the value NULL into column ''ID'', ta…', CAST(N'2019-01-04T15:07:26.170' AS DateTime), N'{"EnqueueAt":"2019-01-04T15:08:07.1508815Z","ScheduledAt":"2019-01-04T15:07:26.1508815Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4257, 3062, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2019-01-04T15:08:11.187' AS DateTime), N'{"EnqueuedAt":"2019-01-04T15:08:11.1747053Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4258, 3062, N'Processing', NULL, CAST(N'2019-01-04T15:08:11.223' AS DateTime), N'{"StartedAt":"2019-01-04T15:08:11.2158918Z","ServerId":"desktop-hluj0il:14652:d94089c6-9ca8-49a7-af9a-2302c86061e9","WorkerId":"e9a90d0c-f79e-49bb-a920-646539c9f88e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4261, 3062, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2019-01-04T15:08:14.370' AS DateTime), N'{"FailedAt":"2019-01-04T15:08:14.3121170Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Cannot insert the value NULL into column ''ID'', table ''GeoLabOnlinedb.dbo.Subject''; column does not allow nulls. INSERT fails.\r\nThe statement has been terminated.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Cannot insert the value NULL into column ''ID'', table ''GeoLabOnlinedb.dbo.Subject''; column does not allow nulls. INSERT fails.\r\nThe statement has been terminated.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.ExecuteReader()\r\n   at System.Data.Linq.SqlClient.SqlProvider.Execute(Expression query, QueryInfo queryInfo, IObjectReaderFactory factory, Object[] parentArgs, Object[] userArgs, ICompiledSubQuery[] subQueries, Object lastResult)\r\n   at System.Data.Linq.SqlClient.SqlProvider.ExecuteAll(Expression query, QueryInfo[] queryInfos, IObjectReaderFactory factory, Object[] userArguments, ICompiledSubQuery[] subQueries)\r\n   at System.Data.Linq.SqlClient.SqlProvider.System.Data.Linq.Provider.IProvider.Execute(Expression query)\r\n   at System.Data.Linq.ChangeDirector.StandardChangeDirector.DynamicInsert(TrackedObject item)\r\n   at System.Data.Linq.ChangeDirector.StandardChangeDirector.Insert(TrackedObject item)\r\n   at System.Data.Linq.ChangeProcessor.SubmitChanges(ConflictMode failureMode)\r\n   at System.Data.Linq.DataContext.SubmitChanges(ConflictMode failureMode)\r\n   at System.Data.Linq.DataContext.SubmitChanges()\r\n   at Geo_Lab_Online.Models.Jobs.SubjectMigr() in C:\\geolab\\geolab-online-back-end\\GeolabOnline\\Geo_Lab_Online\\Models\\Jobs.cs:line 141\r\nClientConnectionId:09d8ce16-cb5a-4a52-afbe-1d40a05d56e7\r\nError Number:515,State:2,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4262, 3062, N'Scheduled', N'Retry attempt 2 of 10: Cannot insert the value NULL into column ''ID'', ta…', CAST(N'2019-01-04T15:08:14.370' AS DateTime), N'{"EnqueueAt":"2019-01-04T15:09:12.3684249Z","ScheduledAt":"2019-01-04T15:08:14.3684249Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4265, 3062, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2019-01-04T15:10:50.230' AS DateTime), N'{"EnqueuedAt":"2019-01-04T15:10:49.9769970Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4267, 3062, N'Processing', NULL, CAST(N'2019-01-04T15:10:50.737' AS DateTime), N'{"StartedAt":"2019-01-04T15:10:50.5317311Z","ServerId":"desktop-hluj0il:14652:d94089c6-9ca8-49a7-af9a-2302c86061e9","WorkerId":"c94a2369-eb36-48cd-a7e8-7f0f9a308166"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4269, 3062, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2019-01-04T15:10:56.187' AS DateTime), N'{"FailedAt":"2019-01-04T15:10:56.0469774Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Cannot insert the value NULL into column ''ID'', table ''GeoLabOnlinedb.dbo.Subject''; column does not allow nulls. INSERT fails.\r\nThe statement has been terminated.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Cannot insert the value NULL into column ''ID'', table ''GeoLabOnlinedb.dbo.Subject''; column does not allow nulls. INSERT fails.\r\nThe statement has been terminated.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.ExecuteReader()\r\n   at System.Data.Linq.SqlClient.SqlProvider.Execute(Expression query, QueryInfo queryInfo, IObjectReaderFactory factory, Object[] parentArgs, Object[] userArgs, ICompiledSubQuery[] subQueries, Object lastResult)\r\n   at System.Data.Linq.SqlClient.SqlProvider.ExecuteAll(Expression query, QueryInfo[] queryInfos, IObjectReaderFactory factory, Object[] userArguments, ICompiledSubQuery[] subQueries)\r\n   at System.Data.Linq.SqlClient.SqlProvider.System.Data.Linq.Provider.IProvider.Execute(Expression query)\r\n   at System.Data.Linq.ChangeDirector.StandardChangeDirector.DynamicInsert(TrackedObject item)\r\n   at System.Data.Linq.ChangeDirector.StandardChangeDirector.Insert(TrackedObject item)\r\n   at System.Data.Linq.ChangeProcessor.SubmitChanges(ConflictMode failureMode)\r\n   at System.Data.Linq.DataContext.SubmitChanges(ConflictMode failureMode)\r\n   at System.Data.Linq.DataContext.SubmitChanges()\r\n   at Geo_Lab_Online.Models.Jobs.SubjectMigr() in C:\\geolab\\geolab-online-back-end\\GeolabOnline\\Geo_Lab_Online\\Models\\Jobs.cs:line 141\r\nClientConnectionId:ed21e865-df8d-4ae6-a60c-22d0fdbc081b\r\nError Number:515,State:2,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4270, 3062, N'Scheduled', N'Retry attempt 3 of 10: Cannot insert the value NULL into column ''ID'', ta…', CAST(N'2019-01-04T15:10:56.187' AS DateTime), N'{"EnqueueAt":"2019-01-04T15:12:48.1865749Z","ScheduledAt":"2019-01-04T15:10:56.1865749Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4275, 3062, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2019-01-04T15:12:51.153' AS DateTime), N'{"EnqueuedAt":"2019-01-04T15:12:51.1378874Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4276, 3062, N'Processing', NULL, CAST(N'2019-01-04T15:12:51.253' AS DateTime), N'{"StartedAt":"2019-01-04T15:12:51.2365424Z","ServerId":"desktop-hluj0il:14652:d94089c6-9ca8-49a7-af9a-2302c86061e9","WorkerId":"e9a90d0c-f79e-49bb-a920-646539c9f88e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4277, 3062, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2019-01-04T15:13:56.710' AS DateTime), N'{"FailedAt":"2019-01-04T15:13:56.6831846Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Cannot insert the value NULL into column ''ID'', table ''GeoLabOnlinedb.dbo.Subject''; column does not allow nulls. INSERT fails.\r\nThe statement has been terminated.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Cannot insert the value NULL into column ''ID'', table ''GeoLabOnlinedb.dbo.Subject''; column does not allow nulls. INSERT fails.\r\nThe statement has been terminated.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.ExecuteReader()\r\n   at System.Data.Linq.SqlClient.SqlProvider.Execute(Expression query, QueryInfo queryInfo, IObjectReaderFactory factory, Object[] parentArgs, Object[] userArgs, ICompiledSubQuery[] subQueries, Object lastResult)\r\n   at System.Data.Linq.SqlClient.SqlProvider.ExecuteAll(Expression query, QueryInfo[] queryInfos, IObjectReaderFactory factory, Object[] userArguments, ICompiledSubQuery[] subQueries)\r\n   at System.Data.Linq.SqlClient.SqlProvider.System.Data.Linq.Provider.IProvider.Execute(Expression query)\r\n   at System.Data.Linq.ChangeDirector.StandardChangeDirector.DynamicInsert(TrackedObject item)\r\n   at System.Data.Linq.ChangeDirector.StandardChangeDirector.Insert(TrackedObject item)\r\n   at System.Data.Linq.ChangeProcessor.SubmitChanges(ConflictMode failureMode)\r\n   at System.Data.Linq.DataContext.SubmitChanges(ConflictMode failureMode)\r\n   at System.Data.Linq.DataContext.SubmitChanges()\r\n   at Geo_Lab_Online.Models.Jobs.SubjectMigr() in C:\\geolab\\geolab-online-back-end\\GeolabOnline\\Geo_Lab_Online\\Models\\Jobs.cs:line 141\r\nClientConnectionId:5409057f-b4a1-43f5-bf7c-470751b1bdaa\r\nError Number:515,State:2,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4278, 3062, N'Scheduled', N'Retry attempt 4 of 10: Cannot insert the value NULL into column ''ID'', ta…', CAST(N'2019-01-04T15:13:56.710' AS DateTime), N'{"EnqueueAt":"2019-01-04T15:17:16.7095654Z","ScheduledAt":"2019-01-04T15:13:56.7095654Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4283, 3062, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2019-01-04T15:17:28.383' AS DateTime), N'{"EnqueuedAt":"2019-01-04T15:17:28.3741301Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4284, 3062, N'Processing', NULL, CAST(N'2019-01-04T15:17:28.480' AS DateTime), N'{"StartedAt":"2019-01-04T15:17:28.4242105Z","ServerId":"desktop-hluj0il:14652:d94089c6-9ca8-49a7-af9a-2302c86061e9","WorkerId":"e9a90d0c-f79e-49bb-a920-646539c9f88e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4285, 3062, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2019-01-04T15:17:31.133' AS DateTime), N'{"FailedAt":"2019-01-04T15:17:31.1070357Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Cannot insert the value NULL into column ''ID'', table ''GeoLabOnlinedb.dbo.Subject''; column does not allow nulls. INSERT fails.\r\nThe statement has been terminated.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Cannot insert the value NULL into column ''ID'', table ''GeoLabOnlinedb.dbo.Subject''; column does not allow nulls. INSERT fails.\r\nThe statement has been terminated.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.ExecuteReader()\r\n   at System.Data.Linq.SqlClient.SqlProvider.Execute(Expression query, QueryInfo queryInfo, IObjectReaderFactory factory, Object[] parentArgs, Object[] userArgs, ICompiledSubQuery[] subQueries, Object lastResult)\r\n   at System.Data.Linq.SqlClient.SqlProvider.ExecuteAll(Expression query, QueryInfo[] queryInfos, IObjectReaderFactory factory, Object[] userArguments, ICompiledSubQuery[] subQueries)\r\n   at System.Data.Linq.SqlClient.SqlProvider.System.Data.Linq.Provider.IProvider.Execute(Expression query)\r\n   at System.Data.Linq.ChangeDirector.StandardChangeDirector.DynamicInsert(TrackedObject item)\r\n   at System.Data.Linq.ChangeDirector.StandardChangeDirector.Insert(TrackedObject item)\r\n   at System.Data.Linq.ChangeProcessor.SubmitChanges(ConflictMode failureMode)\r\n   at System.Data.Linq.DataContext.SubmitChanges(ConflictMode failureMode)\r\n   at System.Data.Linq.DataContext.SubmitChanges()\r\n   at Geo_Lab_Online.Models.Jobs.SubjectMigr() in C:\\geolab\\geolab-online-back-end\\GeolabOnline\\Geo_Lab_Online\\Models\\Jobs.cs:line 141\r\nClientConnectionId:5a0fa9b2-c0c0-4500-81b6-0fcea0ab0881\r\nError Number:515,State:2,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4286, 3062, N'Scheduled', N'Retry attempt 5 of 10: Cannot insert the value NULL into column ''ID'', ta…', CAST(N'2019-01-04T15:17:31.133' AS DateTime), N'{"EnqueueAt":"2019-01-04T15:22:52.1338704Z","ScheduledAt":"2019-01-04T15:17:31.1338704Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4291, 3062, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2019-01-04T15:22:59.097' AS DateTime), N'{"EnqueuedAt":"2019-01-04T15:22:59.0867336Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4292, 3062, N'Processing', NULL, CAST(N'2019-01-04T15:22:59.163' AS DateTime), N'{"StartedAt":"2019-01-04T15:22:59.1461848Z","ServerId":"desktop-hluj0il:14652:d94089c6-9ca8-49a7-af9a-2302c86061e9","WorkerId":"e9a90d0c-f79e-49bb-a920-646539c9f88e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4293, 3062, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2019-01-04T15:23:01.357' AS DateTime), N'{"FailedAt":"2019-01-04T15:23:01.3353828Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Cannot insert the value NULL into column ''ID'', table ''GeoLabOnlinedb.dbo.Subject''; column does not allow nulls. INSERT fails.\r\nThe statement has been terminated.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Cannot insert the value NULL into column ''ID'', table ''GeoLabOnlinedb.dbo.Subject''; column does not allow nulls. INSERT fails.\r\nThe statement has been terminated.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.ExecuteReader()\r\n   at System.Data.Linq.SqlClient.SqlProvider.Execute(Expression query, QueryInfo queryInfo, IObjectReaderFactory factory, Object[] parentArgs, Object[] userArgs, ICompiledSubQuery[] subQueries, Object lastResult)\r\n   at System.Data.Linq.SqlClient.SqlProvider.ExecuteAll(Expression query, QueryInfo[] queryInfos, IObjectReaderFactory factory, Object[] userArguments, ICompiledSubQuery[] subQueries)\r\n   at System.Data.Linq.SqlClient.SqlProvider.System.Data.Linq.Provider.IProvider.Execute(Expression query)\r\n   at System.Data.Linq.ChangeDirector.StandardChangeDirector.DynamicInsert(TrackedObject item)\r\n   at System.Data.Linq.ChangeDirector.StandardChangeDirector.Insert(TrackedObject item)\r\n   at System.Data.Linq.ChangeProcessor.SubmitChanges(ConflictMode failureMode)\r\n   at System.Data.Linq.DataContext.SubmitChanges(ConflictMode failureMode)\r\n   at System.Data.Linq.DataContext.SubmitChanges()\r\n   at Geo_Lab_Online.Models.Jobs.SubjectMigr() in C:\\geolab\\geolab-online-back-end\\GeolabOnline\\Geo_Lab_Online\\Models\\Jobs.cs:line 141\r\nClientConnectionId:09d8ce16-cb5a-4a52-afbe-1d40a05d56e7\r\nError Number:515,State:2,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4294, 3062, N'Scheduled', N'Retry attempt 6 of 10: Cannot insert the value NULL into column ''ID'', ta…', CAST(N'2019-01-04T15:23:01.357' AS DateTime), N'{"EnqueueAt":"2019-01-04T15:33:59.3555456Z","ScheduledAt":"2019-01-04T15:23:01.3555456Z"}')
SET IDENTITY_INSERT [HangFire].[State] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Users]    Script Date: 04/01/2019 19:30:01 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK_Users] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 04/01/2019 19:30:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 04/01/2019 19:30:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 04/01/2019 19:30:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[StateName]) 
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 04/01/2019 19:30:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 04/01/2019 19:30:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 04/01/2019 19:30:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 04/01/2019 19:30:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 04/01/2019 19:30:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Score] ASC
)
WHERE ([Score] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Program_Direction] FOREIGN KEY([DirectionId])
REFERENCES [dbo].[Direction] ([ID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Program_Direction]
GO
ALTER TABLE [dbo].[CourseSubject]  WITH CHECK ADD  CONSTRAINT [FK_CourseSubject_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([ID])
GO
ALTER TABLE [dbo].[CourseSubject] CHECK CONSTRAINT [FK_CourseSubject_Courses]
GO
ALTER TABLE [dbo].[CourseSubject]  WITH CHECK ADD  CONSTRAINT [FK_CourseSubject_Subject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[CourseSubject] CHECK CONSTRAINT [FK_CourseSubject_Subject]
GO
ALTER TABLE [dbo].[Lecture]  WITH CHECK ADD  CONSTRAINT [FK_Lecture_Subject] FOREIGN KEY([UserSubject])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[Lecture] CHECK CONSTRAINT [FK_Lecture_Subject]
GO
ALTER TABLE [dbo].[LessonQuiz]  WITH CHECK ADD  CONSTRAINT [FK_LessonQuiz_Lessons] FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lessons] ([ID])
GO
ALTER TABLE [dbo].[LessonQuiz] CHECK CONSTRAINT [FK_LessonQuiz_Lessons]
GO
ALTER TABLE [dbo].[LessonQuizAnswers]  WITH CHECK ADD  CONSTRAINT [FK_LessonQuizAnswers_LessonQuiz] FOREIGN KEY([QuizId])
REFERENCES [dbo].[LessonQuiz] ([ID])
GO
ALTER TABLE [dbo].[LessonQuizAnswers] CHECK CONSTRAINT [FK_LessonQuizAnswers_LessonQuiz]
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Courses] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_Courses]
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_LessonsCodeType] FOREIGN KEY([CodeType])
REFERENCES [dbo].[LessonsCodeType] ([ID])
GO
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_LessonsCodeType]
GO
ALTER TABLE [dbo].[Subject_Lecture]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Lecture_Lecture] FOREIGN KEY([LecturerID])
REFERENCES [dbo].[Lecture] ([ID])
GO
ALTER TABLE [dbo].[Subject_Lecture] CHECK CONSTRAINT [FK_Subject_Lecture_Lecture]
GO
ALTER TABLE [dbo].[Subject_Lecture]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Lecture_Subject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[Subject_Lecture] CHECK CONSTRAINT [FK_Subject_Lecture_Subject]
GO
ALTER TABLE [dbo].[UserCodes]  WITH CHECK ADD  CONSTRAINT [FK_UserCodes_Lessons] FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lessons] ([ID])
GO
ALTER TABLE [dbo].[UserCodes] CHECK CONSTRAINT [FK_UserCodes_Lessons]
GO
ALTER TABLE [dbo].[UserCodes]  WITH CHECK ADD  CONSTRAINT [FK_UserCodes_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserCodes] CHECK CONSTRAINT [FK_UserCodes_Users]
GO
ALTER TABLE [dbo].[UserCurse]  WITH CHECK ADD  CONSTRAINT [FK_UserCurse_Courses] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[UserCurse] CHECK CONSTRAINT [FK_UserCurse_Courses]
GO
ALTER TABLE [dbo].[UserCurse]  WITH CHECK ADD  CONSTRAINT [FK_UserCurse_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserCurse] CHECK CONSTRAINT [FK_UserCurse_Users]
GO
ALTER TABLE [dbo].[UserLessons]  WITH CHECK ADD  CONSTRAINT [FK_UserLessons_Lessons] FOREIGN KEY([LessonsId])
REFERENCES [dbo].[Lessons] ([ID])
GO
ALTER TABLE [dbo].[UserLessons] CHECK CONSTRAINT [FK_UserLessons_Lessons]
GO
ALTER TABLE [dbo].[UserLessons]  WITH CHECK ADD  CONSTRAINT [FK_UserLessons_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserLessons] CHECK CONSTRAINT [FK_UserLessons_Users]
GO
ALTER TABLE [dbo].[UserNotes]  WITH CHECK ADD  CONSTRAINT [FK_UserNotes_Lessons] FOREIGN KEY([LessonsId])
REFERENCES [dbo].[Lessons] ([ID])
GO
ALTER TABLE [dbo].[UserNotes] CHECK CONSTRAINT [FK_UserNotes_Lessons]
GO
ALTER TABLE [dbo].[UserNotes]  WITH CHECK ADD  CONSTRAINT [FK_UserNotes_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserNotes] CHECK CONSTRAINT [FK_UserNotes_Users]
GO
ALTER TABLE [dbo].[UserQuiz]  WITH CHECK ADD  CONSTRAINT [FK_UserQuiz_LessonQuiz] FOREIGN KEY([QuizId])
REFERENCES [dbo].[LessonQuiz] ([ID])
GO
ALTER TABLE [dbo].[UserQuiz] CHECK CONSTRAINT [FK_UserQuiz_LessonQuiz]
GO
ALTER TABLE [dbo].[UserQuiz]  WITH CHECK ADD  CONSTRAINT [FK_UserQuiz_LessonQuizAnswers] FOREIGN KEY([AnswerID])
REFERENCES [dbo].[LessonQuizAnswers] ([ID])
GO
ALTER TABLE [dbo].[UserQuiz] CHECK CONSTRAINT [FK_UserQuiz_LessonQuizAnswers]
GO
ALTER TABLE [dbo].[UserQuiz]  WITH CHECK ADD  CONSTRAINT [FK_UserQuiz_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserQuiz] CHECK CONSTRAINT [FK_UserQuiz_Users]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
USE [master]
GO
ALTER DATABASE [GeoLabOnlinedb] SET  READ_WRITE 
GO
