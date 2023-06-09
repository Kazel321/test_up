USE [master]
GO
/****** Object:  Database [Cinema]    Script Date: 11.12.2022 18:02:08 ******/
CREATE DATABASE [Cinema]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cinema', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\Cinema.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cinema_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\Cinema_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Cinema] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cinema].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cinema] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cinema] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cinema] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cinema] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cinema] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cinema] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cinema] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cinema] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cinema] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cinema] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cinema] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cinema] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cinema] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cinema] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cinema] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cinema] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cinema] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cinema] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cinema] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cinema] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cinema] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cinema] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cinema] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cinema] SET  MULTI_USER 
GO
ALTER DATABASE [Cinema] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cinema] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cinema] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cinema] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cinema] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cinema] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Cinema] SET QUERY_STORE = OFF
GO
USE [Cinema]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 11.12.2022 18:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] NOT NULL,
	[CountryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Film]    Script Date: 11.12.2022 18:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film](
	[FilmId] [int] NOT NULL,
	[FilmName] [nvarchar](max) NOT NULL,
	[CountryId] [int] NOT NULL,
	[MinAgeId] [int] NOT NULL,
	[FilmDuration] [char](5) NOT NULL,
	[FilmDescription] [nvarchar](max) NOT NULL,
	[FilmYear] [int] NOT NULL,
	[FilmCover] [image] NULL,
 CONSTRAINT [PK_Film] PRIMARY KEY CLUSTERED 
(
	[FilmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmGenre]    Script Date: 11.12.2022 18:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmGenre](
	[FilmId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
 CONSTRAINT [PK_FilmGenre] PRIMARY KEY CLUSTERED 
(
	[FilmId] ASC,
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 11.12.2022 18:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreId] [int] NOT NULL,
	[GenreName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hall]    Script Date: 11.12.2022 18:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hall](
	[HallId] [int] NOT NULL,
	[HallLocation] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Hall] PRIMARY KEY CLUSTERED 
(
	[HallId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 11.12.2022 18:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[LoginId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[LoginDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MinAge]    Script Date: 11.12.2022 18:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MinAge](
	[MinAgeId] [int] NOT NULL,
	[MinAgeValue] [tinyint] NOT NULL,
 CONSTRAINT [PK_MinAge] PRIMARY KEY CLUSTERED 
(
	[MinAgeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Place]    Script Date: 11.12.2022 18:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Place](
	[PlaceId] [int] NOT NULL,
	[HallId] [int] NOT NULL,
	[Row] [int] NOT NULL,
	[PlaceTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Place] PRIMARY KEY CLUSTERED 
(
	[PlaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaceType]    Script Date: 11.12.2022 18:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaceType](
	[PlaceTypeId] [int] NOT NULL,
	[PlaceTypeName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PlaceType] PRIMARY KEY CLUSTERED 
(
	[PlaceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11.12.2022 18:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Row]    Script Date: 11.12.2022 18:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Row](
	[RowId] [int] NOT NULL,
	[HallId] [int] NOT NULL,
 CONSTRAINT [PK_Row] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Screenshot]    Script Date: 11.12.2022 18:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Screenshot](
	[ScreenshotId] [int] NOT NULL,
	[FilmId] [int] NOT NULL,
	[ScreenshotImage] [image] NOT NULL,
 CONSTRAINT [PK_Screenshot] PRIMARY KEY CLUSTERED 
(
	[ScreenshotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seance]    Script Date: 11.12.2022 18:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seance](
	[SeanceId] [int] NOT NULL,
	[FilmId] [int] NOT NULL,
	[HallId] [int] NOT NULL,
	[SeanceDate] [date] NOT NULL,
	[SeanceTime] [char](5) NOT NULL,
	[SeanceCost] [float] NOT NULL,
 CONSTRAINT [PK_Seance] PRIMARY KEY CLUSTERED 
(
	[SeanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 11.12.2022 18:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketId] [int] NOT NULL,
	[SeanceId] [int] NOT NULL,
	[TicketDateTime] [datetime] NOT NULL,
	[PlaceId] [int] NOT NULL,
	[TicketCost] [float] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11.12.2022 18:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserEmail] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserLastName] [nvarchar](max) NOT NULL,
	[UserFirstName] [nvarchar](max) NOT NULL,
	[UserPatronymic] [nvarchar](max) NOT NULL,
	[UserPhoneNumber] [char](15) NOT NULL,
	[UserBirthDate] [date] NOT NULL,
	[UserActive] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (1, N'Абхазия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (2, N'Австралия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (3, N'Австрия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (4, N'Азербайджан')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (5, N'Албания')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (6, N'Алжир')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (7, N'Ангола')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (8, N'Андорра')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (9, N'Антигуа и Барбуда')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (10, N'Аргентина')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (11, N'Армения')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (12, N'Афганистан')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (13, N'Багамские Острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (14, N'Бангладеш')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (15, N'Барбадос')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (16, N'Бахрейн')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (17, N'Белиз')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (18, N'Белоруссия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (19, N'Бельгия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (20, N'Бенин')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (21, N'Болгария')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (22, N'Боливия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (23, N'Босния и Герцеговина')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (24, N'Ботсвана')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (25, N'Бразилия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (26, N'Бруней')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (27, N'Буркина-Фасо')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (28, N'Бурунди')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (29, N'Бутан')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (30, N'Вануату')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (31, N'Ватикан')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (32, N'Великобритания')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (33, N'Венгрия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (34, N'Венесуэла')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (35, N'Восточный Тимор')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (36, N'Вьетнам')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (37, N'Габон')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (38, N'Гаити')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (39, N'Гайана')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (40, N'Гамбия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (41, N'Гана')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (42, N'Гватемала')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (43, N'Гвинея')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (44, N'Гвинея-Бисау')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (45, N'Германия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (46, N'Гондурас')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (47, N'Государство Палестина')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (48, N'Гренада')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (49, N'Греция')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (50, N'Грузия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (51, N'Дания')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (52, N'Джибути')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (53, N'Доминика')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (54, N'Доминиканская Республика')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (55, N'ДР Конго')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (56, N'Египет')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (57, N'Замбия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (58, N'Зимбабве')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (59, N'Израиль')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (60, N'Индия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (61, N'Индонезия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (62, N'Иордания')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (63, N'Ирак')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (64, N'Иран')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (65, N'Ирландия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (66, N'Исландия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (67, N'Испания')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (68, N'Италия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (69, N'Йемен')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (70, N'Кабо-Верде')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (71, N'Казахстан')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (72, N'Камбоджа')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (73, N'Камерун')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (74, N'Канада')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (75, N'Катар')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (76, N'Кения')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (77, N'Кипр')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (78, N'Киргизия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (79, N'Кирибати')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (80, N'Китай')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (81, N'КНДР')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (82, N'Колумбия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (83, N'Коморские Острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (84, N'Коста-Рика')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (85, N'Кот-д''Ивуар')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (86, N'Куба')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (87, N'Кувейт')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (88, N'Лаос')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (89, N'Латвия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (90, N'Лесото')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (91, N'Либерия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (92, N'Ливан')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (93, N'Ливия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (94, N'Литва')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (95, N'Лихтенштейн')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (96, N'Люксембург')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (97, N'Маврикий')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (98, N'Мавритания')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (99, N'Мадагаскар')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (100, N'Малави')
GO
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (101, N'Малайзия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (102, N'Мали')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (103, N'Мальдивские Острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (104, N'Мальта')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (105, N'Марокко')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (106, N'Маршалловы Острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (107, N'Мексика')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (108, N'Мозамбик')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (109, N'Молдавия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (110, N'Монако')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (111, N'Монголия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (112, N'Мьянма')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (113, N'Намибия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (114, N'Науру')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (115, N'Непал')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (116, N'Нигер')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (117, N'Нигерия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (118, N'Нидерланды')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (119, N'Никарагуа')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (120, N'Новая Зеландия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (121, N'Норвегия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (122, N'ОАЭ')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (123, N'Оман')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (124, N'Пакистан')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (125, N'Палау')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (126, N'Панама')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (127, N'Папуа - Новая Гвинея')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (128, N'Парагвай')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (129, N'Перу')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (130, N'Польша')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (131, N'Португалия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (132, N'Республика Конго')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (133, N'Республика Корея')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (134, N'Россия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (135, N'Руанда')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (136, N'Румыния')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (137, N'Сальвадор')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (138, N'Самоа')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (139, N'Сан-Марино')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (140, N'Сан-Томе и Принсипи')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (141, N'Саудовская Аравия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (142, N'Северная Македония')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (143, N'Сейшельские Острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (144, N'Сенегал')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (145, N'Сент-Винсент и Гренадины')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (146, N'Сент-Китс и Невис')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (147, N'Сент-Люсия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (148, N'Сербия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (149, N'Сингапур')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (150, N'Сирия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (151, N'Словакия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (152, N'Словения')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (153, N'Соломоновы Острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (154, N'Сомали')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (155, N'Судан')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (156, N'Суринам')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (157, N'США')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (158, N'Сьерра-Леоне')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (159, N'Таджикистан')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (160, N'Таиланд')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (161, N'Танзания')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (162, N'Того')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (163, N'Тонга')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (164, N'Тринидад и Тобаго')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (165, N'Тувалу')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (166, N'Тунис')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (167, N'Туркмения')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (168, N'Турция')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (169, N'Уганда')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (170, N'Узбекистан')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (171, N'Украина')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (172, N'Уругвай')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (173, N'Федеративные Штаты Микронезии')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (174, N'Фиджи')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (175, N'Филиппины')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (176, N'Финляндия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (177, N'Франция')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (178, N'Хорватия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (179, N'ЦАР')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (180, N'Чад')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (181, N'Черногория')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (182, N'Чехия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (183, N'Чили')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (184, N'Швейцария')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (185, N'Швеция')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (186, N'Шри-Ланка')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (187, N'Эквадор')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (188, N'Экваториальная Гвинея')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (189, N'Эритрея')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (190, N'Эсватини')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (191, N'Эстония')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (192, N'Эфиопия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (193, N'ЮАР')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (194, N'Южная Осетия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (195, N'Южный Судан')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (196, N'Ямайка')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (197, N'Япония')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (198, N'Авдаленд')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (199, N'Азавад')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (200, N'Азад Джамму и Кашмир')
GO
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (201, N'Азания')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (202, N'Вазиристан')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (203, N'Галмудуг')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (204, N'Государство Ва')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (205, N'Государство Шан')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (206, N'Джубаленд')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (207, N'Донецкая Народная Республика')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (208, N'Китайская Республика')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (209, N'Луганская Народная Республика')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (210, N'Мальтийский орден')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (211, N'Нагорно-Карабахская Республика')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (212, N'Приднестровская Молдавская Республика')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (213, N'Пунтленд')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (214, N'Республика Косово')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (215, N'Сахарская Арабская Демократическая Республика')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (216, N'Силенд')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (217, N'Сомалиленд')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (218, N'Турецкая Республика Северного Кипра')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (219, N'Химан и Хеб')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (220, N'Азорские острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (221, N'Аландские острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (222, N'Американское Самоа')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (223, N'Ангилья')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (224, N'Антарктида')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (225, N'Аруба')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (226, N'Бермудские острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (227, N'Бир-Тавиль')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (228, N'Бонэйр')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (229, N'Британская территория в Индийском океане')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (230, N'Британские Виргинские острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (231, N'Виргинские острова США')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (232, N'Гавайи')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (233, N'Гваделупа')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (234, N'Гвиана')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (235, N'Гернси')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (236, N'Гибралтар')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (237, N'Голанские высоты')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (238, N'Гонконг')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (239, N'Гренландия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (240, N'Гуам')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (241, N'Джерси')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (242, N'Каймановы острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (243, N'Канарские острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (244, N'Кокосовые острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (245, N'Кука острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (246, N'Кюрасао')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (247, N'Мадейра')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (248, N'Майотта')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (249, N'Макао')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (250, N'Мартиника')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (251, N'Мелилья')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (252, N'Монтсеррат')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (253, N'Ниуэ')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (254, N'Новая Каледония')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (255, N'Остров Мэн')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (256, N'Остров Норфолк')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (257, N'Остров Рождества')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (258, N'Острова Питкэрн')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (259, N'Острова Святой Елены, Вознесения и Тристан-да-Кунья')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (260, N'Пуэрто-Рико')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (261, N'Реюньон')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (262, N'Саба')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (263, N'Северные Марианские острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (264, N'Сен-Бартелеми')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (265, N'Сен-Мартен')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (266, N'Сен-Пьер и Микелон')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (267, N'Сеута')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (268, N'Синт-Мартен')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (269, N'Синт-Эстатиус')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (270, N'Теркс и Кайкос')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (271, N'Токелау')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (272, N'Уоллис и Футуна')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (273, N'Фарерские острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (274, N'Фолклендские острова')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (275, N'Французская Полинезия')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (276, N'Французские Южные и Антарктические территории')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (277, N'Шпицберген')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (278, N'Южная Георгия и Южные Сандвичевы острова')
GO
INSERT [dbo].[Film] ([FilmId], [FilmName], [CountryId], [MinAgeId], [FilmDuration], [FilmDescription], [FilmYear], [FilmCover]) VALUES (1, N'Побег из Шоушенка', 157, 4, N'02:22', N'Бухгалтер Энди Дюфрейн обвинён в убийстве собственной жены и её любовника. Оказавшись в тюрьме под названием Шоушенк, он сталкивается с жестокостью и беззаконием, царящими по обе стороны решётки. Каждый, кто попадает в эти стены, становится их рабом до конца жизни. Но Энди, обладающий живым умом и доброй душой, находит подход как к заключённым, так и к охранникам, добиваясь их особого к себе расположения.', 1994, NULL)
INSERT [dbo].[Film] ([FilmId], [FilmName], [CountryId], [MinAgeId], [FilmDuration], [FilmDescription], [FilmYear], [FilmCover]) VALUES (2, N'Король Лев', 157, 1, N'01:28', N'У величественного Короля-Льва Муфасы рождается наследник по имени Симба. Уже в детстве любознательный малыш становится жертвой интриг своего завистливого дяди Шрама, мечтающего о власти.

Симба познаёт горе утраты, предательство и изгнание, но в конце концов обретает верных друзей и находит любимую. Закалённый испытаниями, он в нелёгкой борьбе отвоёвывает своё законное место в «Круге жизни», осознав, что значит быть настоящим Королём.', 1994, NULL)
GO
INSERT [dbo].[FilmGenre] ([FilmId], [GenreId]) VALUES (1, 15)
INSERT [dbo].[FilmGenre] ([FilmId], [GenreId]) VALUES (2, 2)
INSERT [dbo].[FilmGenre] ([FilmId], [GenreId]) VALUES (2, 9)
INSERT [dbo].[FilmGenre] ([FilmId], [GenreId]) VALUES (2, 12)
INSERT [dbo].[FilmGenre] ([FilmId], [GenreId]) VALUES (2, 15)
INSERT [dbo].[FilmGenre] ([FilmId], [GenreId]) VALUES (2, 25)
GO
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (1, N'Комедии')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (2, N'Мультфильмы')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (3, N'Ужасы')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (4, N'Фантастика')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (5, N'Триллеры')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (6, N'Боевики')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (7, N'Мелодрамы')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (8, N'Детективы')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (9, N'Приключения')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (10, N'Фэнтези')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (11, N'Военные')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (12, N'Семейные')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (13, N'Аниме')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (14, N'Исторические')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (15, N'Драмы')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (16, N'Документальные')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (17, N'Детские')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (18, N'Криминал')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (19, N'Биографии')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (20, N'Вестерны')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (21, N'Фильмы-нуар')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (22, N'Спортивные')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (23, N'Короткометражки')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (24, N'Музыкальные')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (25, N'Мюзиклы')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (26, N'Ток-шоу')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (27, N'Игры')
GO
INSERT [dbo].[Hall] ([HallId], [HallLocation]) VALUES (1, N'Север')
GO
INSERT [dbo].[MinAge] ([MinAgeId], [MinAgeValue]) VALUES (1, 0)
INSERT [dbo].[MinAge] ([MinAgeId], [MinAgeValue]) VALUES (2, 6)
INSERT [dbo].[MinAge] ([MinAgeId], [MinAgeValue]) VALUES (3, 12)
INSERT [dbo].[MinAge] ([MinAgeId], [MinAgeValue]) VALUES (4, 16)
INSERT [dbo].[MinAge] ([MinAgeId], [MinAgeValue]) VALUES (5, 18)
GO
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (2, 1, 1, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (3, 1, 1, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (4, 1, 1, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (5, 1, 1, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (6, 1, 2, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (7, 1, 2, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (8, 1, 2, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (9, 1, 2, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (10, 1, 2, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (11, 1, 3, 2)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (12, 1, 3, 2)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (13, 1, 3, 2)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (14, 1, 3, 2)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (15, 1, 3, 2)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (16, 1, 4, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (17, 1, 4, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (18, 1, 4, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (19, 1, 4, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (20, 1, 4, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (21, 1, 5, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (22, 1, 5, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (23, 1, 5, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (24, 1, 5, 1)
INSERT [dbo].[Place] ([PlaceId], [HallId], [Row], [PlaceTypeId]) VALUES (25, 1, 5, 1)
GO
INSERT [dbo].[PlaceType] ([PlaceTypeId], [PlaceTypeName]) VALUES (1, N'Стандартное')
INSERT [dbo].[PlaceType] ([PlaceTypeId], [PlaceTypeName]) VALUES (2, N'VIP')
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Оператор')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Администратор')
GO
INSERT [dbo].[Row] ([RowId], [HallId]) VALUES (1, 1)
INSERT [dbo].[Row] ([RowId], [HallId]) VALUES (2, 1)
INSERT [dbo].[Row] ([RowId], [HallId]) VALUES (3, 1)
INSERT [dbo].[Row] ([RowId], [HallId]) VALUES (4, 1)
INSERT [dbo].[Row] ([RowId], [HallId]) VALUES (5, 1)
GO
INSERT [dbo].[Seance] ([SeanceId], [FilmId], [HallId], [SeanceDate], [SeanceTime], [SeanceCost]) VALUES (1, 1, 1, CAST(N'2023-08-30' AS Date), N'14:30', 500)
INSERT [dbo].[Seance] ([SeanceId], [FilmId], [HallId], [SeanceDate], [SeanceTime], [SeanceCost]) VALUES (2, 1, 1, CAST(N'2023-08-27' AS Date), N'20:00', 350)
INSERT [dbo].[Seance] ([SeanceId], [FilmId], [HallId], [SeanceDate], [SeanceTime], [SeanceCost]) VALUES (3, 2, 1, CAST(N'2023-08-27' AS Date), N'16:00', 400)
GO
INSERT [dbo].[User] ([UserId], [RoleId], [UserLogin], [UserEmail], [UserPassword], [UserLastName], [UserFirstName], [UserPatronymic], [UserPhoneNumber], [UserBirthDate], [UserActive]) VALUES (1, 1, N'123', N'123@mail.ru', N'123', N'Test', N'Test', N'Test', N'+79815751324   ', CAST(N'1999-01-01' AS Date), 1)
GO
ALTER TABLE [dbo].[Film]  WITH CHECK ADD  CONSTRAINT [FK_Film_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Film] CHECK CONSTRAINT [FK_Film_Country]
GO
ALTER TABLE [dbo].[Film]  WITH CHECK ADD  CONSTRAINT [FK_Film_MinAge] FOREIGN KEY([MinAgeId])
REFERENCES [dbo].[MinAge] ([MinAgeId])
GO
ALTER TABLE [dbo].[Film] CHECK CONSTRAINT [FK_Film_MinAge]
GO
ALTER TABLE [dbo].[FilmGenre]  WITH CHECK ADD  CONSTRAINT [FK_FilmGenre_Film] FOREIGN KEY([FilmId])
REFERENCES [dbo].[Film] ([FilmId])
GO
ALTER TABLE [dbo].[FilmGenre] CHECK CONSTRAINT [FK_FilmGenre_Film]
GO
ALTER TABLE [dbo].[FilmGenre]  WITH CHECK ADD  CONSTRAINT [FK_FilmGenre_Genre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([GenreId])
GO
ALTER TABLE [dbo].[FilmGenre] CHECK CONSTRAINT [FK_FilmGenre_Genre]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_User]
GO
ALTER TABLE [dbo].[Place]  WITH CHECK ADD  CONSTRAINT [FK_Place_Hall] FOREIGN KEY([HallId])
REFERENCES [dbo].[Hall] ([HallId])
GO
ALTER TABLE [dbo].[Place] CHECK CONSTRAINT [FK_Place_Hall]
GO
ALTER TABLE [dbo].[Place]  WITH CHECK ADD  CONSTRAINT [FK_Place_PlaceType] FOREIGN KEY([PlaceTypeId])
REFERENCES [dbo].[PlaceType] ([PlaceTypeId])
GO
ALTER TABLE [dbo].[Place] CHECK CONSTRAINT [FK_Place_PlaceType]
GO
ALTER TABLE [dbo].[Row]  WITH CHECK ADD  CONSTRAINT [FK_Row_Hall] FOREIGN KEY([HallId])
REFERENCES [dbo].[Hall] ([HallId])
GO
ALTER TABLE [dbo].[Row] CHECK CONSTRAINT [FK_Row_Hall]
GO
ALTER TABLE [dbo].[Screenshot]  WITH CHECK ADD  CONSTRAINT [FK_Screenshot_Film] FOREIGN KEY([FilmId])
REFERENCES [dbo].[Film] ([FilmId])
GO
ALTER TABLE [dbo].[Screenshot] CHECK CONSTRAINT [FK_Screenshot_Film]
GO
ALTER TABLE [dbo].[Seance]  WITH CHECK ADD  CONSTRAINT [FK_Seance_Film] FOREIGN KEY([FilmId])
REFERENCES [dbo].[Film] ([FilmId])
GO
ALTER TABLE [dbo].[Seance] CHECK CONSTRAINT [FK_Seance_Film]
GO
ALTER TABLE [dbo].[Seance]  WITH CHECK ADD  CONSTRAINT [FK_Seance_Hall] FOREIGN KEY([HallId])
REFERENCES [dbo].[Hall] ([HallId])
GO
ALTER TABLE [dbo].[Seance] CHECK CONSTRAINT [FK_Seance_Hall]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Place] FOREIGN KEY([PlaceId])
REFERENCES [dbo].[Place] ([PlaceId])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Place]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Seance] FOREIGN KEY([SeanceId])
REFERENCES [dbo].[Seance] ([SeanceId])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Seance]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Cinema] SET  READ_WRITE 
GO
