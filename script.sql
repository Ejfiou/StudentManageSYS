USE [master]
GO
/****** Object:  Database [MySchool]    Script Date: 2018/12/19 11:27:17 ******/
CREATE DATABASE [MySchool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MySchool', FILENAME = N'E:\SQL\MySchool.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MySchool_log', FILENAME = N'E:\SQL\MySchool_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MySchool] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MySchool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MySchool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MySchool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MySchool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MySchool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MySchool] SET ARITHABORT OFF 
GO
ALTER DATABASE [MySchool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MySchool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MySchool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MySchool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MySchool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MySchool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MySchool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MySchool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MySchool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MySchool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MySchool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MySchool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MySchool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MySchool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MySchool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MySchool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MySchool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MySchool] SET RECOVERY FULL 
GO
ALTER DATABASE [MySchool] SET  MULTI_USER 
GO
ALTER DATABASE [MySchool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MySchool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MySchool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MySchool] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MySchool] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MySchool', N'ON'
GO
USE [MySchool]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2018/12/19 11:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminGuid] [varchar](50) NOT NULL CONSTRAINT [DF_Admin_AdminGuid]  DEFAULT (newid()),
	[LoginId] [nvarchar](10) NOT NULL,
	[LoginPwd] [varchar](10) NOT NULL CONSTRAINT [DF_Admin_LoginPwd]  DEFAULT ((123)),
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Class]    Script Date: 2018/12/19 11:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Class](
	[ClassGuid] [varchar](50) NOT NULL CONSTRAINT [DF_Class_ClassGuid]  DEFAULT (newid()),
	[ClassName] [nvarchar](10) NOT NULL CONSTRAINT [DF_Class_ClassName]  DEFAULT (''),
	[GradeGuid] [varchar](50) NOT NULL CONSTRAINT [DF_Class_GradeGuid]  DEFAULT (''),
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 2018/12/19 11:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grade](
	[GradeGuid] [varchar](50) NOT NULL CONSTRAINT [DF_Grade_GradeGuid]  DEFAULT (newid()),
	[GradeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_Grade_GradeName]  DEFAULT (''),
	[GradeSeq] [int] NOT NULL CONSTRAINT [DF_Grade_GradeSeq]  DEFAULT ((1)),
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[GradeGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2018/12/19 11:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentGuid] [varchar](50) NOT NULL CONSTRAINT [DF_Student_StudentGuid]  DEFAULT (newid()),
	[LoginId] [nvarchar](10) NOT NULL CONSTRAINT [DF_Student_LoginId]  DEFAULT (''),
	[LoginPwd] [varchar](10) NOT NULL CONSTRAINT [DF_Student_LoginPwd]  DEFAULT (''),
	[UserStateId] [int] NOT NULL CONSTRAINT [DF_Student_UserStateId]  DEFAULT ((1)),
	[ClassGuid] [varchar](50) NOT NULL CONSTRAINT [DF_Student_ClassGuid]  DEFAULT (''),
	[StudentNO] [varchar](10) NOT NULL CONSTRAINT [DF_Student_StudentNO]  DEFAULT (''),
	[StudentName] [nvarchar](10) NOT NULL CONSTRAINT [DF_Student_StudentName]  DEFAULT (''),
	[Sex] [nvarchar](10) NOT NULL CONSTRAINT [DF_Student_Sex]  DEFAULT (N'男'),
	[Address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 2018/12/19 11:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectGUID] [varchar](50) NOT NULL,
	[SubjectName] [varchar](50) NOT NULL,
	[GradeGUID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 2018/12/19 11:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherGUID] [varchar](50) NOT NULL CONSTRAINT [DF_TeacherGUID]  DEFAULT (newid()),
	[LoginId] [varchar](50) NOT NULL,
	[LoginPwd] [varchar](50) NOT NULL,
	[UserStateId] [int] NOT NULL,
	[TeacherName] [varchar](50) NOT NULL,
	[Sex] [nvarchar](10) NULL,
	[Birthday] [datetime] NULL,
	[SubjectGUID] [varchar](50) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Admin] ([AdminGuid], [LoginId], [LoginPwd]) VALUES (N'0E9D6C04-A9E4-4971-80CF-782730500EA5', N'123', N'123')
