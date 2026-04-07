-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-04-2026 a las 06:27:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_tel` (IN `num_socio` INT, IN `nuevo_tel` VARCHAR(10))   BEGIN
    UPDATE socio SET soc_telefono = nuevo_tel WHERE soc_numero = num_socio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_genero` (IN `genero_buscar` VARCHAR(20))   BEGIN
    SELECT * FROM libro WHERE lib_genero = genero_buscar;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprendiz`
--

CREATE TABLE `aprendiz` (
  `id_aprendiz` int(11) NOT NULL,
  `apr_nombre` varchar(50) DEFAULT NULL,
  `apr_apellido` varchar(50) DEFAULT NULL,
  `apr_correo` varchar(100) DEFAULT NULL,
  `apr_ubicacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aprendiz`
--

INSERT INTO `aprendiz` (`id_aprendiz`, `apr_nombre`, `apr_apellido`, `apr_correo`, `apr_ubicacion`) VALUES
(1, 'Juan', 'Pérez', 'juan.perez@example.com', 'Ciudad A'),
(2, 'María', 'Gómez', 'maria.gomez@example.com', 'Ciudad B'),
(3, 'Pedro', 'López', 'pedro.lopez@example.com', 'Ciudad C'),
(4, 'Laura', 'Torres', 'laura.torres@example.com', 'Ciudad A'),
(5, 'Carlos', 'Rodríguez', 'carlos.rodriguez@example.com', 'Ciudad B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audi_autor`
--

