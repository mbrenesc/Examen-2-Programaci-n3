USE [SOLICITUDES_TECNICAS]
GO
/****** Object:  Table [dbo].[ASIGNACIONES]    Script Date: 20/11/2023 17:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASIGNACIONES](
	[AsignacionID] [int] IDENTITY(1,1) NOT NULL,
	[ReparacionID] [int] NULL,
	[TecnicoID] [int] NULL,
	[FechaAsignacion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[AsignacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLESREPARACION]    Script Date: 20/11/2023 17:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLESREPARACION](
	[DetalleID] [int] IDENTITY(1,1) NOT NULL,
	[ReparacionID] [int] NULL,
	[Descripcion] [varchar](50) NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EQUIPOS]    Script Date: 20/11/2023 17:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQUIPOS](
	[EquipoID] [int] IDENTITY(1,1) NOT NULL,
	[TipoEquipo] [varchar](50) NOT NULL,
	[Modelo] [varchar](50) NULL,
	[UsuarioID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EquipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPARACIONES]    Script Date: 20/11/2023 17:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPARACIONES](
	[ReparacionID] [int] IDENTITY(1,1) NOT NULL,
	[EquipoID] [int] NULL,
	[FechaSolicitud] [date] NULL,
	[Estado] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReparacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TECNICOS]    Script Date: 20/11/2023 17:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TECNICOS](
	[TecnicoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Especialidad] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TecnicoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 20/11/2023 17:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[CorreoElectronico] [varchar](50) NULL,
	[Telefono] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ASIGNACIONES] ADD  CONSTRAINT [df_FechaAsignacion]  DEFAULT (getdate()) FOR [FechaAsignacion]
GO
ALTER TABLE [dbo].[DETALLESREPARACION] ADD  CONSTRAINT [df_FechaInicio]  DEFAULT (getdate()) FOR [FechaInicio]
GO
ALTER TABLE [dbo].[DETALLESREPARACION] ADD  CONSTRAINT [df_FechaFin]  DEFAULT (getdate()) FOR [FechaFin]
GO
ALTER TABLE [dbo].[REPARACIONES] ADD  CONSTRAINT [df_FechaSolicitud]  DEFAULT (getdate()) FOR [FechaSolicitud]
GO
ALTER TABLE [dbo].[ASIGNACIONES]  WITH CHECK ADD  CONSTRAINT [FK_ASIGNACIONES_REPARACIONES] FOREIGN KEY([ReparacionID])
REFERENCES [dbo].[REPARACIONES] ([ReparacionID])
GO
ALTER TABLE [dbo].[ASIGNACIONES] CHECK CONSTRAINT [FK_ASIGNACIONES_REPARACIONES]
GO
ALTER TABLE [dbo].[ASIGNACIONES]  WITH CHECK ADD  CONSTRAINT [FK_ASIGNACIONES_TECNICOS] FOREIGN KEY([TecnicoID])
REFERENCES [dbo].[TECNICOS] ([TecnicoID])
GO
ALTER TABLE [dbo].[ASIGNACIONES] CHECK CONSTRAINT [FK_ASIGNACIONES_TECNICOS]
GO
ALTER TABLE [dbo].[DETALLESREPARACION]  WITH CHECK ADD  CONSTRAINT [FK_DETALLESREPARACION_REPARACIONES] FOREIGN KEY([ReparacionID])
REFERENCES [dbo].[REPARACIONES] ([ReparacionID])
GO
ALTER TABLE [dbo].[DETALLESREPARACION] CHECK CONSTRAINT [FK_DETALLESREPARACION_REPARACIONES]
GO
ALTER TABLE [dbo].[EQUIPOS]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPOS_USUARIOS] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[USUARIOS] ([UsuarioID])
GO
ALTER TABLE [dbo].[EQUIPOS] CHECK CONSTRAINT [FK_EQUIPOS_USUARIOS]
GO
ALTER TABLE [dbo].[REPARACIONES]  WITH CHECK ADD  CONSTRAINT [FK_REPARACIONES_EQUIPOS] FOREIGN KEY([EquipoID])
REFERENCES [dbo].[EQUIPOS] ([EquipoID])
GO
ALTER TABLE [dbo].[REPARACIONES] CHECK CONSTRAINT [FK_REPARACIONES_EQUIPOS]
GO
/****** Object:  StoredProcedure [dbo].[AGREGAREQUIPO]    Script Date: 20/11/2023 17:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AGREGAREQUIPO]
@TipoEquipo VARCHAR(50),
@Modelo VARCHAR(50)
AS
BEGIN
    INSERT INTO EQUIPOS(TipoEquipo, Modelo)
    VALUES (@TipoEquipo, @Modelo);
END;
GO
/****** Object:  StoredProcedure [dbo].[AGREGARTECNICO]    Script Date: 20/11/2023 17:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AGREGARTECNICO]
(
    @Nombre VARCHAR(50),
    @Especialidad VARCHAR(50)
)
AS
BEGIN
    INSERT INTO TECNICOS(Nombre, Especialidad)
    VALUES (@Nombre, @Especialidad);
END;
GO
/****** Object:  StoredProcedure [dbo].[AGREGARUSUARIO]    Script Date: 20/11/2023 17:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AGREGARUSUARIO]
@Nombre VARCHAR(50),
@CorreoElectronico VARCHAR(50),
@Telefono VARCHAR(15)
AS
BEGIN
    INSERT INTO USUARIOS( Nombre, CorreoElectronico, Telefono)
    VALUES (@Nombre, @CorreoElectronico, @Telefono);
END;
GO
/****** Object:  StoredProcedure [dbo].[BORRAREQUIPO]    Script Date: 20/11/2023 17:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[BORRAREQUIPO]
(
    @EquipoID INT
)
AS
BEGIN
    DELETE FROM EQUIPOS
    WHERE EquipoID = @EquipoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[BORRARTECNICO]    Script Date: 20/11/2023 17:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[BORRARTECNICO]
(
    @TecnicoID INT
)
AS
BEGIN
    DELETE FROM TECNICOS
    WHERE TecnicoID = @TecnicoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[BORRARUSUARIO]    Script Date: 20/11/2023 17:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BORRARUSUARIO]

    @UsuarioID INT

AS
BEGIN
    DELETE FROM USUARIOS
    WHERE UsuarioID = @UsuarioID;
END;
GO
/****** Object:  StoredProcedure [dbo].[CONSULTAREQUIPOSCONFILTRO]    Script Date: 20/11/2023 17:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CONSULTAREQUIPOSCONFILTRO]
(
    @Filtro VARCHAR(255)
)
AS
BEGIN
    SELECT * FROM EQUIPOS WHERE @Filtro IS NULL
    OR (
        @filtro LIKE '%EquipoID%'
        AND EquipoID IS NOT NULL
    )
    OR (
        @filtro LIKE '%TipoEquipo%'
        AND TipoEquipo IS NOT NULL
    )
    OR (
        @filtro LIKE '%Modelo%'
        AND Modelo IS NOT NULL
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[CONSULTARTECNICOCONFILTRO]    Script Date: 20/11/2023 17:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CONSULTARTECNICOCONFILTRO]
(
    @Filtro VARCHAR(255)
)
AS
BEGIN
    SELECT * FROM TECNICOS WHERE @Filtro IS NULL
    OR (
        @filtro LIKE '%TecnicoID%'
        AND TecnicoID IS NOT NULL
    )
    OR (
        @filtro LIKE '%Nombre%'
        AND Nombre IS NOT NULL
    )
    OR (
        @filtro LIKE '%Especialidad%'
        AND Especialidad IS NOT NULL
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[CONSULTARUSUARIOCONFILTRO]    Script Date: 20/11/2023 17:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[CONSULTARUSUARIOCONFILTRO]
(
    @Filtro VARCHAR(255)
)
AS
BEGIN
    SELECT * FROM USUARIOS WHERE @Filtro IS NULL
    OR (
        @filtro LIKE '%UsuarioID%'
        AND UsuarioID IS NOT NULL
    )
    OR (
        @filtro LIKE '%Nombre%'
        AND Nombre IS NOT NULL
    )
    OR (
        @filtro LIKE '%CorreoElectronico%'
        AND CorreoElectronico IS NOT NULL
    )
    OR (
        @filtro LIKE '%Telefono%'
        AND Telefono IS NOT NULL
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[MODIFICAREQUIPO]    Script Date: 20/11/2023 17:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MODIFICAREQUIPO]
(
    @EquipoID INT,
    @TipoEquipo VARCHAR(50),
    @modelo VARCHAR(50)
)
AS
BEGIN
    UPDATE EQUIPOS
    SET TipoEquipo = @TipoEquipo,
        Modelo = @Modelo
    WHERE EquipoID = @EquipoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[MODIFICARTECNICO]    Script Date: 20/11/2023 17:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MODIFICARTECNICO]
(
    @TecnicoID INT,
    @Nombre VARCHAR(50),
    @Especialidad VARCHAR(50)
)
AS
BEGIN
    UPDATE TECNICOS
    SET Nombre = @Nombre,
        Especialidad = @Especialidad
    WHERE TecnicoID= @TecnicoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[MODIFICARUSUARIO]    Script Date: 20/11/2023 17:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MODIFICARUSUARIO]
(
    @UsuarioID INT,
    @Nombre VARCHAR(50),
    @CorreoElectronico VARCHAR(50),
    @Telefono VARCHAR(15)
)
AS
BEGIN
    UPDATE USUARIOS
    SET Nombre = @Nombre,
        CorreoElectronico = @CorreoElectronico,
        Telefono = @Telefono
    WHERE UsuarioID = @UsuarioID;
END;
GO
