-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2017 a las 14:47:03
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `contrato`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_contratado`
--

CREATE TABLE `d_contratado` (
  `ID_Contratado` int(11) NOT NULL,
  `Nombre_Contratado` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_entidadcontratante`
--

CREATE TABLE `d_entidadcontratante` (
  `ID_EntidadContratante` int(11) NOT NULL,
  `Nombre_EntidadContratante` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_fecha`
--

CREATE TABLE `d_fecha` (
  `ID_Fecha` int(11) NOT NULL,
  `Fecha` varchar(10) DEFAULT NULL,
  `ID_Anno` int(11) DEFAULT NULL,
  `ID_Mes` int(11) DEFAULT NULL,
  `ID_Dia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_objeto`
--

CREATE TABLE `d_objeto` (
  `ID_Objeto` int(11) NOT NULL,
  `Nombre_Objeto` varchar(500) DEFAULT NULL,
  `TipoContrato` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `f_contratos_menores`
--

CREATE TABLE `f_contratos_menores` (
  `Importe_Licitacion` float DEFAULT NULL,
  `Importe_Adjudicacion` float DEFAULT NULL,
  `Num_Licitadores` int(11) DEFAULT NULL,
  `d_Fecha_ID_Fecha` int(11) NOT NULL,
  `d_Objeto_ID_Objeto` int(11) NOT NULL,
  `d_EntidadContratante_ID_EntidadContratante` int(11) NOT NULL,
  `d_Contratado_ID_Contratado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Indices de la tabla `d_contratado`
--
ALTER TABLE `d_contratado`
  ADD PRIMARY KEY (`ID_Contratado`);

--
-- Indices de la tabla `d_entidadcontratante`
--
ALTER TABLE `d_entidadcontratante`
  ADD PRIMARY KEY (`ID_EntidadContratante`),
  ADD UNIQUE KEY `ID_EntidadContratante` (`ID_EntidadContratante`);

--
-- Indices de la tabla `d_fecha`
--
ALTER TABLE `d_fecha`
  ADD PRIMARY KEY (`ID_Fecha`);

--
-- Indices de la tabla `d_objeto`
--
ALTER TABLE `d_objeto`
  ADD PRIMARY KEY (`ID_Objeto`);

--
-- Indices de la tabla `f_contratos_menores`
--
ALTER TABLE `f_contratos_menores`
  ADD KEY `fk_f_Contratos_Menores_d_Fecha_idx` (`d_Fecha_ID_Fecha`),
  ADD KEY `fk_f_Contratos_Menores_d_Objeto1_idx` (`d_Objeto_ID_Objeto`),
  ADD KEY `fk_f_Contratos_Menores_d_EntidadContratante1_idx` (`d_EntidadContratante_ID_EntidadContratante`),
  ADD KEY `fk_f_Contratos_Menores_d_Contratado1_idx` (`d_Contratado_ID_Contratado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `d_contratado`
--
ALTER TABLE `d_contratado`
  MODIFY `ID_Contratado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=760;
--
-- AUTO_INCREMENT de la tabla `d_entidadcontratante`
--
ALTER TABLE `d_entidadcontratante`
  MODIFY `ID_EntidadContratante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `d_fecha`
--
ALTER TABLE `d_fecha`
  MODIFY `ID_Fecha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1489;
--
-- AUTO_INCREMENT de la tabla `d_objeto`
--
ALTER TABLE `d_objeto`
  MODIFY `ID_Objeto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1117;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `f_contratos_menores`
--
ALTER TABLE `f_contratos_menores`
  ADD CONSTRAINT `fk_f_Contratos_Menores_d_Contratado1` FOREIGN KEY (`d_Contratado_ID_Contratado`) REFERENCES `d_contratado` (`ID_Contratado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_f_Contratos_Menores_d_EntidadContratante1` FOREIGN KEY (`d_EntidadContratante_ID_EntidadContratante`) REFERENCES `d_entidadcontratante` (`ID_EntidadContratante`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_f_Contratos_Menores_d_Fecha` FOREIGN KEY (`d_Fecha_ID_Fecha`) REFERENCES `d_fecha` (`ID_Fecha`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_f_Contratos_Menores_d_Objeto1` FOREIGN KEY (`d_Objeto_ID_Objeto`) REFERENCES `d_objeto` (`ID_Objeto`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
