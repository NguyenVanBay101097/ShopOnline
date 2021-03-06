USE [master]
GO
/****** Object:  Database [ShopOnline]    Script Date: 07/12/2018 16:10:01 ******/
CREATE DATABASE [ShopOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ShopOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ShopOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ShopOnline] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ShopOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopOnline] SET QUERY_STORE = OFF
GO
USE [ShopOnline]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ShopOnline]
GO
/****** Object:  User [TK0001]    Script Date: 07/12/2018 16:10:01 ******/
CREATE USER [TK0001] FOR LOGIN [TK0001] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[About]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[AboutID] [int] IDENTITY(1,1) NOT NULL,
	[AboutName] [nvarchar](50) NULL,
	[MetaTitle] [varchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [varchar](50) NOT NULL,
	[ModifiedDate] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__About__717FC95C3F96A226] PRIMARY KEY CLUSTERED 
(
	[AboutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Content]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ContentID] [int] IDENTITY(1,1) NOT NULL,
	[ContentName] [nvarchar](50) NULL,
	[MetaTitle] [varchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[NewsID] [int] NOT NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [varchar](50) NOT NULL,
	[ModifiedDate] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL,
	[Tophot] [datetime] NULL,
	[Viewcount] [int] NULL,
	[Tags] [varchar](500) NULL,
 CONSTRAINT [PK__Content__2907A87EF16AF779] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerAccount]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PassWord] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[GioiTinh] [varchar](50) NULL,
	[BirthDay] [datetime] NULL,
	[TelephoneNumber] [int] NOT NULL,
	[ConfirmPassWord] [varchar](50) NULL,
 CONSTRAINT [PK__TaiKhoan__A9D10535C589C2B8] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackName] [nvarchar](50) NULL,
	[Phone] [int] NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[Content] [nvarchar](500) NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NOT NULL,
	[Link] [nvarchar](250) NOT NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
	[MenuTypeID] [int] NOT NULL,
 CONSTRAINT [PK__Menu__C99ED2501B089D25] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[MenuTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[NewsName] [nvarchar](50) NULL,
	[MetaTitle] [varchar](50) NULL,
	[ParentNewsID] [int] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTittle] [nvarchar](250) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [varchar](50) NOT NULL,
	[ModifiedDate] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK__News__19093A2B3BEF4975] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CreateDay] [datetime] NULL,
	[CustomerID] [int] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipPhone] [int] NULL,
	[ShipAdress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK__HoaDon__C3905BAFB591D587] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PriceWhenBuyAtTime] [float] NOT NULL,
 CONSTRAINT [PK__OrderDet__08D097C1A0B82072] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [nchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[MetaTitle] [varchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NOT NULL,
	[MoreImages] [xml] NULL,
	[Price] [float] NOT NULL,
	[PromotionPrice] [float] NULL,
	[IncludeVAT] [bit] NULL,
	[Quantity] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [varchar](50) NOT NULL,
	[ModifiedDate] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL,
	[Tophot] [datetime] NULL,
	[Viewcount] [int] NULL,
 CONSTRAINT [PK__Product__B40CC6ED26F3869C] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[MetaTitle] [varchar](50) NULL,
	[ParentCategoryID] [int] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTittle] [nvarchar](250) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [varchar](50) NOT NULL,
	[ModifiedDate] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK__ProductC__19093A2BE8649EF1] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slide]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[SlideID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NOT NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [varchar](50) NOT NULL,
	[ModifiedDate] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__Slide__3214EC2749112030] PRIMARY KEY CLUSTERED 
