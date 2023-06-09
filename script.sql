USE [master]
GO
/****** Object:  Database [SportsDatabase]    Script Date: 9.06.2023 00:08:30 ******/
CREATE DATABASE [SportsDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportsDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SportsDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SportsDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SportsDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SportsDatabase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportsDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportsDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportsDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportsDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportsDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportsDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportsDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SportsDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportsDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportsDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportsDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportsDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportsDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportsDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportsDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportsDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SportsDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportsDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportsDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportsDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportsDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportsDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SportsDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportsDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SportsDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [SportsDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportsDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportsDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportsDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SportsDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SportsDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SportsDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [SportsDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SportsDatabase]
GO
/****** Object:  Table [dbo].[oyuncular]    Script Date: 9.06.2023 00:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oyuncular](
	[oyuncu_id] [int] IDENTITY(1,1) NOT NULL,
	[oyuncu_ad] [nvarchar](50) NULL,
	[oyuncu_soyad] [nvarchar](50) NULL,
	[oyuncu_takım] [nvarchar](50) NULL,
	[oyuncu_yas] [int] NULL,
	[oyuncu_degeri] [int] NULL,
	[atılan_gol] [int] NULL,
	[yapılan_asist] [int] NULL,
	[oync_takım_id] [int] NULL,
 CONSTRAINT [PK_oyuncular] PRIMARY KEY CLUSTERED 
(
	[oyuncu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[takımlar]    Script Date: 9.06.2023 00:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[takımlar](
	[takım_id] [int] IDENTITY(1,1) NOT NULL,
	[takım_adı] [nvarchar](50) NULL,
	[takım_ülke] [nvarchar](50) NULL,
	[takım_bütce] [int] NULL,
	[takım_stad] [nvarchar](50) NULL,
 CONSTRAINT [PK_takımlar] PRIMARY KEY CLUSTERED 
(
	[takım_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[taraftarlar]    Script Date: 9.06.2023 00:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taraftarlar](
	[taraftarid] [int] IDENTITY(1,1) NOT NULL,
	[taraftar_isim] [nvarchar](50) NULL,
	[taraftar_soyisim] [nvarchar](50) NULL,
	[taraftar_yas] [int] NULL,
	[taraftar_takım] [nvarchar](50) NULL,
	[taraftar_telefon] [varchar](11) NULL,
	[taraftar_ülke] [nvarchar](50) NULL,
	[taraftar_takım_id] [int] NULL,
 CONSTRAINT [PK_taraftarlar] PRIMARY KEY CLUSTERED 
(
	[taraftarid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[oyuncular]  WITH CHECK ADD  CONSTRAINT [FK_oyuncular_takımlar1] FOREIGN KEY([oync_takım_id])
REFERENCES [dbo].[takımlar] ([takım_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[oyuncular] CHECK CONSTRAINT [FK_oyuncular_takımlar1]
GO
ALTER TABLE [dbo].[taraftarlar]  WITH CHECK ADD  CONSTRAINT [FK_taraftarlar_takımlar] FOREIGN KEY([taraftar_takım_id])
REFERENCES [dbo].[takımlar] ([takım_id])
GO
ALTER TABLE [dbo].[taraftarlar] CHECK CONSTRAINT [FK_taraftarlar_takımlar]
GO
USE [master]
GO
ALTER DATABASE [SportsDatabase] SET  READ_WRITE 
GO
