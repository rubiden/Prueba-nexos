USE [master]
GO
/****** Object:  Database [NexosDB]    Script Date: 7/01/2022 8:45:11 p. m. ******/
CREATE DATABASE [NexosDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NexosDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\NexosDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NexosDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\NexosDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NexosDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NexosDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NexosDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NexosDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NexosDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NexosDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NexosDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [NexosDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NexosDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NexosDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NexosDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NexosDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NexosDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NexosDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NexosDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NexosDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NexosDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NexosDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NexosDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NexosDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NexosDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NexosDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NexosDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NexosDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NexosDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NexosDB] SET  MULTI_USER 
GO
ALTER DATABASE [NexosDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NexosDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NexosDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NexosDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NexosDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NexosDB] SET QUERY_STORE = OFF
GO
USE [NexosDB]
GO
/****** Object:  Table [dbo].[Autores]    Script Date: 7/01/2022 8:45:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [varchar](250) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[CiudadNacimiento] [varchar](150) NOT NULL,
	[Email] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Autores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editoriales]    Script Date: 7/01/2022 8:45:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editoriales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Direccion] [varchar](250) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[MaximoLibros] [int] NOT NULL,
 CONSTRAINT [PK_Editoriales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 7/01/2022 8:45:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](250) NOT NULL,
	[Anio] [varchar](4) NOT NULL,
	[NumeroPaginas] [int] NOT NULL,
	[IdEditorial] [int] NOT NULL,
	[IdAutor] [int] NOT NULL,
 CONSTRAINT [PK_Libros] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Autores] FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Autores] ([Id])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Autores]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Editoriales] FOREIGN KEY([IdEditorial])
REFERENCES [dbo].[Editoriales] ([Id])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Editoriales]
GO
USE [master]
GO
ALTER DATABASE [NexosDB] SET  READ_WRITE 
GO