(
	[SlideID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[SystemID] [varchar](50) NULL,
	[SystemName] [nvarchar](50) NULL,
	[SystemType] [nvarchar](50) NULL,
	[Value] [nvarchar](50) NULL,
	[Status] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[NameTag] [nvarchar](50) NULL,
 CONSTRAINT [PK__Tag__657CFA4C14A46F0D] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 07/12/2018 16:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccount](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserAccount] [varchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
	[PermissionID] [int] NOT NULL,
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[UserAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (102, N'Công ty bán đồ điện tử ABC', NULL, NULL, N'<p><img alt="" src="/Data/images/orderdetails.png" style="height:150px; width:150px" /></p>
', CAST(N'2018-09-21T12:27:52.050' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (103, N'Báo điện tử abc.com', NULL, NULL, N'<p><img alt="" src="/Data/images/orderdetails.png" style="height:150px; width:150px" /></p>
', CAST(N'2018-09-21T12:28:33.237' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (105, N'adf', NULL, NULL, NULL, CAST(N'2018-09-23T17:35:37.923' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (106, N'adh', NULL, NULL, NULL, CAST(N'2018-09-23T17:35:51.713' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (107, N'adgrn', NULL, NULL, NULL, CAST(N'2018-09-23T17:36:16.237' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (108, N'bfrg', NULL, NULL, NULL, CAST(N'2018-10-29T21:12:33.417' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (109, N'ab222', NULL, NULL, NULL, CAST(N'2018-10-30T19:12:11.513' AS DateTime), N'Admin', N'30/10/2018 19:12:23', N'Admin', NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (110, N'abc', NULL, NULL, NULL, CAST(N'2018-10-30T22:01:12.107' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (111, N'abc''', NULL, NULL, NULL, CAST(N'2018-10-31T17:34:33.770' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (112, N'abc', NULL, NULL, NULL, CAST(N'2018-10-31T17:34:35.103' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[About] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ContactID], [Content], [Status]) VALUES (3, N'<p><span style="font-size:22px"><span style="color:#ffffff"><strong><span style="background-color:#95a5a6">C&ocirc;ng Ty H&amp;H&amp;B</span></strong></span></span></p>

<p><span style="color:#ffffff"><span style="font-size:18px"><img alt="" src="/Data/images/Logo/Logo.png" style="height:150px; width:150px" /></span></span></p>

<p><span style="font-size:22px"><span style="color:#ffffff"><span style="background-color:#95a5a6">Chuy&ecirc;n b&aacute;n tivi, camera,flycam</span></span></span></p>

<p><span style="font-size:22px"><span style="color:#ffffff"><span style="background-color:#95a5a6">Số điện thoại:0123456788</span></span></span></p>

<p><span style="font-size:22px"><span style="color:#ffffff"><span style="background-color:#95a5a6">Địa chỉ:1 D2 B&igrave;nh Th&agrave;nh</span></span></span></p>
', 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ContentID], [ContentName], [MetaTitle], [Description], [Image], [NewsID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [Tags]) VALUES (115, N'Tivi SamSung Mới Nhất', NULL, N'Tivi SamSung B12 đang là mẫu mới nhất và tốt nhất hiện nay', N'/Data/images/Tivi/images.jpg', 37, N'<p style="text-align:center"><img alt="" src="/Data/images/Tivi/images.jpg" style="height:183px; width:275px" /></p>

<p><span style="font-size:14px">Tivi....</span></p>
', NULL, CAST(N'2018-12-06T11:40:18.727' AS DateTime), N'Admin', N'06/12/2018 12:04:23', NULL, NULL, NULL, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Content] OFF
SET IDENTITY_INSERT [dbo].[CustomerAccount] ON 

INSERT [dbo].[CustomerAccount] ([ID], [Email], [PassWord], [Name], [GioiTinh], [BirthDay], [TelephoneNumber], [ConfirmPassWord]) VALUES (2, N'12@gmail.com', N'huy', N'huy', N'1', NULL, 123, NULL)
INSERT [dbo].[CustomerAccount] ([ID], [Email], [PassWord], [Name], [GioiTinh], [BirthDay], [TelephoneNumber], [ConfirmPassWord]) VALUES (20, N'abc@gmail.com', N'30facee127ba33c2a7c57d1482e10132', N'huy', N'Nam', NULL, 123, N'30facee127ba33c2a7c57d1482e10132')
INSERT [dbo].[CustomerAccount] ([ID], [Email], [PassWord], [Name], [GioiTinh], [BirthDay], [TelephoneNumber], [ConfirmPassWord]) VALUES (21, N'abc123@gmail.com', N'30facee127ba33c2a7c57d1482e10132', N'huy', N'Nam', NULL, 123, N'30facee127ba33c2a7c57d1482e10132')
INSERT [dbo].[CustomerAccount] ([ID], [Email], [PassWord], [Name], [GioiTinh], [BirthDay], [TelephoneNumber], [ConfirmPassWord]) VALUES (3, N'huy@gmail.com', N'30facee127ba33c2a7c57d1482e10132', N'huy', N'Nam', NULL, 123, N'30facee127ba33c2a7c57d1482e10132')
INSERT [dbo].[CustomerAccount] ([ID], [Email], [PassWord], [Name], [GioiTinh], [BirthDay], [TelephoneNumber], [ConfirmPassWord]) VALUES (22, N'huyne@gmail.com', N'30facee127ba33c2a7c57d1482e10132', N'huy', N'Nam', NULL, 123, N'30facee127ba33c2a7c57d1482e10132')
SET IDENTITY_INSERT [dbo].[CustomerAccount] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (26, N'Huy', NULL, N'a@a.com', NULL, CAST(N'2018-10-03T08:15:24.770' AS DateTime), 1, NULL)
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (27, NULL, NULL, N'a@a.com', NULL, CAST(N'2018-10-03T08:15:28.103' AS DateTime), 1, NULL)
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (28, NULL, NULL, N'a@a.com', NULL, CAST(N'2018-10-03T08:15:31.903' AS DateTime), 0, NULL)
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (29, NULL, NULL, N'a@a.com', NULL, CAST(N'2018-10-03T08:15:34.860' AS DateTime), 1, NULL)
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (33, N'nguoi y kien', 123, N'dophuonglan0299@gmail.com', N'to 39 khu 7', CAST(N'2018-12-07T00:46:46.810' AS DateTime), 0, N'làm lại   ')
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (34, N'nguoi y kien', 123, N'dophuonglan0299@gmail.com', N'to 39 khu 7', CAST(N'2018-12-07T00:52:56.090' AS DateTime), 0, N'                ')
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (35, N'nguoi y kien', 123, N'dophuonglan0299@gmail.com', N'to 39 khu 7', CAST(N'2018-12-07T00:58:01.340' AS DateTime), 0, N'                ')
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (36, N'nguoi y kien', 123, N'dophuonglan0299@gmail.com', N'to 39 khu 7', CAST(N'2018-12-07T01:00:33.623' AS DateTime), 0, N'                ')
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (37, N'nguoi y kien', 123, N'dophuonglan0299@gmail.com', N'to 39 khu 7', CAST(N'2018-12-07T01:02:32.210' AS DateTime), 0, N'                ')
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (38, N'nguoi y kien', 123, N'dophuonglan0299@gmail.com', N'to 39 khu 7', CAST(N'2018-12-07T01:03:04.287' AS DateTime), 0, N'                ')
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (39, N'huy', 123, N'dophuonglan0299@gmail.com', N'to 39 khu 7', CAST(N'2018-12-07T01:03:16.190' AS DateTime), 0, N'                ')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([MenuID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (1, N'TrangChu', N'/', 1, N'_self', 1, 24)
INSERT [dbo].[Menu] ([MenuID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (2, N'Giới Thiệu', N'/gioi-thieu', 2, N'_self', 1, 24)
INSERT [dbo].[Menu] ([MenuID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (3, N'Tin Tức', N'/tin-tuc-tat-ca-0', 3, N'_self', 1, 24)
INSERT [dbo].[Menu] ([MenuID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (4, N'Sản Phẩm', N'/san-pham', 4, N'_self', 1, 24)
INSERT [dbo].[Menu] ([MenuID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (5, N'Liên Hệ', N'/lien-he', 5, N'_self', 1, 24)
INSERT [dbo].[Menu] ([MenuID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (6, N'Đăng Kí', N'/dang-ki', 6, N'_self', 1, 23)
INSERT [dbo].[Menu] ([MenuID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (7, N'Đăng Nhập', N'/dang-nhap', 7, N'_self', 1, 23)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([MenuTypeID], [Name]) VALUES (23, N'MenuTop')
INSERT [dbo].[MenuType] ([MenuTypeID], [Name]) VALUES (24, N'MenuChinh')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsID], [NewsName], [MetaTitle], [ParentNewsID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (5, N'Đồ Điện Tử', N'do-dien-tu', NULL, NULL, N'Đồ Điện Tử', CAST(N'2018-09-01T22:04:53.937' AS DateTime), N'Admin', NULL, NULL, N'Đồ Điện Tử', N'Đồ Điện Tử', 1, 0)
INSERT [dbo].[News] ([NewsID], [NewsName], [MetaTitle], [ParentNewsID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (13, N'Chuông Báo Động', N'chuong-bao-dong', 5, NULL, NULL, CAST(N'2018-09-01T22:25:46.660' AS DateTime), N'Admin', N'06/12/2018 11:08:02', N'Admin', NULL, NULL, 1, NULL)
INSERT [dbo].[News] ([NewsID], [NewsName], [MetaTitle], [ParentNewsID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (36, N'Tin Tức Về Camera', N'tin-tuc-ve-camera', NULL, NULL, NULL, CAST(N'2018-12-06T11:07:25.853' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[News] ([NewsID], [NewsName], [MetaTitle], [ParentNewsID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (37, N'Tin Tức Về Tivi', N'tin-tuc-ve-tivi', NULL, NULL, NULL, CAST(N'2018-12-06T11:07:43.830' AS DateTime), N'Admin', N'06/12/2018 11:08:15', N'Admin', NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (1, CAST(N'2018-12-05T18:17:38.093' AS DateTime), NULL, N'huy', 123, N'to 39 khu 7', N'a@gmail.com', 1)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (2, CAST(N'2018-12-05T19:55:47.693' AS DateTime), NULL, N'a', 433, N'gts', N'b@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (3, CAST(N'2018-12-05T21:41:25.293' AS DateTime), NULL, N'Lan', 123, N'gts', N'hoanghuy@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (4, CAST(N'2018-12-05T22:00:42.887' AS DateTime), NULL, N'huy', 123, N'gts', N'hoanghuy97nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (5, CAST(N'2018-12-06T20:51:50.213' AS DateTime), NULL, N'huy', 123, N'gts', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (6, CAST(N'2018-12-06T20:58:26.263' AS DateTime), NULL, N'huy', 123, N'gts', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (7, CAST(N'2018-12-06T21:01:58.557' AS DateTime), NULL, N'huy', 123, N'gts', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (8, CAST(N'2018-12-06T21:17:00.190' AS DateTime), NULL, N'huy', 1234, N'gts', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (9, CAST(N'2018-12-06T21:25:24.230' AS DateTime), NULL, N'huy', 123, N'gts', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (10, CAST(N'2018-12-06T21:28:00.287' AS DateTime), NULL, N'huy', 123, N'to 39 khu 7', N'dophuonglan0299@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (11, CAST(N'2018-12-06T21:38:10.023' AS DateTime), NULL, N'Lan của huy', 123456789, N'gts', N'dophuonglan0299@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (1, 41, 1, 13500000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (1, 42, 1, 24300000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (2, 4, 1, 3222442)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (3, 3, 1, 1904000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (3, 5, 1, 2442224)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (3, 41, 2, 13500000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (4, 4, 1, 3222442)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (5, 5, 1, 2442224)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (5, 42, 1, 24300000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (6, 5, 1, 2442224)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (7, 2, 1, 2100000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (8, 41, 1, 13500000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (9, 4, 1, 3222442)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (10, 3, 1, 1904000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (10, 4, 1, 3222442)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (11, 19, 1, 4200000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime]) VALUES (11, 42, 1, 24300000)
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [Description]) VALUES (1, N'Admin                                             ', N'Toàn quyền hệ thống')
INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [Description]) VALUES (2, N'Employee                                          ', N'Quản lí sản phẩm, tin tức')
SET IDENTITY_INSERT [dbo].[Permission] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (1, N'Chuông báo động IG-2101', N'chuong-bao-dong-ig-2101', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/500x417Bao-dong-rung-DKTX-V1-1(1).jpg', NULL, 2000000, 10, NULL, 10, 1, NULL, NULL, CAST(N'2018-10-13T13:42:35.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, CAST(N'2018-04-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (2, N'Chuông báo động IG-503', N'chuong-bao-dong-ig-503', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/BO-Kit-bao-dong-chong-trom-KF-SF05R_1.jpg', NULL, 2100000, NULL, NULL, 5, 1, NULL, NULL, CAST(N'2018-10-13T13:42:58.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (3, N'Chuông báo động IG-402', N'chuong-bao-dong-ig-402', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/download%20(1).jpg', NULL, 1904000, NULL, NULL, 0, 1, NULL, NULL, CAST(N'2018-10-13T13:43:15.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (4, N'Chuông báo động IG-123', N'chuong-bao-dong-ig-123', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/download%20(2).jpg', NULL, 3222442, NULL, NULL, 5, 1, NULL, NULL, CAST(N'2018-10-13T13:43:54.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (5, N'Chuông báo động BO-kit253', N'chuong-bao-dong-bo-kit253', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/homematic_bo-kit-bao-dong-chong-trom-seckit02-2.jpg', NULL, 2442224, NULL, NULL, 10, 1, NULL, NULL, CAST(N'2018-10-13T13:44:13.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (6, N'Camera SONY-T604', N'camera-sony-t604', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/c604351e9857a6ef35514fece50c1365.jpg', NULL, 1320400, NULL, NULL, 0, 3, NULL, NULL, CAST(N'2018-10-13T13:45:03.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (7, N'Camera HIKVSION-753', N'camera-hikvsion-753', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/camera-0_3.png', NULL, 3212222, NULL, NULL, 10, 3, NULL, NULL, CAST(N'2018-10-13T13:45:38.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (9, N'Camera Vistor-2004', N'camera-vistor-2004', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/camera-24917_camera_dahua_dh_hac_hfw1100dp_s3_hdcvi_1_0mp_1.jpg', NULL, 3366000, NULL, NULL, 0, 3, NULL, NULL, CAST(N'2018-10-13T13:46:31.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (10, N'Camera HIKVSION-HD-201', N'camera-hikvsion-hd-201', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/camera-350_KB_Vision_KX_2004MC.png', NULL, 4324243, NULL, NULL, 5, 3, NULL, NULL, CAST(N'2018-10-13T13:46:54.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (11, N'Camera wifiless Sony-2794', N'camera-wifiless-sony-2794', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/camera_wireless_0007_250_250(1).jpg', NULL, 32132111, NULL, NULL, 10, 3, NULL, NULL, CAST(N'2018-10-13T13:47:19.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (12, N'Camera HIKVSION-642', N'camera-hikvsion-642', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/camera-quan-sat-hd-tvi-hikvision-ds-2ce16c0t-ir.jpg', NULL, 3213213, NULL, NULL, 0, 3, NULL, NULL, CAST(N'2018-10-13T13:47:34.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (13, N'Máy chấm công SamSung-24', N'may-cham-cong-samsung-24', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/628cplussmall_1470280701.jpg', NULL, 4000000, NULL, NULL, 10, 4, NULL, NULL, CAST(N'2018-10-13T14:02:18.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (14, N'Máy chấm công SamSung-5321', N'may-cham-cong-samsung-5321', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/8580_ma__y_ch____m_c__ng_ronald_jack_u160c_1.jpg', NULL, 2300000, NULL, NULL, 5, 4, NULL, NULL, CAST(N'2018-10-13T14:02:33.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (15, N'Máy chấm công Sony-262', N'may-cham-cong-sony-262', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/download%20(1)(1).jpg', NULL, 2600000, NULL, NULL, 0, 4, NULL, NULL, CAST(N'2018-10-13T14:02:48.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (16, N'Máy chấm công SamSung-753', N'may-cham-cong-samsung-753', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/download%20(1)(1).jpg', NULL, 3200000, NULL, NULL, 5, 4, NULL, NULL, CAST(N'2018-10-13T14:03:08.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (17, N'Máy chấm công LG-542', N'may-cham-cong-lg-542', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/download(1).jpg', NULL, 2500000, NULL, NULL, 10, 4, NULL, NULL, CAST(N'2018-10-13T14:03:31.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (18, N'Máy chấm công Rambo-241', N'may-cham-cong-rambo-241', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/may-cham-cong-van-tay-k21-rambo-00.jpg', NULL, 2300000, NULL, NULL, 0, 4, NULL, NULL, CAST(N'2018-10-13T14:03:44.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (19, N'Máy chấm công LG-584', N'may-cham-cong-lg-584', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/may-cham-cong-van-tay-RONALD-JACK-DG-1000.jpg', NULL, 4200000, NULL, NULL, 10, 4, NULL, NULL, CAST(N'2018-10-13T14:03:57.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (20, N'Chuông cửa có hình hikvision-ds-kis', N'chuong-cua-co-hinh-hikvision-ds-kis', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/bo-chuong-cua-co-hinh-hikvision-ds-kis201.jpg', NULL, 2300000, NULL, NULL, 5, 5, NULL, NULL, CAST(N'2018-10-13T14:04:46.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (21, N'Chuông cửa có hình Panasonic-nh-311', N'chuong-cua-co-hinh-panasonic-nh-311', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/bo-chuong-cua-man-hinh-7inch-panasonic-vl-sv71vn.jpg', NULL, 2310000, NULL, NULL, 0, 5, NULL, NULL, CAST(N'2018-10-13T14:05:04.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (22, N'Chuông cửa có hình Panasonic-nh-311', N'chuong-cua-co-hinh-panasonic-nh-311', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/chuong-cua-panasonic_s727.jpg', NULL, 3200000, NULL, NULL, 5, 5, NULL, NULL, CAST(N'2018-10-13T14:05:16.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (23, N'Chuông cửa có hình Sony-fr-31', N'chuong-cua-co-hinh-sony-fr-31', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/chuong_cua.jpg', NULL, 6000000, NULL, NULL, 10, 5, NULL, NULL, CAST(N'2018-10-13T14:05:29.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (24, N'Chuông cửa có hình Sony-fr-31', N'chuong-cua-co-hinh-sony-fr-31', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/chuong-cua-panasonic_s727.jpg', NULL, 3213222, NULL, NULL, 0, 5, NULL, NULL, CAST(N'2018-10-13T14:05:38.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (25, N'chuông cửa có hình Samsung-nh-241', N'chuong-cua-co-hinh-samsung-nh-241', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/jos-1a-camera14_vn.jpg', NULL, 4000000, NULL, NULL, 10, 5, NULL, NULL, CAST(N'2018-10-13T14:06:00.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (26, N'chuông cửa có hình Sony-ng-5432', N'chuong-cua-co-hinh-sony-ng-5432', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/sua-chua-chuong-cau-tot-nhat-ha-noi.jpg', NULL, 5400000, NULL, NULL, 5, 5, NULL, NULL, CAST(N'2018-10-13T14:06:16.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (27, N'Chuông cửa có hình hikvision-rg-522', N'chuong-cua-co-hinh-hikvision-rg-522', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/images.jpg', NULL, 3200000, NULL, NULL, 0, 5, NULL, NULL, CAST(N'2018-10-13T14:06:29.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (28, N'Chuông cửa có hình Panasonic-nh-532', N'chuong-cua-co-hinh-panasonic-nh-532', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/bo-chuong-cua-co-hinh-hikvision-ds-kis201.jpg', NULL, 4300000, NULL, NULL, 5, 5, NULL, NULL, CAST(N'2018-10-13T14:06:46.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (29, N'Đèn 200W-Panasonic', N'den-200w-panasonic', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Thiet%20Bi%20Chieu%20Sang/den2(9).PNG', NULL, 230000, NULL, NULL, 10, 7, NULL, NULL, CAST(N'2018-10-13T14:09:06.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (30, N'2 bóng đén 200W-Sony-421', N'2-bong-den-200w-sony-421', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Thiet%20Bi%20Chieu%20Sang/download%20(3).jpg', NULL, 400000, NULL, NULL, 0, 7, NULL, NULL, CAST(N'2018-10-13T14:09:23.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (31, N'Thiết bị chiếu sáng Sony-23n4', N'thiet-bi-chieu-sang-sony-23n4', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Thiet%20Bi%20Chieu%20Sang/images%20(1).jpg', NULL, 600000, NULL, NULL, 10, 7, NULL, NULL, CAST(N'2018-10-13T14:09:47.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (32, N'Đèn 120W-KenTom-23', N'den-120w-kentom-23', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Thiet%20Bi%20Chieu%20Sang/images-workshop-lights.jpg', NULL, 540000, NULL, NULL, 5, 7, NULL, NULL, CAST(N'2018-10-13T14:10:12.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (33, N'Thiết Bị chiếu sáng HKVISION-43', N'thiet-bi-chieu-sang-hkvision-43', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Thiet%20Bi%20Chieu%20Sang/M_NN01_2x36W_1.jpg', NULL, 800000, NULL, NULL, 0, 7, NULL, NULL, CAST(N'2018-10-13T14:10:42.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (34, N'Camera hành trình SamSung-23', N'camera-hanh-trinh-samsung-23', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/camera-h%C3%A0nh-tr%C3%ACnh-sj7000.png', NULL, 7800000, NULL, NULL, 5, 26, NULL, NULL, CAST(N'2018-10-13T14:11:38.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (35, N'Camera G3-due', N'camera-g3-due', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/download%20(1).jpg', NULL, 6070000, NULL, NULL, 10, 26, NULL, NULL, CAST(N'2018-10-13T14:11:53.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (36, N'Flycam Bug3', N'flycam-bug3', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/download.jpg', NULL, 5420000, NULL, NULL, 0, 26, NULL, NULL, CAST(N'2018-10-13T14:14:03.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (37, N'Camera hành trình SamSung-542', N'camera-hanh-trinh-samsung-542', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/eken-h5s-plus-1-300x300.png', NULL, 4380000, NULL, NULL, 10, 26, NULL, NULL, CAST(N'2018-10-13T14:21:42.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (38, N'Camera hành trình Sony-ny-3205', N'camera-hanh-trinh-sony-ny-3205', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/hqdefault.jpg', NULL, 9700000, NULL, NULL, 5, 26, NULL, NULL, CAST(N'2018-10-13T14:22:06.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (39, N'Camera hành trình SamSung-432', N'camera-hanh-trinh-samsung-432', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/camera-h%C3%A0nh-tr%C3%ACnh-sj7000.png', NULL, 5460000, 10, NULL, 0, 26, NULL, NULL, CAST(N'2018-10-13T14:22:23.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, CAST(N'2018-04-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (40, N'Máy bay flycam sjrc-422t', N'may-bay-flycam-sjrc-422t', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/flycam-mjx-bugs-3-linhkienstore11.jpg', NULL, 12000000, 10, NULL, 5, 26, NULL, NULL, CAST(N'2018-10-13T14:22:44.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, CAST(N'2018-04-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (41, N'Tivi Sony-4k-HD-213', N'tivi-sony-4k-hd-213', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Tivi/download.jpg', NULL, 15000000, 10, NULL, 10, 25, NULL, NULL, CAST(N'2018-10-13T14:32:57.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, CAST(N'2018-04-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (42, N'Tivi Samsung-HDR-2135', N'tivi-samsung-hdr-2135', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Tivi/images.jpg', NULL, 27000000, 10, NULL, 0, 25, NULL, NULL, CAST(N'2018-10-13T14:33:18.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, CAST(N'2018-04-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (43, N'Tivi LG-321k540', N'tivi-lg-321k540', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Tivi/tivi-lg-32lk5400bpta-14-550x340.jpg', NULL, 13000000, NULL, NULL, 10, 25, NULL, NULL, CAST(N'2018-10-13T14:33:39.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (44, N'Tivi LG-43uk6340', N'tivi-lg-43uk6340', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Tivi/tivi-lg-43uk6340ptf-22-550x340.jpg', NULL, 12500000, NULL, NULL, 5, 25, NULL, NULL, CAST(N'2018-10-13T14:34:01.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (45, N'Tivi SamSung-ua43n5500', N'tivi-samsung-ua43n5500', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Tivi/tivi-samsung-ua43n5500-13-550x340.jpg', NULL, 16000000, NULL, NULL, 0, 25, NULL, NULL, CAST(N'2018-10-13T14:34:16.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (46, N'Tivi Samsung-ua43nu7400', N'tivi-samsung-ua43nu7400', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Tivi/tivi-samsung-ua43nu7400-14-550x340.jpg', NULL, 19700000, NULL, NULL, 5, 25, NULL, NULL, CAST(N'2018-10-13T14:34:30.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (47, N'Tivi Samsung-vtbs11v3277', N'tivi-samsung-vtbs11v3277', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Tivi/vtbs1lv3277-1519804965.jpg', NULL, 12000000, NULL, NULL, 10, 25, NULL, NULL, CAST(N'2018-10-13T14:34:58.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (48, N'Máy in Sony-1003', N'may-in-sony-1003', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/May%20in/10036181-2_36k2-wx.jpg', NULL, 7200000, NULL, NULL, 0, 6, NULL, NULL, CAST(N'2018-10-13T14:37:00.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (49, N'Máy in fed-201', N'may-in-fed-201', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/May%20in/1703_343_fed75fc7a70d870793b92b161bf30403.jpg', NULL, 3200000, NULL, NULL, 10, 6, NULL, NULL, CAST(N'2018-10-13T14:37:14.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (50, N'Máy in canor-342', N'may-in-canor-342', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/May%20in/31529-canon-g2010.png', NULL, 6500000, NULL, NULL, 5, 6, NULL, NULL, CAST(N'2018-10-13T14:37:25.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (51, N'Máy in Samsung-2nt3', N'may-in-samsung-2nt3', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/May%20in/may-in-laser-canon-lbp-6030-trananh-1.jpg', NULL, 4300000, NULL, NULL, 0, 6, NULL, NULL, CAST(N'2018-10-13T14:38:46.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (52, N'Máy in ONY-2316', N'may-in-ony-2316', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/May%20in/OKI%20MB472%20(1).png', NULL, 5300000, NULL, NULL, 5, 6, NULL, NULL, CAST(N'2018-10-13T14:39:02.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount]) VALUES (53, N'Máy in OKI-6433', N'may-in-oki-6433', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/May%20in/download%20(2).jpg', NULL, 3200000, NULL, NULL, 10, 1, NULL, NULL, CAST(N'2018-10-13T14:39:15.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (1, N'Báo Động Chống Trộm', N'bao-dong-chong-trom', NULL, 1, NULL, CAST(N'2018-10-05T15:26:47.550' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (3, N'Camera Quan Sát', N'camera-quan-sat', NULL, 1, NULL, CAST(N'2018-10-05T15:32:03.453' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (4, N'Chấm Công Vân Tay', N'cham-cong-van-tay', NULL, 1, NULL, CAST(N'2018-10-05T15:32:18.267' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (5, N'Chuông cửa có hình', N'chuong-cua-co-hinh', NULL, 1, NULL, CAST(N'2018-10-05T15:32:32.513' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (6, N'Máy In', N'may-in', NULL, 1, NULL, CAST(N'2018-10-05T15:48:24.633' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (7, N'Thiết Bị Chiếu Sáng', N'thiet-bi-chieu-sang', NULL, 1, NULL, CAST(N'2018-10-05T15:48:43.100' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (23, N'Điện Thoại', N'dien-thoai', NULL, 1, NULL, CAST(N'2018-10-10T22:50:47.677' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (25, N'Tivi', N'tivi', NULL, 1, NULL, CAST(N'2018-10-13T14:31:01.007' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (26, N'Camera hành trình và flycam', N'camera-hanh-trinh', NULL, NULL, NULL, CAST(N'2018-10-13T15:13:14.240' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([SlideID], [Image], [DisplayOrder], [Link], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'/Data/images/500x417Bao-dong-rung-DKTX-V1-1(1).jpg', NULL, N'google.com', NULL, CAST(N'2018-10-20T22:33:07.283' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [dbo].[Slide] ([SlideID], [Image], [DisplayOrder], [Link], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (14, N'/Data/images/Tivi/images.jpg', NULL, N'google.com', NULL, CAST(N'2018-10-21T14:36:38.210' AS DateTime), N'Admin', N'04/11/2018 17:56:00', NULL, 1)
INSERT [dbo].[Slide] ([SlideID], [Image], [DisplayOrder], [Link], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (15, N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/new-0802-camera-a19.png', 1, N'google.com', NULL, CAST(N'2018-12-04T00:00:29.177' AS DateTime), N'Admin', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[UserAccount] ON 

INSERT [dbo].[UserAccount] ([UserID], [UserAccount], [PassWord], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [PermissionID]) VALUES (1, N'Admin', N'30facee127ba33c2a7c57d1482e10132', N'huy', N'tp.hochiminh', N'hoanghuy', N'21321', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[UserAccount] ([UserID], [UserAccount], [PassWord], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [PermissionID]) VALUES (2, N'test', N'202cb962ac59075b964b07152d234b70', N'test', NULL, NULL, NULL, NULL, NULL, CAST(N'2018-11-10T00:09:31.930' AS DateTime), NULL, 1, 2)
SET IDENTITY_INSERT [dbo].[UserAccount] OFF
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF__About__CreateDat__3A81B327]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF__About__Status__3B75D760]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF__Content__CreateD__3C69FB99]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF__Content__Status__3D5E1FD2]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF__Content__Viewcou__3E52440B]  DEFAULT ((0)) FOR [Viewcount]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF__News__DisplayOrd__3F466844]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF__News__CreateDate__403A8C7D]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF__News__Status__412EB0B6]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF__News__ShowOnHome__4222D4EF]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Price__4316F928]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Quantit__440B1D61]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__CreateD__44FF419A]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Status__45F365D3]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Viewcou__46E78A0C]  DEFAULT ((0)) FOR [Viewcount]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF__ProductCa__Displ__47DBAE45]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF__ProductCa__Creat__48CFD27E]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF__ProductCa__Statu__49C3F6B7]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF__ProductCa__ShowO__4AB81AF0]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF__Slide__CreateDat__4BAC3F29]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[UserAccount] ADD  CONSTRAINT [DF_UserAccount_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[About]  WITH CHECK ADD  CONSTRAINT [FK_About_UserAccount] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[UserAccount] ([UserAccount])
GO
ALTER TABLE [dbo].[About] CHECK CONSTRAINT [FK_About_UserAccount]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_News] FOREIGN KEY([NewsID])
REFERENCES [dbo].[News] ([NewsID])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_News]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_UserAccount1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[UserAccount] ([UserAccount])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_UserAccount1]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_MenuType] FOREIGN KEY([MenuTypeID])
REFERENCES [dbo].[MenuType] ([MenuTypeID])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_MenuType]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_UserAccount1] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[UserAccount] ([UserAccount])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_UserAccount1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__50FB042B] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Order__50FB042B]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Produ__477199F1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Produ__477199F1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_UserAccount] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[UserAccount] ([UserAccount])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_UserAccount]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_UserAccount] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[UserAccount] ([UserAccount])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_UserAccount]
GO
ALTER TABLE [dbo].[Slide]  WITH CHECK ADD  CONSTRAINT [FK_Slide_UserAccount] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[UserAccount] ([UserAccount])
GO
ALTER TABLE [dbo].[Slide] CHECK CONSTRAINT [FK_Slide_UserAccount]
GO
ALTER TABLE [dbo].[UserAccount]  WITH CHECK ADD  CONSTRAINT [FK_UserAccount_Permission] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permission] ([PermissionID])
GO
ALTER TABLE [dbo].[UserAccount] CHECK CONSTRAINT [FK_UserAccount_Permission]
GO
USE [master]
GO
ALTER DATABASE [ShopOnline] SET  READ_WRITE 
GO