INSERT [dbo].[Admin] ([AdminGuid], [LoginId], [LoginPwd]) VALUES (N'1d2f9c99-6184-4c3c-a23f-48427e22b077', N'123', N'123')
INSERT [dbo].[Admin] ([AdminGuid], [LoginId], [LoginPwd]) VALUES (N'5163a340-6f50-4709-87da-2c97e7d8ca95', N'很多时候', N'或多或少')
INSERT [dbo].[Admin] ([AdminGuid], [LoginId], [LoginPwd]) VALUES (N'578ad683-1989-4593-bc16-20d34bfdc9f3', N'row', N'123')
INSERT [dbo].[Admin] ([AdminGuid], [LoginId], [LoginPwd]) VALUES (N'70712774-3797-4f6f-9810-d53378e7aa7c', N'789q', N'111')
INSERT [dbo].[Admin] ([AdminGuid], [LoginId], [LoginPwd]) VALUES (N'78ceffa7-9f09-45cf-ae30-93beab9c09dc', N'789', N'123')
INSERT [dbo].[Admin] ([AdminGuid], [LoginId], [LoginPwd]) VALUES (N'87A3E87A-EC0C-475F-B74F-155E753FB2D4', N'tom', N'456')
INSERT [dbo].[Admin] ([AdminGuid], [LoginId], [LoginPwd]) VALUES (N'9041B129-EE59-47B2-B20D-09E3A3955354', N'jack', N'123')
INSERT [dbo].[Admin] ([AdminGuid], [LoginId], [LoginPwd]) VALUES (N'99cb7029-073a-4149-a104-a5ce3dc060f4', N'ttt', N'ttt')
INSERT [dbo].[Admin] ([AdminGuid], [LoginId], [LoginPwd]) VALUES (N'9f4f9845-0453-4426-a4be-f56ed944aa01', N'tomfds', N'123')
INSERT [dbo].[Admin] ([AdminGuid], [LoginId], [LoginPwd]) VALUES (N'd08b05f7-aae3-4261-8a4e-e425e2787da1', N'123', N'789')
INSERT [dbo].[Admin] ([AdminGuid], [LoginId], [LoginPwd]) VALUES (N'edd9f328-66fc-47a6-871b-36e6f7ffecb4', N'1234', N'1234')
INSERT [dbo].[Class] ([ClassGuid], [ClassName], [GradeGuid]) VALUES (N'50797101-EA4E-4A52-BFF9-1F12E09E4DD4', N'一班', N'B10AAD97-3B47-4231-9BAF-51C273AB3B7E')
INSERT [dbo].[Class] ([ClassGuid], [ClassName], [GradeGuid]) VALUES (N'BC84A4E8-0008-4074-9368-A0E64A3D437E', N'二班', N'877E32DD-3F28-46F2-B5A4-EE5BE9215995')
INSERT [dbo].[Grade] ([GradeGuid], [GradeName], [GradeSeq]) VALUES (N'877E32DD-3F28-46F2-B5A4-EE5BE9215995', N'语文', 50)
INSERT [dbo].[Grade] ([GradeGuid], [GradeName], [GradeSeq]) VALUES (N'B10AAD97-3B47-4231-9BAF-51C273AB3B7E', N'数学', 78)
INSERT [dbo].[Student] ([StudentGuid], [LoginId], [LoginPwd], [UserStateId], [ClassGuid], [StudentNO], [StudentName], [Sex], [Address]) VALUES (N'014605E8-D73E-496A-B071-5DB7CE898D35', N'王五', N'123', 1, N'BC84A4E8-0008-4074-9368-A0E64A3D437E', N'123456789', N'王五', N'男', N'7897897897看看')
INSERT [dbo].[Student] ([StudentGuid], [LoginId], [LoginPwd], [UserStateId], [ClassGuid], [StudentNO], [StudentName], [Sex], [Address]) VALUES (N'1213DC7E-5198-4391-B80A-BC9DF4A238EC', N'王五', N'123', 1, N'50797101-EA4E-4A52-BFF9-1F12E09E4DD4', N'123456789', N'王五', N'男', N'789789789')
INSERT [dbo].[Student] ([StudentGuid], [LoginId], [LoginPwd], [UserStateId], [ClassGuid], [StudentNO], [StudentName], [Sex], [Address]) VALUES (N'1885EBC6-FC1C-41E9-9445-E94598CFA30B', N'sdfsdsdfsd', N'sdfsdf', 1, N'50797101-EA4E-4A52-BFF9-1F12E09E4DD4', N'dfsfasdfdf', N'fsdf', N'男', N'fdsfsdfs')
INSERT [dbo].[Student] ([StudentGuid], [LoginId], [LoginPwd], [UserStateId], [ClassGuid], [StudentNO], [StudentName], [Sex], [Address]) VALUES (N'4EF43088-A0CC-4C0C-9422-D263CFED8C0B', N'ioio', N'io', 1, N'BC84A4E8-0008-4074-9368-A0E64A3D437E', N'io', N'io', N'男', N'fdf@bilibili')
INSERT [dbo].[Student] ([StudentGuid], [LoginId], [LoginPwd], [UserStateId], [ClassGuid], [StudentNO], [StudentName], [Sex], [Address]) VALUES (N'6016BC8A-21CC-43B3-AAAE-7AE75A3F8FF1', N'qwe', N'qwe', 1, N'BC84A4E8-0008-4074-9368-A0E64A3D437E', N'qwe', N'qwe', N'男', N'qwe')
INSERT [dbo].[Student] ([StudentGuid], [LoginId], [LoginPwd], [UserStateId], [ClassGuid], [StudentNO], [StudentName], [Sex], [Address]) VALUES (N'7EDDA3BD-D8B1-485C-AE25-04020C25EB91', N'789', N'789', 1, N'BC84A4E8-0008-4074-9368-A0E64A3D437E', N'789', N'789', N'男', N'78461')
INSERT [dbo].[Student] ([StudentGuid], [LoginId], [LoginPwd], [UserStateId], [ClassGuid], [StudentNO], [StudentName], [Sex], [Address]) VALUES (N'DF970466-F240-4456-B008-7561041858FC', N'admin', N'123', 1, N'50797101-EA4E-4A52-BFF9-1F12E09E4DD4', N'111111', N'小明', N'男', N'中国')
INSERT [dbo].[Student] ([StudentGuid], [LoginId], [LoginPwd], [UserStateId], [ClassGuid], [StudentNO], [StudentName], [Sex], [Address]) VALUES (N'F7C0D14C-2F5B-450C-AD62-5B683B57FCF5', N'李四', N'456789', 1, N'BC84A4E8-0008-4074-9368-A0E64A3D437E', N'456789', N'李四', N'男', N'数组')
INSERT [dbo].[Student] ([StudentGuid], [LoginId], [LoginPwd], [UserStateId], [ClassGuid], [StudentNO], [StudentName], [Sex], [Address]) VALUES (N'FFE01AAD-11A2-4C44-8F4E-B114FB8218A5', N'ioio', N'fdsfsd', 1, N'BC84A4E8-0008-4074-9368-A0E64A3D437E', N'io', N'io', N'男', N'fdf')
INSERT [dbo].[Subject] ([SubjectGUID], [SubjectName], [GradeGUID]) VALUES (N'8F4388C7-6B52-4FB8-B9A1-2647CFF30DB1', N'数据库', N'877E32DD-3F28-46F2-B5A4-EE5BE9215995')
INSERT [dbo].[Subject] ([SubjectGUID], [SubjectName], [GradeGUID]) VALUES (N'EE84E51E-7E1B-4A63-AF83-7D1215F2C0C4', N'C#', N'877E32DD-3F28-46F2-B5A4-EE5BE9215995')
INSERT [dbo].[Teacher] ([TeacherGUID], [LoginId], [LoginPwd], [UserStateId], [TeacherName], [Sex], [Birthday], [SubjectGUID]) VALUES (N'46FB1C6A-4646-4512-9E11-57F551FE0CDA', N'gfdgd', N'123', 1, N'hgfh', N'女', CAST(N'2212-12-02 00:00:00.000' AS DateTime), N'EE84E51E-7E1B-4A63-AF83-7D1215F2C0C4')
INSERT [dbo].[Teacher] ([TeacherGUID], [LoginId], [LoginPwd], [UserStateId], [TeacherName], [Sex], [Birthday], [SubjectGUID]) VALUES (N'684303dc-e7f2-48d4-8ade-330e635c66d7', N't002', N'12345', 1, N'zz', N'男', CAST(N'1995-06-06 00:00:00.000' AS DateTime), N'8F4388C7-6B52-4FB8-B9A1-2647CFF30DB1')
INSERT [dbo].[Teacher] ([TeacherGUID], [LoginId], [LoginPwd], [UserStateId], [TeacherName], [Sex], [Birthday], [SubjectGUID]) VALUES (N'7133082F-4812-44E7-A29F-FABFF60352FE', N'zs', N'123', 1, N'张三', N'男', CAST(N'1992-05-09 00:00:00.000' AS DateTime), N'EE84E51E-7E1B-4A63-AF83-7D1215F2C0C4')
INSERT [dbo].[Teacher] ([TeacherGUID], [LoginId], [LoginPwd], [UserStateId], [TeacherName], [Sex], [Birthday], [SubjectGUID]) VALUES (N'78660c2f-39cd-4391-b577-43bf7c3942b2', N'wangwu', N'12345', 1, N'王五', N'男', CAST(N'2010-06-23 11:35:53.000' AS DateTime), N'8F4388C7-6B52-4FB8-B9A1-2647CFF30DB1')
INSERT [dbo].[Teacher] ([TeacherGUID], [LoginId], [LoginPwd], [UserStateId], [TeacherName], [Sex], [Birthday], [SubjectGUID]) VALUES (N'a9ec45f7-9a63-42e5-a5b9-b75c1e85e34b', N't001', N'12345', 0, N'jj', NULL, CAST(N'2017-04-12 00:00:00.000' AS DateTime), NULL)
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Grade] FOREIGN KEY([GradeGuid])
REFERENCES [dbo].[Grade] ([GradeGuid])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Grade]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([ClassGuid])
REFERENCES [dbo].[Class] ([ClassGuid])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Grade] FOREIGN KEY([GradeGUID])
REFERENCES [dbo].[Grade] ([GradeGuid])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_Grade]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Subject] FOREIGN KEY([SubjectGUID])
REFERENCES [dbo].[Subject] ([SubjectGUID])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Subject]
GO
/****** Object:  StoredProcedure [dbo].[sp_delete]    Script Date: 2018/12/19 11:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_delete]
@StudentGuid varchar(50)
as
	delete  from Student where StudentGuid=@StudentGuid

GO
/****** Object:  StoredProcedure [dbo].[sp_SelectAll]    Script Date: 2018/12/19 11:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_SelectAll]--查询所有信息
@Sex nvarchar(10),
@ClassName nvarchar(10),
@StudentName nvarchar(50)
as
	select * from Student s inner join Class c on c.ClassGuid = s.ClassGuid where (LEN(@Sex)=0 or CHARINDEX(@Sex,Sex)>0) and (LEN(@ClassName)=0 or CHARINDEX(@ClassName,ClassName)>0 )and (LEN(@StudentName)=0 or CHARINDEX(@StudentName,StudentName)>0 )

GO
/****** Object:  StoredProcedure [dbo].[sp_selectByStuGuid]    Script Date: 2018/12/19 11:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_selectByStuGuid]--通过GUID查询学生信息(删除用)
@StudentGuid varchar(50)
as
	select * from Student s inner join Class c on c.ClassGuid = s.ClassGuid where StudentGuid=@StudentGuid

GO
/****** Object:  StoredProcedure [dbo].[sp_selectClassGuid]    Script Date: 2018/12/19 11:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_selectClassGuid]--查询班级编号
@className nvarchar(10)
as
	select ClassGuid from Class where ClassName=@className

GO
/****** Object:  StoredProcedure [dbo].[sp_selectClassName]    Script Date: 2018/12/19 11:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_selectClassName]--查询班级名
as
	select * from Class

GO
/****** Object:  StoredProcedure [dbo].[sp_selectOldPwd]    Script Date: 2018/12/19 11:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_selectOldPwd] --查询旧密码(改密码用)
@StudentGuid varchar(50)
as
	select LoginPwd from Student where StudentGuid=@StudentGuid

GO
/****** Object:  StoredProcedure [dbo].[sp_studentInsert]    Script Date: 2018/12/19 11:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_studentInsert]--增加学生
@StudentGuid varchar(50),
@LoginId nvarchar(10),
@LoginPwd varchar(10),
@UserStateId int,
@StudentNo varchar(10),
@StudentName nvarchar(10),
@Sex nvarchar(10),
@Address nvarchar(50),
@ClassGuid varchar(50)
as
	insert into Student (StudentGuid,LoginId,LoginPwd,UserStateId,StudentNo,StudentName,Sex,Address,ClassGuid) values (@StudentGuid,@LoginId,@LoginPwd,@UserStateId,@StudentNo,@StudentName,@Sex,@Address,@ClassGuid)

GO
/****** Object:  StoredProcedure [dbo].[sp_Update]    Script Date: 2018/12/19 11:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Update]--更新
@StudentGuid varchar(50),
@LoginId nvarchar(10),
@UserStateId int,
@StudentNo varchar(10),
@StudentName nvarchar(10),
@Sex nvarchar(10),
@Address nvarchar(50),
@ClassGuid varchar(50)
as
	update Student set LoginId=@LoginId,UserStateId=@UserStateId,StudentNo=@StudentNo,StudentName=@StudentName,Sex=@Sex,Address=@Address,ClassGuid=@ClassGuid where StudentGuid=@StudentGuid

GO
/****** Object:  StoredProcedure [dbo].[sp_updatePwd]    Script Date: 2018/12/19 11:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_updatePwd] --修改密码(改密码用)
@StudentGuid varchar(50),
@LoginPwd varchar(10)
as
	update Student set LoginPwd=@LoginPwd where StudentGuid=@StudentGuid

GO
USE [master]
GO
ALTER DATABASE [MySchool] SET  READ_WRITE 
GO
