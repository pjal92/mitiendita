USE [master]
GO
/****** Object:  Database [GDA00129-OT+pedroalonzo]    Script Date: 19/12/2024 9:24:55 ******/
CREATE DATABASE [GDA00129-OT+pedroalonzo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GDA00129-OT+pedroalonzo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GDA00129-OT+pedroalonzo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GDA00129-OT+pedroalonzo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GDA00129-OT+pedroalonzo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GDA00129-OT+pedroalonzo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET ARITHABORT OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET  MULTI_USER 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GDA00129-OT+pedroalonzo', N'ON'
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET QUERY_STORE = ON
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GDA00129-OT+pedroalonzo]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoriaproducto] [int] NULL,
	[usuario] [int] NULL,
	[nombre] [varchar](50) NULL,
	[marca] [varchar](50) NULL,
	[codigo] [varchar](50) NULL,
	[stock] [float] NULL,
	[estado] [int] NULL,
	[precio] [float] NULL,
	[fecha_creacion] [datetime] NULL,
	[foto] [binary](50) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[A]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[A]
AS
SELECT COUNT(*) AS TotalProductos
FROM     dbo.Productos INNER JOIN
                  dbo.Estados ON dbo.Productos.estado = dbo.Estados.id
WHERE  (dbo.Estados.nombre = 'Activo') AND (dbo.Productos.stock > 0)
GO
/****** Object:  Table [dbo].[Orden]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [int] NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[nombre_completo] [varchar](100) NULL,
	[direccion] [varchar](300) NULL,
	[telefono] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[fecha_entrega] [date] NULL,
	[total_orden] [float] NULL,
 CONSTRAINT [PK_Orden] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[B]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[B]
AS
SELECT SUM(total_orden) AS Total
FROM     dbo.Orden
WHERE  (fecha_creacion BETWEEN '01-10-2024 00:00:00' AND '31-10-2024 11:59:59')
GO
/****** Object:  View [dbo].[C]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[C]
AS
SELECT TOP (10) PERCENT nombre_completo
FROM     dbo.Orden
ORDER BY total_orden DESC
GO
/****** Object:  Table [dbo].[OrdenDetalles]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenDetalles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orden] [int] NULL,
	[producto] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [float] NULL,
	[subtotal] [float] NULL,
 CONSTRAINT [PK_OrdenDetalles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[D]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[D]
AS
SELECT TOP (10) dbo.Productos.nombre, SUM(dbo.OrdenDetalles.cantidad) AS cantidad
FROM     dbo.OrdenDetalles INNER JOIN
                  dbo.Productos ON dbo.OrdenDetalles.producto = dbo.Productos.id
GROUP BY dbo.Productos.nombre
ORDER BY cantidad
GO
/****** Object:  Table [dbo].[CategoriaProductos]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaProductos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [int] NULL,
	[nombre] [varchar](50) NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
 CONSTRAINT [PK_CategoriaProductos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](250) NULL,
	[nombre_comercial] [varchar](250) NULL,
	[direccion_entrega] [varchar](100) NULL,
	[telefono] [varchar](50) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rol] [int] NULL,
	[estado] [int] NULL,
	[email] [varchar](100) NULL,
	[nombre_completo] [varchar](100) NULL,
	[password] [varchar](100) NULL,
	[telefono] [varchar](50) NULL,
	[fecha_nacimiento] [date] NULL,
	[fecha_creacion] [datetime] NULL,
	[cliente] [int] NULL,
	[direccion] [varchar](200) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CategoriaProductos]  WITH CHECK ADD  CONSTRAINT [FK_CategoriaProductos_Estados] FOREIGN KEY([estado])
REFERENCES [dbo].[Estados] ([id])
GO
ALTER TABLE [dbo].[CategoriaProductos] CHECK CONSTRAINT [FK_CategoriaProductos_Estados]
GO
ALTER TABLE [dbo].[CategoriaProductos]  WITH CHECK ADD  CONSTRAINT [FK_CategoriaProductos_Usuarios] FOREIGN KEY([usuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[CategoriaProductos] CHECK CONSTRAINT [FK_CategoriaProductos_Usuarios]
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Estados] FOREIGN KEY([estado])
REFERENCES [dbo].[Estados] ([id])
GO
ALTER TABLE [dbo].[Orden] CHECK CONSTRAINT [FK_Orden_Estados]
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Usuarios] FOREIGN KEY([usuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Orden] CHECK CONSTRAINT [FK_Orden_Usuarios]
GO
ALTER TABLE [dbo].[OrdenDetalles]  WITH CHECK ADD  CONSTRAINT [FK_OrdenDetalles_Orden] FOREIGN KEY([orden])
REFERENCES [dbo].[Orden] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdenDetalles] CHECK CONSTRAINT [FK_OrdenDetalles_Orden]
GO
ALTER TABLE [dbo].[OrdenDetalles]  WITH CHECK ADD  CONSTRAINT [FK_OrdenDetalles_Productos] FOREIGN KEY([producto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[OrdenDetalles] CHECK CONSTRAINT [FK_OrdenDetalles_Productos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_CategoriaProductos] FOREIGN KEY([categoriaproducto])
REFERENCES [dbo].[CategoriaProductos] ([id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_CategoriaProductos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Estados] FOREIGN KEY([estado])
REFERENCES [dbo].[Estados] ([id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Estados]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Usuarios] FOREIGN KEY([usuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Clientes] FOREIGN KEY([cliente])
REFERENCES [dbo].[Clientes] ([id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Clientes]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Estados] FOREIGN KEY([estado])
REFERENCES [dbo].[Estados] ([id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Estados]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Rol] FOREIGN KEY([rol])
REFERENCES [dbo].[Rol] ([id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Rol]
GO
/****** Object:  StoredProcedure [dbo].[SPICatProductos]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPICatProductos]
	@usuario INT,
	@nombre VARCHAR(50),
	@estado INT,
	@fecha_creacion DATETIME
AS
BEGIN
	INSERT INTO CategoriaProductos(usuario,nombre,estado,fecha_creacion)
	VALUES (@usuario,@nombre,@estado,@fecha_creacion);
END


GO
/****** Object:  StoredProcedure [dbo].[SPIClientes]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPIClientes]
	@razon_social VARCHAR(250),
	@nombre_comercial VARCHAR(250),
	@direccion_entrega VARCHAR(100),
	@telefono VARCHAR(50),
	@email VARCHAR(50)
AS
BEGIN
	INSERT INTO Clientes(razon_social,nombre_comercial,direccion_entrega,telefono,email)
	VALUES (@razon_social,@nombre_comercial,@direccion_entrega,@telefono,@email);
END



GO
/****** Object:  StoredProcedure [dbo].[SPIEstados]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPIEstados]
	@nombre VARCHAR(50)
AS
BEGIN
	INSERT INTO Estados(nombre)
	VALUES (@nombre);
END


GO
/****** Object:  StoredProcedure [dbo].[SPIOrdenConDetalles]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPIOrdenConDetalles]
	@usuario INT,
	@fecha_entrega DATETIME,
	@detalles NVARCHAR(MAX)
AS
BEGIN
	BEGIN TRANSACTION;
	BEGIN TRY;
	
	DECLARE @idOrden INT;

	INSERT INTO Orden(usuario, estado, nombre_completo, direccion, telefono, email, fecha_creacion, fecha_entrega)
	SELECT TOP 1 u.id as usuario, (SELECT id FROM estados WHERE nombre='Confirmado'), u.nombre_completo, u.direccion, u.telefono, u.email, GETUTCDATE(), @fecha_entrega FROM Usuarios as u WHERE u.id=@usuario

SET @idOrden = SCOPE_IDENTITY();

INSERT INTO OrdenDetalles(orden, producto, cantidad, precio, subtotal)

SELECT @idOrden, producto, cantidad, precio, subtotal
	FROM OPENJSON(@detalles)
	WITH(producto INT, cantidad INT, precio FLOAT, subtotal FLOAT);

UPDATE Orden
SET total_orden = (
	SELECT SUM(subtotal)
	FROM OrdenDetalles
	WHERE orden=@idOrden
)
WHERE id=@idOrden;
COMMIT;
END TRY
BEGIN CATCH;
ROLLBACK;
THROW;
END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[SPIProductos]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPIProductos]
	@categoriaproducto INT,
	@usuario INT,
	@nombre VARCHAR(50),
	@marca VARCHAR(50),
	@codigo VARCHAR(50),
	@stock FLOAT,
	@estado INT,
	@precio FLOAT,
	@fecha_creacion DATETIME,
	@foto BINARY
AS
BEGIN
	INSERT INTO Productos(categoriaproducto,usuario,nombre,marca,codigo,stock,estado,precio,fecha_creacion,foto)
	VALUES (@categoriaproducto,@usuario,@nombre,@marca,@codigo,@stock,@estado,@precio,@fecha_creacion,@foto);
END
GO
/****** Object:  StoredProcedure [dbo].[SPIUsuarios]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPIUsuarios]
	@rol INT,
	@estado INT,
	@email VARCHAR(100),
	@nombre_completo VARCHAR(100),
	@password VARCHAR(100),
	@telefono VARCHAR(50),
	@fecha_nacimiento DATE,
	@fecha_creacion DATETIME,
	@cliente INT
AS
BEGIN
	INSERT INTO Usuarios(rol,estado,email,nombre_completo,password,telefono,fecha_nacimiento,fecha_creacion,cliente)
	VALUES (@rol,@estado,@email,@nombre_completo,CONVERT(varchar(100),@password),@telefono,@fecha_nacimiento,@fecha_creacion,@cliente);
END
GO
/****** Object:  StoredProcedure [dbo].[SPUCatProductos]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUCatProductos]
	@id INT,
	@usuario INT,
	@nombre VARCHAR(50),
	@estado INT,
	@fecha_creacion DATETIME
AS
BEGIN
	UPDATE CategoriaProductos SET usuario=@usuario,nombre=@nombre,estado=@estado,fecha_creacion=@fecha_creacion where id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[SPUClientes]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUClientes]
	@id INT,
	@razon_social VARCHAR(250),
	@nombre_comercial VARCHAR(250),
	@direccion_entrega VARCHAR(100),
	@telefono VARCHAR(50),
	@email VARCHAR(50)
AS
BEGIN
	UPDATE Clientes set razon_social=@razon_social,nombre_comercial=@nombre_comercial,direccion_entrega=@direccion_entrega,telefono=@telefono,email=@email where id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[SPUEstadoProductos]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUEstadoProductos]
	@idproducto INT,
	@idestado INT
AS
BEGIN
	UPDATE Productos SET estado=@idestado WHERE id=@idproducto;
END
GO
/****** Object:  StoredProcedure [dbo].[SPUEstados]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUEstados]
	@id INT,
	@nombre VARCHAR(50)
AS
BEGIN
	UPDATE CategoriaProductos SET nombre=@nombre where id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[SPUOrdenConDetalles]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUOrdenConDetalles]
	@id INT,
	@detalles NVARCHAR(MAX)
AS
BEGIN
	BEGIN TRANSACTION;
	BEGIN TRY;

DELETE FROM OrdenDetalles WHERE orden=@id;

INSERT INTO OrdenDetalles(orden, producto, cantidad, precio, subtotal)

SELECT @id, producto, cantidad, precio, subtotal
	FROM OPENJSON(@detalles)
	WITH(producto INT, cantidad INT, precio FLOAT, subtotal FLOAT);

UPDATE Orden
SET total_orden = (
	SELECT SUM(subtotal)
	FROM OrdenDetalles
	WHERE orden=@id
)
WHERE id=@id;
COMMIT;
END TRY
BEGIN CATCH;
ROLLBACK;
THROW;
END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[SPUProductos]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUProductos]
	@id INT,
	@categoriaproducto INT,
	@usuario INT,
	@nombre VARCHAR(50),
	@marca VARCHAR(50),
	@codigo VARCHAR(50),
	@stock FLOAT,
	@estado INT,
	@precio FLOAT,
	@fecha_creacion DATETIME,
	@foto BINARY
AS
BEGIN
	UPDATE Productos SET categoriaproducto=@categoriaproducto,usuario=@usuario,nombre=@nombre,marca=@marca,codigo=@codigo,stock=@stock,estado=@estado,precio=@precio,fecha_creacion=@fecha_creacion,foto=@foto where id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[SPUUsuarios]    Script Date: 19/12/2024 9:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUUsuarios]
	@id INT,
	@rol INT,
	@estado INT,
	@email VARCHAR(100),
	@nombre_completo VARCHAR(100),
	@password VARCHAR(100),
	@telefono VARCHAR(50),
	@fecha_nacimiento DATE,
	@fecha_creacion DATETIME,
	@cliente INT
AS
BEGIN
	UPDATE Usuarios set rol=@rol,estado=@estado,email=@email,nombre_completo=@nombre_completo,password=CONVERT(varchar(50),@password),telefono=@telefono,fecha_nacimiento=@fecha_creacion,fecha_creacion=@fecha_creacion,cliente=@cliente where id=@id;
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Productos"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "Estados"
            Begin Extent = 
               Top = 7
               Left = 315
               Bottom = 126
               Right = 509
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orden"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 6
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'B'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'B'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orden"
            Begin Extent = 
               Top = 7
               Left = 314
               Bottom = 170
               Right = 531
            End
            DisplayFlags = 280
            TopColumn = 6
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'C'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'C'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Productos"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrdenDetalles"
            Begin Extent = 
               Top = 7
               Left = 315
               Bottom = 170
               Right = 509
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'D'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'D'
GO
USE [master]
GO
ALTER DATABASE [GDA00129-OT+pedroalonzo] SET  READ_WRITE 
GO
