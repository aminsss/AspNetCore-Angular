USE [master]
GO
/****** Object:  Database [koshopir]    Script Date: 3/4/2021 11:22:21 AM ******/
CREATE DATABASE [koshopir]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'koshopir', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\koshopir.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'koshopir_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\koshopir_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [koshopir] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [koshopir].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [koshopir] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [koshopir] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [koshopir] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [koshopir] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [koshopir] SET ARITHABORT OFF 
GO
ALTER DATABASE [koshopir] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [koshopir] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [koshopir] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [koshopir] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [koshopir] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [koshopir] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [koshopir] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [koshopir] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [koshopir] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [koshopir] SET  ENABLE_BROKER 
GO
ALTER DATABASE [koshopir] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [koshopir] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [koshopir] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [koshopir] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [koshopir] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [koshopir] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [koshopir] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [koshopir] SET RECOVERY FULL 
GO
ALTER DATABASE [koshopir] SET  MULTI_USER 
GO
ALTER DATABASE [koshopir] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [koshopir] SET DB_CHAINING OFF 
GO
ALTER DATABASE [koshopir] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [koshopir] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [koshopir] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [koshopir] SET QUERY_STORE = OFF
GO
USE [koshopir]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [koshopir]
GO
/****** Object:  Table [dbo].[Address_User]    Script Date: 3/4/2021 11:22:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address_User](
	[Address_UserId] [int] IDENTITY(1,1) NOT NULL,
	[NameFamily] [nvarchar](100) NULL,
	[MobileNo] [nvarchar](100) NULL,
	[HomeNo] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[PostAddress] [nvarchar](100) NULL,
	[postalCode] [nvarchar](100) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Address_User] PRIMARY KEY CLUSTERED 
(
	[Address_UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttributGrps]    Script Date: 3/4/2021 11:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributGrps](
	[AttributGrpId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Attr_type] [nvarchar](100) NULL,
	[ProductGroupId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AttributGrps] PRIMARY KEY CLUSTERED 
(
	[AttributGrpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttributItems]    Script Date: 3/4/2021 11:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributItems](
	[AttributItemId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[value] [nvarchar](max) NULL,
	[idfilter] [nvarchar](max) NULL,
	[AttributGrpId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AttributItems] PRIMARY KEY CLUSTERED 
(
	[AttributItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlockedIps]    Script Date: 3/4/2021 11:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlockedIps](
	[BlockedIpId] [int] IDENTITY(1,1) NOT NULL,
	[IpAddress] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.BlockedIps] PRIMARY KEY CLUSTERED 
(
	[BlockedIpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chartPosts]    Script Date: 3/4/2021 11:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chartPosts](
	[chartPostId] [int] IDENTITY(1,1) NOT NULL,
	[Postduty] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.chartPosts] PRIMARY KEY CLUSTERED 
(
	[chartPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 3/4/2021 11:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](30) NULL,
	[CityIcon] [varbinary](max) NULL,
	[StateId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Cities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComponentDesigns]    Script Date: 3/4/2021 11:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentDesigns](
	[ComponentdesignId] [int] IDENTITY(1,1) NOT NULL,
	[ComponentId] [int] NOT NULL,
	[Design] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ComponentDesigns] PRIMARY KEY CLUSTERED 
(
	[ComponentdesignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Components]    Script Date: 3/4/2021 11:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Components](
	[ComponentId] [int] IDENTITY(1,1) NOT NULL,
	[ComponentName] [nvarchar](30) NULL,
	[ActionName] [nvarchar](30) NULL,
	[Descroption] [nvarchar](500) NULL,
	[AdminAction] [nvarchar](30) NULL,
	[ControllerName] [nvarchar](30) NULL,
	[AdminController] [nvarchar](30) NULL,
 CONSTRAINT [PK_dbo.Components] PRIMARY KEY CLUSTERED 
(
	[ComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactModules]    Script Date: 3/4/2021 11:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactModules](
	[ContactModuleId] [int] NOT NULL,
	[Email] [nvarchar](max) NULL,
	[PhoneNum] [nvarchar](max) NULL,
	[MobileNum] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[PostCode] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ContactModules] PRIMARY KEY CLUSTERED 
(
	[ContactModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactPersons]    Script Date: 3/4/2021 11:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactPersons](
	[ContactPersonId] [int] IDENTITY(1,1) NOT NULL,
	[ContactModuleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ContactPersons] PRIMARY KEY CLUSTERED 
(
	[ContactPersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryCode] [nvarchar](max) NULL,
	[CountryName] [nvarchar](max) NULL,
	[Latitude] [nvarchar](max) NULL,
	[Longitude] [nvarchar](max) NULL,
	[ViewCount] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailGroups]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailGroups](
	[DetailGroupId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ProductGroupId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.DetailGroups] PRIMARY KEY CLUSTERED 
(
	[DetailGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailItems]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailItems](
	[DetailItemId] [int] IDENTITY(1,1) NOT NULL,
	[DetailTitle] [nvarchar](100) NULL,
	[DetailType] [nvarchar](100) NULL,
	[DetailGroupId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.DetailItems] PRIMARY KEY CLUSTERED 
(
	[DetailItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HtmlModules]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HtmlModules](
	[HtmlModuleId] [int] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[HtmlText] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HtmlModules] PRIMARY KEY CLUSTERED 
(
	[HtmlModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuGroups]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuGroups](
	[MenuGroupId] [int] IDENTITY(1,1) NOT NULL,
	[MenuTitile] [nvarchar](50) NOT NULL,
	[MenuType] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.MenuGroups] PRIMARY KEY CLUSTERED 
(
	[MenuGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuModules]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuModules](
	[MenuModuleId] [int] NOT NULL,
	[MenuGroupId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.MenuModules] PRIMARY KEY CLUSTERED 
(
	[MenuModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[MenuTitle] [nvarchar](50) NOT NULL,
	[PageName] [nvarchar](50) NOT NULL,
	[Depth] [int] NULL,
	[Path] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NULL,
	[ParentId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[PageType] [nvarchar](100) NULL,
	[PageContetnt] [nvarchar](100) NULL,
	[MenuGroupId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Menus] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[FromUser] [int] NULL,
	[ToUser] [int] NULL,
	[Subject] [nvarchar](50) NULL,
	[ContentMessage] [nvarchar](max) NULL,
	[Email] [nvarchar](100) NULL,
	[ISRead] [bit] NULL,
	[SenderName] [nvarchar](50) NULL,
	[AddedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
	[Mobile] [nvarchar](max) NULL,
	[Type] [nvarchar](10) NULL,
 CONSTRAINT [PK_dbo.Messages] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModulePages]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModulePages](
	[ModulePageId] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[ModuleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ModulePages] PRIMARY KEY CLUSTERED 
(
	[ModulePageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modules]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modules](
	[ModuleId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleTitle] [nvarchar](50) NULL,
	[PositionId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Accisibility] [nvarchar](max) NULL,
	[ComponentId] [int] NOT NULL,
	[DisplayOrder] [int] NULL,
	[AddedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.Modules] PRIMARY KEY CLUSTERED 
(
	[ModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MultiPictureItems]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MultiPictureItems](
	[MultiPictureItemsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[TitleBold] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[LinkMore] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[ModuleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.MultiPictureItems] PRIMARY KEY CLUSTERED 
(
	[MultiPictureItemsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MultiPictureModules]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MultiPictureModules](
	[ModuleId] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[TitleBold] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Cover] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[LinkMore] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.MultiPictureModules] PRIMARY KEY CLUSTERED 
(
	[ModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[NewsGroupId] [int] NOT NULL,
	[NewsTitle] [nvarchar](50) NOT NULL,
	[NewsDescription] [nvarchar](max) NULL,
	[NewsImage] [nvarchar](150) NULL,
	[UserId] [int] NOT NULL,
	[AliasName] [nvarchar](150) NOT NULL,
	[AddedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
	[NewsContent] [nvarchar](200) NOT NULL,
	[Popular] [int] NULL,
 CONSTRAINT [PK_dbo.News] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsComments]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsComments](
	[NewsCommentId] [int] IDENTITY(1,1) NOT NULL,
	[NewsId] [int] NOT NULL,
	[UserId] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[WebSite] [nvarchar](100) NULL,
	[Comment] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[ParentId] [int] NOT NULL,
	[AddedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.NewsComments] PRIMARY KEY CLUSTERED 
(
	[NewsCommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsGalleries]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsGalleries](
	[NewsGalleryId] [int] IDENTITY(1,1) NOT NULL,
	[NewsId] [int] NOT NULL,
	[ImageName] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.NewsGalleries] PRIMARY KEY CLUSTERED 
(
	[NewsGalleryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsGroups]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsGroups](
	[NewsGroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupTitle] [nvarchar](50) NOT NULL,
	[Depth] [int] NULL,
	[Path] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NULL,
	[ParentId] [int] NOT NULL,
	[AliasName] [nvarchar](100) NOT NULL,
	[AddedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.NewsGroups] PRIMARY KEY CLUSTERED 
(
	[NewsGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsTags]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsTags](
	[NewsTagId] [int] IDENTITY(1,1) NOT NULL,
	[NewsId] [int] NOT NULL,
	[TagsTitle] [nvarchar](150) NULL,
 CONSTRAINT [PK_dbo.NewsTags] PRIMARY KEY CLUSTERED 
(
	[NewsTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
	[IsAutoload] [bit] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Group] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Options] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductCount] [int] NOT NULL,
	[ProductPrice] [int] NOT NULL,
	[Sum] [int] NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[IsFinally] [bit] NULL,
	[AddedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 3/4/2021 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[PositionId] [int] IDENTITY(1,1) NOT NULL,
	[PositionTitle] [nvarchar](50) NULL,
	[PositionName] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Positions] PRIMARY KEY CLUSTERED 
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Attribut]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Attribut](
	[Product_AttributId] [int] IDENTITY(1,1) NOT NULL,
	[isChecked] [bit] NULL,
	[Value] [nvarchar](100) NULL,
	[AttributItemId] [int] NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Product_Attribut] PRIMARY KEY CLUSTERED 
(
	[Product_AttributId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[ProductDetailId] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](100) NULL,
	[DetailItemId] [int] NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ProductDetails] PRIMARY KEY CLUSTERED 
(
	[ProductDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductGalleries]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGalleries](
	[ProductGalleryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImageName] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.ProductGalleries] PRIMARY KEY CLUSTERED 
(
	[ProductGalleryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductGroups]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGroups](
	[ProductGroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupTitle] [nvarchar](max) NOT NULL,
	[Depth] [int] NULL,
	[Path] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NULL,
	[ParentId] [int] NOT NULL,
	[AliasName] [nvarchar](max) NOT NULL,
	[type] [nvarchar](max) NULL,
	[AddedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.ProductGroups] PRIMARY KEY CLUSTERED 
(
	[ProductGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductRequests]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductRequests](
	[ProductRequestId] [int] IDENTITY(1,1) NOT NULL,
	[NAme] [nvarchar](max) NULL,
	[ProductGroupId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[status] [nvarchar](150) NULL,
	[Descript] [nvarchar](max) NULL,
	[Response] [nvarchar](150) NULL,
	[details] [nvarchar](150) NULL,
	[productID] [int] NULL,
 CONSTRAINT [PK_dbo.ProductRequests] PRIMARY KEY CLUSTERED 
(
	[ProductRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ProductGroupId] [int] NOT NULL,
	[ProductTitle] [nvarchar](100) NOT NULL,
	[ProductImage] [nvarchar](100) NULL,
	[AliasName] [nvarchar](max) NOT NULL,
	[GroupModel] [int] NULL,
	[AddedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTags]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTags](
	[ProductTagId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[TagTitle] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.ProductTags] PRIMARY KEY CLUSTERED 
(
	[ProductTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestDetails]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestDetails](
	[RequestDetailId] [int] IDENTITY(1,1) NOT NULL,
	[value] [nvarchar](50) NULL,
	[DetailItemId] [int] NOT NULL,
	[ProductRequestId] [int] NULL,
 CONSTRAINT [PK_dbo.RequestDetails] PRIMARY KEY CLUSTERED 
(
	[RequestDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleTitle] [nvarchar](50) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NULL,
	[StateIcon] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.States] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statistics]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistics](
	[StatisticsId] [int] IDENTITY(1,1) NOT NULL,
	[IpAddress] [nvarchar](max) NULL,
	[UserAgent] [nvarchar](max) NULL,
	[UserOs] [nvarchar](max) NULL,
	[Referer] [nvarchar](max) NULL,
	[PageViewed] [nvarchar](max) NULL,
	[DateStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Statistics] PRIMARY KEY CLUSTERED 
(
	[StatisticsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreFollowers]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreFollowers](
	[StoreFollowerId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[StoreId] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.StoreFollowers] PRIMARY KEY CLUSTERED 
(
	[StoreFollowerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreInfoes]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreInfoes](
	[StoreId] [nvarchar](128) NOT NULL,
	[banner] [nvarchar](50) NULL,
	[ZindexMap] [nvarchar](50) NULL,
	[latitute] [float] NULL,
	[lngitute] [float] NULL,
 CONSTRAINT [PK_dbo.StoreInfoes] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[StoreId] [nvarchar](128) NOT NULL,
	[CityId] [int] NOT NULL,
	[StoreName] [nvarchar](50) NOT NULL,
	[StoreAddress] [nvarchar](300) NOT NULL,
	[Descriptions] [nvarchar](max) NULL,
	[StoreIcon] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[SiteName] [nvarchar](30) NOT NULL,
	[PhoneNo] [nvarchar](25) NOT NULL,
	[SiteAddress] [nvarchar](250) NULL,
	[Favorite] [int] NULL,
	[SeeStore] [int] NULL,
	[AddedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.Stores] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoresProducts]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoresProducts](
	[StoresProductId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [nvarchar](128) NULL,
	[ProductId] [int] NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[OffPrice] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[Color] [nvarchar](100) NULL,
	[linkSale] [nvarchar](100) NULL,
	[detail] [nvarchar](100) NULL,
	[AddedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.StoresProducts] PRIMARY KEY CLUSTERED 
(
	[StoresProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreTimes]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreTimes](
	[StoreTimeId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [nvarchar](128) NULL,
	[Days] [nvarchar](50) NULL,
	[fromTime] [nvarchar](50) NULL,
	[toTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.StoreTimes] PRIMARY KEY CLUSTERED 
(
	[StoreTimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Help]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Help](
	[tbl_HelpId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[kihasti] [bit] NULL,
	[kojai] [bit] NULL,
	[chidari] [bit] NULL,
	[kala] [bit] NULL,
	[pishkhan] [bit] NULL,
	[firsttime] [bit] NULL,
 CONSTRAINT [PK_dbo.tbl_Help] PRIMARY KEY CLUSTERED 
(
	[tbl_HelpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketGroups]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketGroups](
	[TicketGroupId] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](50) NULL,
	[chartPostId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.TicketGroups] PRIMARY KEY CLUSTERED 
(
	[TicketGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketMsgs]    Script Date: 3/4/2021 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketMsgs](
	[TicketMsgId] [int] IDENTITY(1,1) NOT NULL,
	[TicketId] [int] NOT NULL,
	[Message] [nvarchar](50) NULL,
	[UserId] [int] NULL,
	[AddedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.TicketMsgs] PRIMARY KEY CLUSTERED 
(
	[TicketMsgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 3/4/2021 11:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[TicketId] [int] IDENTITY(1,1) NOT NULL,
	[TicketGroupId] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[UserId] [int] NOT NULL,
	[AddedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.Tickets] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/4/2021 11:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[ActiveCode] [nvarchar](100) NULL,
	[RoleId] [int] NOT NULL,
	[ISActive] [bit] NULL,
	[Email] [nvarchar](100) NULL,
	[Profile] [nvarchar](50) NULL,
	[MeliID] [nvarchar](50) NULL,
	[BirthDate] [nvarchar](50) NULL,
	[moblie] [nvarchar](50) NULL,
	[phoneNo] [nvarchar](50) NULL,
	[State] [int] NULL,
	[City] [int] NULL,
	[Adress] [nvarchar](50) NULL,
	[chartPostId] [int] NULL,
	[activecodeDate] [datetime] NULL,
	[AddedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
	[UserName] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStores]    Script Date: 3/4/2021 11:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStores](
	[UserStoreId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[StoreId] [nvarchar](128) NULL,
	[AddedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.UserStores] PRIMARY KEY CLUSTERED 
(
	[UserStoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Address_User]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductGroupId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductGroupId] ON [dbo].[AttributGrps]
(
	[ProductGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AttributGrpId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_AttributGrpId] ON [dbo].[AttributItems]
(
	[AttributGrpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StateId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_StateId] ON [dbo].[Cities]
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ComponentId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ComponentId] ON [dbo].[ComponentDesigns]
(
	[ComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ContactModuleId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ContactModuleId] ON [dbo].[ContactModules]
(
	[ContactModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ContactModuleId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ContactModuleId] ON [dbo].[ContactPersons]
(
	[ContactModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[ContactPersons]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductGroupId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductGroupId] ON [dbo].[DetailGroups]
(
	[ProductGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DetailGroupId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_DetailGroupId] ON [dbo].[DetailItems]
(
	[DetailGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HtmlModuleId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_HtmlModuleId] ON [dbo].[HtmlModules]
(
	[HtmlModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MenuGroupId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_MenuGroupId] ON [dbo].[MenuModules]
(
	[MenuGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MenuModuleId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_MenuModuleId] ON [dbo].[MenuModules]
(
	[MenuModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MenuGroupId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_MenuGroupId] ON [dbo].[Menus]
(
	[MenuGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FromUser]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_FromUser] ON [dbo].[Messages]
(
	[FromUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ToUser]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ToUser] ON [dbo].[Messages]
(
	[ToUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MenuId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_MenuId] ON [dbo].[ModulePages]
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ModuleId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ModuleId] ON [dbo].[ModulePages]
(
	[ModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ComponentId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ComponentId] ON [dbo].[Modules]
(
	[ComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PositionId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_PositionId] ON [dbo].[Modules]
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ModuleId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ModuleId] ON [dbo].[MultiPictureItems]
(
	[ModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ModuleId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ModuleId] ON [dbo].[MultiPictureModules]
(
	[ModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NewsGroupId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_NewsGroupId] ON [dbo].[News]
(
	[NewsGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[News]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NewsId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_NewsId] ON [dbo].[NewsComments]
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[NewsComments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NewsId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_NewsId] ON [dbo].[NewsGalleries]
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NewsId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_NewsId] ON [dbo].[NewsTags]
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderId] ON [dbo].[OrderDetails]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductId] ON [dbo].[OrderDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AttributItemId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_AttributItemId] ON [dbo].[Product_Attribut]
(
	[AttributItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductId] ON [dbo].[Product_Attribut]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DetailItemId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_DetailItemId] ON [dbo].[ProductDetails]
(
	[DetailItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductId] ON [dbo].[ProductDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductId] ON [dbo].[ProductGalleries]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductGroupId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductGroupId] ON [dbo].[ProductRequests]
(
	[ProductGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[ProductRequests]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductGroupId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductGroupId] ON [dbo].[Products]
(
	[ProductGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductId] ON [dbo].[ProductTags]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DetailItemId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_DetailItemId] ON [dbo].[RequestDetails]
(
	[DetailItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductRequestId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductRequestId] ON [dbo].[RequestDetails]
(
	[ProductRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StoreId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_StoreId] ON [dbo].[StoreFollowers]
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[StoreFollowers]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StoreId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_StoreId] ON [dbo].[StoreInfoes]
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CityId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_CityId] ON [dbo].[Stores]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductId] ON [dbo].[StoresProducts]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StoreId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_StoreId] ON [dbo].[StoresProducts]
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StoreId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_StoreId] ON [dbo].[StoreTimes]
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[tbl_Help]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_chartPostId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_chartPostId] ON [dbo].[TicketGroups]
(
	[chartPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TicketId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_TicketId] ON [dbo].[TicketMsgs]
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[TicketMsgs]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TicketGroupId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_TicketGroupId] ON [dbo].[Tickets]
(
	[TicketGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Tickets]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_chartPostId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_chartPostId] ON [dbo].[Users]
(
	[chartPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StoreId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_StoreId] ON [dbo].[UserStores]
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/4/2021 11:22:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserStores]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT ('') FOR [NewsContent]
GO
ALTER TABLE [dbo].[NewsComments] ADD  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[Address_User]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Address_User_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Address_User] CHECK CONSTRAINT [FK_dbo.Address_User_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[AttributGrps]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AttributGrps_dbo.ProductGroups_ProductGroupId] FOREIGN KEY([ProductGroupId])
REFERENCES [dbo].[ProductGroups] ([ProductGroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AttributGrps] CHECK CONSTRAINT [FK_dbo.AttributGrps_dbo.ProductGroups_ProductGroupId]
GO
ALTER TABLE [dbo].[AttributItems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AttributItems_dbo.AttributGrps_AttributGrpId] FOREIGN KEY([AttributGrpId])
REFERENCES [dbo].[AttributGrps] ([AttributGrpId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AttributItems] CHECK CONSTRAINT [FK_dbo.AttributItems_dbo.AttributGrps_AttributGrpId]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Cities_dbo.States_StateId] FOREIGN KEY([StateId])
REFERENCES [dbo].[States] ([StateId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_dbo.Cities_dbo.States_StateId]
GO
ALTER TABLE [dbo].[ComponentDesigns]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ComponentDesigns_dbo.Components_ComponentId] FOREIGN KEY([ComponentId])
REFERENCES [dbo].[Components] ([ComponentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ComponentDesigns] CHECK CONSTRAINT [FK_dbo.ComponentDesigns_dbo.Components_ComponentId]
GO
ALTER TABLE [dbo].[ContactModules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ContactModules_dbo.Modules_ContactModuleId] FOREIGN KEY([ContactModuleId])
REFERENCES [dbo].[Modules] ([ModuleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContactModules] CHECK CONSTRAINT [FK_dbo.ContactModules_dbo.Modules_ContactModuleId]
GO
ALTER TABLE [dbo].[ContactPersons]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ContactPersons_dbo.ContactModules_ContactModuleId] FOREIGN KEY([ContactModuleId])
REFERENCES [dbo].[ContactModules] ([ContactModuleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContactPersons] CHECK CONSTRAINT [FK_dbo.ContactPersons_dbo.ContactModules_ContactModuleId]
GO
ALTER TABLE [dbo].[ContactPersons]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ContactPersons_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContactPersons] CHECK CONSTRAINT [FK_dbo.ContactPersons_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[DetailGroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DetailGroups_dbo.ProductGroups_ProductGroupId] FOREIGN KEY([ProductGroupId])
REFERENCES [dbo].[ProductGroups] ([ProductGroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetailGroups] CHECK CONSTRAINT [FK_dbo.DetailGroups_dbo.ProductGroups_ProductGroupId]
GO
ALTER TABLE [dbo].[DetailItems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DetailItems_dbo.DetailGroups_DetailGroupId] FOREIGN KEY([DetailGroupId])
REFERENCES [dbo].[DetailGroups] ([DetailGroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetailItems] CHECK CONSTRAINT [FK_dbo.DetailItems_dbo.DetailGroups_DetailGroupId]
GO
ALTER TABLE [dbo].[HtmlModules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.HtmlModules_dbo.Modules_HtmlModuleId] FOREIGN KEY([HtmlModuleId])
REFERENCES [dbo].[Modules] ([ModuleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HtmlModules] CHECK CONSTRAINT [FK_dbo.HtmlModules_dbo.Modules_HtmlModuleId]
GO
ALTER TABLE [dbo].[MenuModules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MenuModules_dbo.MenuGroups_MenuGroupId] FOREIGN KEY([MenuGroupId])
REFERENCES [dbo].[MenuGroups] ([MenuGroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MenuModules] CHECK CONSTRAINT [FK_dbo.MenuModules_dbo.MenuGroups_MenuGroupId]
GO
ALTER TABLE [dbo].[MenuModules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MenuModules_dbo.Modules_MenuModuleId] FOREIGN KEY([MenuModuleId])
REFERENCES [dbo].[Modules] ([ModuleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MenuModules] CHECK CONSTRAINT [FK_dbo.MenuModules_dbo.Modules_MenuModuleId]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Menus_dbo.MenuGroups_MenuGroupId] FOREIGN KEY([MenuGroupId])
REFERENCES [dbo].[MenuGroups] ([MenuGroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_dbo.Menus_dbo.MenuGroups_MenuGroupId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Messages_dbo.Users_FromUser] FOREIGN KEY([FromUser])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_dbo.Messages_dbo.Users_FromUser]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Messages_dbo.Users_ToUser] FOREIGN KEY([ToUser])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_dbo.Messages_dbo.Users_ToUser]
GO
ALTER TABLE [dbo].[ModulePages]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ModulePages_dbo.Menus_MenuId] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menus] ([MenuId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModulePages] CHECK CONSTRAINT [FK_dbo.ModulePages_dbo.Menus_MenuId]
GO
ALTER TABLE [dbo].[ModulePages]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ModulePages_dbo.Modules_ModuleId] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[Modules] ([ModuleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModulePages] CHECK CONSTRAINT [FK_dbo.ModulePages_dbo.Modules_ModuleId]
GO
ALTER TABLE [dbo].[Modules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Modules_dbo.Components_ComponentId] FOREIGN KEY([ComponentId])
REFERENCES [dbo].[Components] ([ComponentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Modules] CHECK CONSTRAINT [FK_dbo.Modules_dbo.Components_ComponentId]
GO
ALTER TABLE [dbo].[Modules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Modules_dbo.Positions_PositionId] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Positions] ([PositionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Modules] CHECK CONSTRAINT [FK_dbo.Modules_dbo.Positions_PositionId]
GO
ALTER TABLE [dbo].[MultiPictureItems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MultiPictureItems_dbo.MultiPictureModules_ModuleId] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[MultiPictureModules] ([ModuleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MultiPictureItems] CHECK CONSTRAINT [FK_dbo.MultiPictureItems_dbo.MultiPictureModules_ModuleId]
GO
ALTER TABLE [dbo].[MultiPictureModules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MultiPictureModules_dbo.Modules_ModuleId] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[Modules] ([ModuleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MultiPictureModules] CHECK CONSTRAINT [FK_dbo.MultiPictureModules_dbo.Modules_ModuleId]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_dbo.News_dbo.NewsGroups_NewsGroupId] FOREIGN KEY([NewsGroupId])
REFERENCES [dbo].[NewsGroups] ([NewsGroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_dbo.News_dbo.NewsGroups_NewsGroupId]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_dbo.News_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_dbo.News_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[NewsComments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.NewsComments_dbo.News_NewsId] FOREIGN KEY([NewsId])
REFERENCES [dbo].[News] ([NewsId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsComments] CHECK CONSTRAINT [FK_dbo.NewsComments_dbo.News_NewsId]
GO
ALTER TABLE [dbo].[NewsComments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.NewsComments_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[NewsComments] CHECK CONSTRAINT [FK_dbo.NewsComments_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[NewsGalleries]  WITH CHECK ADD  CONSTRAINT [FK_dbo.NewsGalleries_dbo.News_NewsId] FOREIGN KEY([NewsId])
REFERENCES [dbo].[News] ([NewsId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsGalleries] CHECK CONSTRAINT [FK_dbo.NewsGalleries_dbo.News_NewsId]
GO
ALTER TABLE [dbo].[NewsTags]  WITH CHECK ADD  CONSTRAINT [FK_dbo.NewsTags_dbo.News_NewsId] FOREIGN KEY([NewsId])
REFERENCES [dbo].[News] ([NewsId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsTags] CHECK CONSTRAINT [FK_dbo.NewsTags_dbo.News_NewsId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Orders_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_dbo.Orders_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Product_Attribut]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_Attribut_dbo.AttributItems_AttributItemId] FOREIGN KEY([AttributItemId])
REFERENCES [dbo].[AttributItems] ([AttributItemId])
GO
ALTER TABLE [dbo].[Product_Attribut] CHECK CONSTRAINT [FK_dbo.Product_Attribut_dbo.AttributItems_AttributItemId]
GO
ALTER TABLE [dbo].[Product_Attribut]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_Attribut_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product_Attribut] CHECK CONSTRAINT [FK_dbo.Product_Attribut_dbo.Products_ProductId]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductDetails_dbo.DetailItems_DetailItemId] FOREIGN KEY([DetailItemId])
REFERENCES [dbo].[DetailItems] ([DetailItemId])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_dbo.ProductDetails_dbo.DetailItems_DetailItemId]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductDetails_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_dbo.ProductDetails_dbo.Products_ProductId]
GO
ALTER TABLE [dbo].[ProductGalleries]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductGalleries_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductGalleries] CHECK CONSTRAINT [FK_dbo.ProductGalleries_dbo.Products_ProductId]
GO
ALTER TABLE [dbo].[ProductRequests]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductRequests_dbo.ProductGroups_ProductGroupId] FOREIGN KEY([ProductGroupId])
REFERENCES [dbo].[ProductGroups] ([ProductGroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductRequests] CHECK CONSTRAINT [FK_dbo.ProductRequests_dbo.ProductGroups_ProductGroupId]
GO
ALTER TABLE [dbo].[ProductRequests]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductRequests_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductRequests] CHECK CONSTRAINT [FK_dbo.ProductRequests_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.ProductGroups_ProductGroupId] FOREIGN KEY([ProductGroupId])
REFERENCES [dbo].[ProductGroups] ([ProductGroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.ProductGroups_ProductGroupId]
GO
ALTER TABLE [dbo].[ProductTags]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductTags_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductTags] CHECK CONSTRAINT [FK_dbo.ProductTags_dbo.Products_ProductId]
GO
ALTER TABLE [dbo].[RequestDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RequestDetails_dbo.DetailItems_DetailItemId] FOREIGN KEY([DetailItemId])
REFERENCES [dbo].[DetailItems] ([DetailItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RequestDetails] CHECK CONSTRAINT [FK_dbo.RequestDetails_dbo.DetailItems_DetailItemId]
GO
ALTER TABLE [dbo].[RequestDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RequestDetails_dbo.ProductRequests_ProductRequestId] FOREIGN KEY([ProductRequestId])
REFERENCES [dbo].[ProductRequests] ([ProductRequestId])
GO
ALTER TABLE [dbo].[RequestDetails] CHECK CONSTRAINT [FK_dbo.RequestDetails_dbo.ProductRequests_ProductRequestId]
GO
ALTER TABLE [dbo].[StoreFollowers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreFollowers_dbo.Stores_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
GO
ALTER TABLE [dbo].[StoreFollowers] CHECK CONSTRAINT [FK_dbo.StoreFollowers_dbo.Stores_StoreId]
GO
ALTER TABLE [dbo].[StoreFollowers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreFollowers_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StoreFollowers] CHECK CONSTRAINT [FK_dbo.StoreFollowers_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[StoreInfoes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreInfoes_dbo.Stores_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
GO
ALTER TABLE [dbo].[StoreInfoes] CHECK CONSTRAINT [FK_dbo.StoreInfoes_dbo.Stores_StoreId]
GO
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Stores_dbo.Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [FK_dbo.Stores_dbo.Cities_CityId]
GO
ALTER TABLE [dbo].[StoresProducts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoresProducts_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StoresProducts] CHECK CONSTRAINT [FK_dbo.StoresProducts_dbo.Products_ProductId]
GO
ALTER TABLE [dbo].[StoresProducts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoresProducts_dbo.Stores_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
GO
ALTER TABLE [dbo].[StoresProducts] CHECK CONSTRAINT [FK_dbo.StoresProducts_dbo.Stores_StoreId]
GO
ALTER TABLE [dbo].[StoreTimes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreTimes_dbo.Stores_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
GO
ALTER TABLE [dbo].[StoreTimes] CHECK CONSTRAINT [FK_dbo.StoreTimes_dbo.Stores_StoreId]
GO
ALTER TABLE [dbo].[tbl_Help]  WITH CHECK ADD  CONSTRAINT [FK_dbo.tbl_Help_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Help] CHECK CONSTRAINT [FK_dbo.tbl_Help_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[TicketGroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TicketGroups_dbo.chartPosts_chartPostId] FOREIGN KEY([chartPostId])
REFERENCES [dbo].[chartPosts] ([chartPostId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TicketGroups] CHECK CONSTRAINT [FK_dbo.TicketGroups_dbo.chartPosts_chartPostId]
GO
ALTER TABLE [dbo].[TicketMsgs]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TicketMsgs_dbo.Tickets_TicketId] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([TicketId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TicketMsgs] CHECK CONSTRAINT [FK_dbo.TicketMsgs_dbo.Tickets_TicketId]
GO
ALTER TABLE [dbo].[TicketMsgs]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TicketMsgs_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[TicketMsgs] CHECK CONSTRAINT [FK_dbo.TicketMsgs_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Tickets_dbo.TicketGroups_TicketGroupId] FOREIGN KEY([TicketGroupId])
REFERENCES [dbo].[TicketGroups] ([TicketGroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_dbo.Tickets_dbo.TicketGroups_TicketGroupId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Tickets_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_dbo.Tickets_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.chartPosts_chartPostId] FOREIGN KEY([chartPostId])
REFERENCES [dbo].[chartPosts] ([chartPostId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.chartPosts_chartPostId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleId]
GO
ALTER TABLE [dbo].[UserStores]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserStores_dbo.Stores_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
GO
ALTER TABLE [dbo].[UserStores] CHECK CONSTRAINT [FK_dbo.UserStores_dbo.Stores_StoreId]
GO
ALTER TABLE [dbo].[UserStores]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserStores_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserStores] CHECK CONSTRAINT [FK_dbo.UserStores_dbo.Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [koshopir] SET  READ_WRITE 
GO