CREATE TABLE `audi_autor` (
  `id_audi_autor` int(11) NOT NULL,
  `aut_codigo_afectado` int(11) DEFAULT NULL,
  `apellido_anterior` varchar(45) DEFAULT NULL,
  `apellido_nuevo` varchar(45) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `audi_autor`
--

INSERT INTO `audi_autor` (`id_audi_autor`, `aut_codigo_afectado`, `apellido_anterior`, `apellido_nuevo`, `fecha_modificacion`, `usuario`, `accion`) VALUES
(1, 0, 'aut_apellido', NULL, '2026-03-09 10:58:16', 'root@localhost', 'Eliminación de autor'),
(2, 765, 'Lopez carrillo', 'HERRERA CARRILLO', '2026-03-09 11:13:48', 'root@localhost', 'Actualización de autor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audi_libro`
--

CREATE TABLE `audi_libro` (
  `id_audi` int(11) NOT NULL,
  `lib_isbn` int(11) DEFAULT NULL,
  `titulo_anterior` varchar(300) DEFAULT NULL,
  `titulo_nuevo` varchar(300) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audi_libro_insert`
--

CREATE TABLE `audi_libro_insert` (
  `ID_ISBN` bigint(20) NOT NULL,
  `FECHA` datetime DEFAULT NULL,
  `ACCION` varchar(25) DEFAULT NULL,
  `GENERO` varchar(40) DEFAULT NULL,
  `TITULO` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audi_socio`
--

CREATE TABLE `audi_socio` (
  `id_audi` int(10) NOT NULL,
  `soc_Numero_audi` int(11) DEFAULT NULL,
  `soc_Nombre_anterior` varchar(45) DEFAULT NULL,
  `soc_Apellido_anterior` varchar(45) DEFAULT NULL,
  `soc_Direccion_anterior` varchar(255) DEFAULT NULL,
  `soc_Telefono_anterior` varchar(10) DEFAULT NULL,
  `soc_Nombre_nuevo` varchar(45) DEFAULT NULL,
  `soc_Apellido_nuevo` varchar(45) DEFAULT NULL,
  `soc_Direccion_nuevo` varchar(255) DEFAULT NULL,
  `soc_Telefono_nuevo` varchar(10) DEFAULT NULL,
  `audi_fechaModificacion` datetime DEFAULT NULL,
  `audi_usuario` varchar(10) DEFAULT NULL,
  `audi_accion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `audi_socio`
--

INSERT INTO `audi_socio` (`id_audi`, `soc_Numero_audi`, `soc_Nombre_anterior`, `soc_Apellido_anterior`, `soc_Direccion_anterior`, `soc_Telefono_anterior`, `soc_Nombre_nuevo`, `soc_Apellido_nuevo`, `soc_Direccion_nuevo`, `soc_Telefono_nuevo`, `audi_fechaModificacion`, `audi_usuario`, `audi_accion`) VALUES
(1, 17, 'Lois', 'Barrera', 'Calle 28 36 -26', '3151258697', 'Lois', 'Barrera', 'CALLE 72#2', '3123609028', '2026-03-05 07:36:59', 'root@local', 'Actualización'),
(2, 16, 'Roberto Carlos', 'Castaño', 'Calle 11 36 -25', '3364658655', NULL, NULL, NULL, NULL, '2026-03-05 08:15:40', 'root@local', 'Registro eliminado'),
(3, 1, 'Ana', 'Ruiz', 'Calle Primavera 123, Ciudad Jardín, Barcelona', '9123456780', 'Ana', 'Ruiz', 'Calle Primavera 123, Ciudad Jardín, Barcelona', '3001234567', '2026-04-06 23:25:18', 'root@local', 'Actualización');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `AUT_CODIGO` int(11) NOT NULL,
  `AUT_APELLIDO` varchar(45) NOT NULL,
  `AUT_NACIMIENTO` date NOT NULL,
  `AUT_MUERTE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`AUT_CODIGO`, `AUT_APELLIDO`, `AUT_NACIMIENTO`, `AUT_MUERTE`) VALUES
(0, 'aut_apellido', '0000-00-00', '0000-00-00'),
(98, 'Smith', '1974-12-21', '2018-07-21'),
(123, 'Taylor', '1980-04-15', '0000-00-00'),
(234, 'Medina', '1977-06-21', '2005-09-12'),
(345, 'Wilson', '1975-08-29', '0000-00-00'),
(432, 'Miller', '1981-10-26', '0000-00-00'),
(456, 'García', '1978-09-27', '2021-12-09'),
(567, 'Davis', '1983-03-04', '2010-03-28'),
(678, 'Silva', '1986-02-02', '0000-00-00'),
(765, 'Lopez carrillo', '0000-00-00', '2025-05-03'),
(789, 'Rodríguez', '1985-12-10', '0000-00-00'),
(890, 'Brown', '1982-11-17', '0000-00-00'),
(901, 'Soto', '1979-05-13', '2015-11-05');

--
-- Disparadores `autor`
--
DELIMITER $$
CREATE TRIGGER `autor_after_update` AFTER UPDATE ON `autor` FOR EACH ROW BEGIN
    INSERT INTO audi_autor (
        aut_codigo_afectado,
        apellido_anterior,
        apellido_nuevo,
        fecha_modificacion,
        usuario,
        accion
    )
    VALUES (
        OLD.AUT_CODIGO,
        OLD.AUT_APELLIDO,
        NEW.AUT_APELLIDO,
        NOW(),
        CURRENT_USER(),
        'Actualización de autor'
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `autor_before_delete` BEFORE DELETE ON `autor` FOR EACH ROW BEGIN
    INSERT INTO audi_autor (
        aut_codigo_afectado,
        apellido_anterior,
        fecha_modificacion,
        usuario,
        accion
    )
    VALUES (
        OLD.AUT_CODIGO,
        OLD.AUT_APELLIDO,
        NOW(),
        CURRENT_USER(),
        'Eliminación de autor'
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `autor_tipo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `autor_tipo` (
`AUT_CODIGO` int(11)
,`AUT_APELLIDO` varchar(45)
,`TIPO_AUTOR` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NOMBRE_CLIENTE` varchar(20) NOT NULL,
  `CORREO` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_CLIENTE`, `NOMBRE_CLIENTE`, `CORREO`) VALUES
(1, 'ANA LUNA', 'ANALUNA36@HOTMAIL.COM'),
(2, 'SOL SOLECITO', 'SOLE@GMAIL.COM');

--
-- Disparadores `cliente`
--
DELIMITER $$
CREATE TRIGGER `seguimiento_actualizacion_cliente` BEFORE UPDATE ON `cliente` FOR EACH ROW INSERT INTO LOG_CLIENTE(
    ID_CLIENTE,
    NOMBRE_ANTERIOR,
    CORREO_ANTERIOR,
    NOMBRE_NUEVO,
    CORREO_NUEVO,
    FECHA_MODIFICACION,
    USUARIO_MODIFICACION,
    COMENTARIO)
     VALUES (new.ID_CLIENTE, old.NOMBRE_CLIENTE, OLD.CORREO,NEW.NOMBRE_CLIENTE, NEW.CORREO,NOW (),USER(),'SE ACTUALIZAN DATOS')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `seguimiento_eliminacion_cliente` BEFORE DELETE ON `cliente` FOR EACH ROW INSERT INTO LOG_CLIENTE(
    ID_CLIENTE,
    NOMBRE_ANTERIOR,
    CORREO_ANTERIOR,
    FECHA_MODIFICACION,
    USUARIO_MODIFICACION,
    COMENTARIO)
VALUES (OLD.ID_CLIENTE,OLD.NOMBRE_CLIENTE,OLD.CORREO,NOW(),USER(),'Se eliminaron datos')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `LIB_ISBN` bigint(20) NOT NULL,
  `LIB_TITULO` varchar(255) NOT NULL,
  `LIB_GENERO` varchar(20) NOT NULL,
  `LIB_NUMEROPAGINAS` int(11) NOT NULL,
  `LIB_DIASPRESTAMO` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`LIB_ISBN`, `LIB_TITULO`, `LIB_GENERO`, `LIB_NUMEROPAGINAS`, `LIB_DIASPRESTAMO`) VALUES
(1234567890, 'El Sueño de los Susurros', 'novela', 275, 7),
(1357924680, 'El Jardín de las Mariposas Perdidas', 'novela', 536, 7),
(2468135790, 'La Melodía de la Oscuridad', 'romance', 189, 7),
(2718281828, 'El Bosque de los Suspiros', 'novela', 387, 2),
(3141592653, 'El Secreto de las Estrellas Olvidadas', 'Misterio', 203, 7),
(5555555555, 'La Última Llave del Destino', 'cuento', 503, 7),
(7777777777, 'El Misterio de la Luna Plateada', 'Misterio', 422, 7),
(8642097531, 'El Reloj de Arena Infinito', 'novela', 321, 7),
(8888888888, 'La Ciudad de los Susurros', 'Misterio', 274, 1),
(9517530862, 'Las Crónicas del Eco Silencioso', 'fantasía', 448, 7),
(9876543210, 'El Laberinto de los Recuerdos', 'cuento', 412, 7),
(9999999999, 'El Enigma de los Espejos Rotos', 'romance', 156, 7);

--
-- Disparadores `libro`
--
DELIMITER $$
CREATE TRIGGER `ACTUALIZACION_LIBRO` AFTER INSERT ON `libro` FOR EACH ROW BEGIN
    INSERT INTO AUDITORIA_LIBRO(
        LIB_ISBN,
        ACCION,
        FECHA,
        GENERO,
        LIB_NUMEROPAGINAS,
        TITULO
    )  
    VALUES (
        NEW.LIB_ISBN,
        'INSERT',
        NOW(),
        NEW.LIB_GENERO,
        NEW.LIB_NUMEROPAGINAS,
        NEW.LIB_TITULO
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `libro_after_insert` AFTER INSERT ON `libro` FOR EACH ROW BEGIN
    INSERT INTO audi_libro_insert (
        ID_ISBN,
        FECHA,
        ACCION,
        GENERO,
        TITULO
    )
    VALUES (
        NEW.LIB_ISBN,
        NOW(),
        'Nuevo Libro Insertado',
        NEW.LIB_GENERO,
        NEW.LIB_TITULO
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `libro_after_update` AFTER UPDATE ON `libro` FOR EACH ROW BEGIN
    INSERT INTO audi_libro (
        lib_isbn,
        titulo_anterior,
        titulo_nuevo,
        fecha_modificacion,
        usuario,
        accion
    )
    VALUES (
        NEW.LIB_ISBN,
        OLD.LIB_TITULO,
        NEW.LIB_TITULO,
        NOW(),
        CURRENT_USER(),
        'Actualización'
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `libro_before_delete` BEFORE DELETE ON `libro` FOR EACH ROW BEGIN
    INSERT INTO audi_libro (
        lib_isbn,
        titulo_anterior,
        fecha_modificacion,
        usuario,
        accion
    )
    VALUES (
        OLD.LIB_ISBN,
        OLD.LIB_TITULO,
        NOW(),
        CURRENT_USER(),
        'Eliminación de libro'
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `libros_cliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `libros_cliente` (
`NOMBRE_CLIENTE` varchar(20)
,`LIB_TITULO` varchar(255)
,`LIB_GENERO` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posiciones`
--

CREATE TABLE `posiciones` (
  `id` int(11) NOT NULL,
  `grupo` char(10) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `jugados` int(11) NOT NULL,
  `ganados` int(11) NOT NULL,
  `empatados` int(11) NOT NULL,
  `perdidos` int(11) NOT NULL,
  `puntos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `PRES_ID` varchar(20) NOT NULL,
  `PRES_FECHAPRESTAMO` date NOT NULL,
  `PRES_FECHADEVOLUCION` date NOT NULL,
  `SOC_COPIANUMERO` int(11) NOT NULL,
  `LIB_COPIAISBN` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`PRES_ID`, `PRES_FECHAPRESTAMO`, `PRES_FECHADEVOLUCION`, `SOC_COPIANUMERO`, `LIB_COPIAISBN`) VALUES
('pres1', '2023-01-15', '2023-01-20', 1, 1234567890),
('pres2', '2023-02-03', '2023-02-04', 2, 9999999999),
('pres3', '2023-04-09', '2023-04-11', 6, 2718281828),
('pres4', '2023-06-14', '2023-06-15', 9, 8888888888),
('pres5', '2023-07-02', '2023-07-09', 10, 5555555555),
('pres6', '2023-08-19', '2023-08-26', 12, 5555555555),
('pres7', '2023-10-24', '2023-10-27', 3, 1357924680),
('pres8', '2023-11-11', '2023-11-12', 4, 9999999999);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `SOC_NUMERO` int(11) NOT NULL,
  `SOC_NOMBRE` varchar(45) NOT NULL,
  `SOC_APELLIDO` varchar(45) NOT NULL,
  `SOC_DIRECCION` varchar(255) NOT NULL,
  `SOC_TELEFONO` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`SOC_NUMERO`, `SOC_NOMBRE`, `SOC_APELLIDO`, `SOC_DIRECCION`, `SOC_TELEFONO`) VALUES
(1, 'Ana', 'Ruiz', 'Calle Primavera 123, Ciudad Jardín, Barcelona', '3001234567'),
(2, 'Andrés Felipe', 'Galindo Luna', 'Avenida del Sol 456, Pueblo Nuevo, Madrid', '2123456789'),
(3, 'Juan', 'González', 'Calle Principal 789, Villa Flores, Valencia', '2012345678'),
(4, 'María', 'Rodríguez', 'Carrera del Río 321, El Pueblo, Sevilla', '3012345678'),
(5, 'Pedro', 'Martínez', 'Calle del Bosque 654, Los Pinos, Málaga', '1234567812'),
(6, 'Ana', 'López', 'Avenida Central 987, Villa Hermosa, Bilbao', '6123456781'),
(7, 'Carlos', 'Sánchez', 'Calle de la Luna 234, El Prado, Alicante', '1123456781'),
(8, 'Laura', 'Ramírez', 'Carrera del Mar 567, Playa Azul, Palma de Mallorca', '1312345678'),
(9, 'Luis', 'Hernández', 'Avenida de la Montaña 890, Monte Verde, Granada', '6101234567'),
(10, 'Andrea', 'García', 'Calle del Sol 432, La Colina, Zaragoza', '1112345678'),
(11, 'Alejandro', 'Torres', 'Carrera del Oeste 765, Ciudad Nueva, Murcia', '4951234567'),
(12, 'Sofia', 'Morales', 'Avenida del Mar 098, Costa Brava, Gijón', '5512345678'),
(17, 'Lois', 'Barrera', 'CALLE 72#2', '3123609028');

--
-- Disparadores `socio`
--
DELIMITER $$
CREATE TRIGGER `socio_after_delete` AFTER DELETE ON `socio` FOR EACH ROW BEGIN
    INSERT INTO audi_socio (
        soc_Numero_audi,
        soc_Nombre_anterior,
        soc_Apellido_anterior,
        soc_Direccion_anterior,
        soc_Telefono_anterior,
        audi_fechaModificacion,
        audi_usuario,
        audi_accion
    )
    VALUES (
        OLD.SOC_NUMERO,
        OLD.SOC_NOMBRE,
        OLD.SOC_APELLIDO,
        OLD.SOC_DIRECCION,
        OLD.SOC_TELEFONO,
        NOW(),
        CURRENT_USER(),
        'Registro Eliminado'
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `socios_after_delete` AFTER DELETE ON `socio` FOR EACH ROW INSERT INTO audi_socio(
    soc_Numero_audi,
    soc_Nombre_anterior,
    soc_Apellido_anterior,
    soc_Direccion_anterior,
    soc_Telefono_anterior,
    audi_fechaModificacion,
    audi_usuario,
    audi_accion)
VALUES(
    old.soc_numero,
    old.soc_nombre,
    old.soc_apellido,
    old.soc_direccion,
    old.soc_telefono,
    NOW(),
    CURRENT_USER(),
    'Registro eliminado')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `socios_before_update` BEFORE UPDATE ON `socio` FOR EACH ROW INSERT INTO audi_socio(
    soc_Numero_audi,
    soc_Nombre_anterior,
    soc_Apellido_anterior,
    soc_Direccion_anterior,
    soc_Telefono_anterior,
    soc_Nombre_nuevo,
    soc_Apellido_nuevo,
    soc_Direccion_nuevo,
    soc_Telefono_nuevo,
    audi_fechaModificacion,
    audi_usuario,
    audi_accion)
VALUES(
    new.soc_numero,
    old.soc_nombre,
    old.soc_apellido,
    old.soc_direccion,
    old.soc_telefono,
    new.soc_nombre,
    new.soc_apellido,
    new.soc_direccion,
    new.soc_telefono,
    NOW(),
    CURRENT_USER(),
    'Actualización')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_autores`
--

CREATE TABLE `tipo_autores` (
  `COPIA_ISBN` bigint(20) DEFAULT NULL,
  `COPIA_AUTOR` int(11) DEFAULT NULL,
  `TIPO_AUTOR` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_autores`
--

INSERT INTO `tipo_autores` (`COPIA_ISBN`, `COPIA_AUTOR`, `TIPO_AUTOR`) VALUES
(1357924680, 123, 'Traductor'),
(1234567890, 123, 'Autor'),
(1234567890, 456, 'Coautor'),
(2718281828, 789, 'Traductor'),
(8888888888, 234, 'Autor'),
(2468135790, 234, 'Autor'),
(9876543210, 567, 'Autor'),
(1234567890, 890, 'Autor'),
(8642097531, 345, 'Autor'),
(8888888888, 345, 'Coautor'),
(5555555555, 678, 'Autor'),
(3141592653, 901, 'Autor'),
(9517530862, 432, 'Autor'),
(7777777777, 765, 'Autor'),
(9999999999, 98, 'Autor'),
(1357924680, 123, 'Traductor'),
(1234567890, 123, 'Autor'),
(1234567890, 456, 'Coautor'),
(2718281828, 789, 'Traductor'),
(8888888888, 234, 'Autor'),
(2468135790, 234, 'Autor'),
(9876543210, 567, 'Autor'),
(1234567890, 890, 'Autor'),
(8642097531, 345, 'Autor'),
(8888888888, 345, 'Coautor'),
(5555555555, 678, 'Autor'),
(3141592653, 901, 'Autor'),
(9517530862, 432, 'Autor'),
(7777777777, 765, 'Autor'),
(9999999999, 98, 'Autor'),
(1357924680, 123, 'Traductor'),
(1234567890, 123, 'Autor'),
(1234567890, 456, 'Coautor'),
(2718281828, 789, 'Traductor'),
(8888888888, 234, 'Autor'),
(2468135790, 234, 'Autor'),
(9876543210, 567, 'Autor'),
(1234567890, 890, 'Autor'),
(8642097531, 345, 'Autor'),
(8888888888, 345, 'Coautor'),
(5555555555, 678, 'Autor'),
(3141592653, 901, 'Autor'),
(9517530862, 432, 'Autor'),
(7777777777, 765, 'Autor'),
(9999999999, 98, 'Autor'),
(1357924680, 123, 'Traductor'),
(1234567890, 123, 'Autor'),
(1234567890, 456, 'Coautor'),
(2718281828, 789, 'Traductor'),
(8888888888, 234, 'Autor'),
(2468135790, 234, 'Autor'),
(9876543210, 567, 'Autor'),
(1234567890, 890, 'Autor'),
(8642097531, 345, 'Autor'),
(8888888888, 345, 'Coautor'),
(5555555555, 678, 'Autor'),
(3141592653, 901, 'Autor'),
(9517530862, 432, 'Autor'),
(7777777777, 765, 'Autor'),
(9999999999, 98, 'Autor');

-- --------------------------------------------------------

--
-- Estructura para la vista `autor_tipo`
--
DROP TABLE IF EXISTS `autor_tipo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `autor_tipo`  AS SELECT `autor`.`AUT_CODIGO` AS `AUT_CODIGO`, `autor`.`AUT_APELLIDO` AS `AUT_APELLIDO`, `tipo_autores`.`TIPO_AUTOR` AS `TIPO_AUTOR` FROM (`tipo_autores` join `autor`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `libros_cliente`
--
DROP TABLE IF EXISTS `libros_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `libros_cliente`  AS SELECT `cliente`.`NOMBRE_CLIENTE` AS `NOMBRE_CLIENTE`, `libro`.`LIB_TITULO` AS `LIB_TITULO`, `libro`.`LIB_GENERO` AS `LIB_GENERO` FROM (`libro` join `cliente`) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD PRIMARY KEY (`id_aprendiz`);

--
-- Indices de la tabla `audi_autor`
--
ALTER TABLE `audi_autor`
  ADD PRIMARY KEY (`id_audi_autor`);

--
-- Indices de la tabla `audi_libro`
--
ALTER TABLE `audi_libro`
  ADD PRIMARY KEY (`id_audi`);

--
-- Indices de la tabla `audi_libro_insert`
--
ALTER TABLE `audi_libro_insert`
  ADD PRIMARY KEY (`ID_ISBN`);

--
-- Indices de la tabla `audi_socio`
--
ALTER TABLE `audi_socio`
  ADD PRIMARY KEY (`id_audi`);

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`AUT_CODIGO`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_CLIENTE`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`LIB_ISBN`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`PRES_ID`),
  ADD KEY `SOC_COPIANUMERO` (`SOC_COPIANUMERO`),
  ADD KEY `LIB_COPIAISBN` (`LIB_COPIAISBN`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`SOC_NUMERO`);

--
-- Indices de la tabla `tipo_autores`
--
ALTER TABLE `tipo_autores`
  ADD KEY `COPIA_ISBN` (`COPIA_ISBN`),
  ADD KEY `COPIA_AUTOR` (`COPIA_AUTOR`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `audi_libro`
--
ALTER TABLE `audi_libro`
  MODIFY `id_audi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `audi_socio`
--
ALTER TABLE `audi_socio`
  MODIFY `id_audi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`SOC_COPIANUMERO`) REFERENCES `socio` (`SOC_NUMERO`),
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`LIB_COPIAISBN`) REFERENCES `libro` (`LIB_ISBN`);

--
-- Filtros para la tabla `tipo_autores`
--
ALTER TABLE `tipo_autores`
  ADD CONSTRAINT `tipo_autores_ibfk_1` FOREIGN KEY (`COPIA_ISBN`) REFERENCES `libro` (`LIB_ISBN`),
  ADD CONSTRAINT `tipo_autores_ibfk_2` FOREIGN KEY (`COPIA_AUTOR`) REFERENCES `autor` (`AUT_CODIGO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
