-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 03-03-2024 a las 18:07:51
-- Versión del servidor: 5.7.39
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Halcon`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DeletedOrder`
--

CREATE TABLE `DeletedOrder` (
  `DeletedOrderID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `DeleteTime` datetime NOT NULL,
  `DeletedUserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `DeletedOrder`
--

INSERT INTO `DeletedOrder` (`DeletedOrderID`, `OrderID`, `DeleteTime`, `DeletedUserID`) VALUES
(1, 1, '2024-03-03 12:00:00', 1),
(2, 2, '2024-03-03 12:30:00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Department`
--

CREATE TABLE `Department` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Department`
--

INSERT INTO `Department` (`DepartmentID`, `DepartmentName`) VALUES
(1, 'Ventas'),
(2, 'Compras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `OrderAction`
--

CREATE TABLE `OrderAction` (
  `ActionID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ActionDate` datetime NOT NULL,
  `ActionUserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `OrderAction`
--

INSERT INTO `OrderAction` (`ActionID`, `OrderID`, `ActionDate`, `ActionUserID`) VALUES
(1, 1, '2024-03-03 10:30:00', 1),
(2, 2, '2024-03-03 11:30:00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Orders`
--

CREATE TABLE `Orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerName` varchar(100) NOT NULL,
  `OrderDateTime` datetime NOT NULL,
  `Address` varchar(255) NOT NULL,
  `StatusID` int(11) DEFAULT NULL,
  `OrderedUserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Orders`
--

INSERT INTO `Orders` (`OrderID`, `CustomerName`, `OrderDateTime`, `Address`, `StatusID`, `OrderedUserID`) VALUES
(1, 'Alejandro', '2024-03-03 10:00:00', 'Av. Adamar, Guadalajara', 1, 1),
(2, 'Natalia', '2024-03-03 11:00:00', 'Las Lomas 456, Torreon', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Photo`
--

CREATE TABLE `Photo` (
  `PhotoID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `Ubication` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Photo`
--

INSERT INTO `Photo` (`PhotoID`, `OrderID`, `Ubication`) VALUES
(1, 1, 'ruta'),
(2, 2, 'ruta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Role`
--

CREATE TABLE `Role` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Role`
--

INSERT INTO `Role` (`RoleID`, `RoleName`) VALUES
(1, 'Jefe'),
(2, 'Empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Status`
--

CREATE TABLE `Status` (
  `StatusID` int(11) NOT NULL,
  `StatusName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Status`
--

INSERT INTO `Status` (`StatusID`, `StatusName`) VALUES
(1, 'Enviado'),
(2, 'Entregado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Users`
--

CREATE TABLE `Users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `RoleID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Users`
--

INSERT INTO `Users` (`UserID`, `Username`, `Password`, `RoleID`) VALUES
(1, 'Alejandro', 'Papa123', 1),
(2, 'Natalia', 'Queso43', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `DeletedOrder`
--
ALTER TABLE `DeletedOrder`
  ADD PRIMARY KEY (`DeletedOrderID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `DeletedUserID` (`DeletedUserID`);

--
-- Indices de la tabla `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indices de la tabla `OrderAction`
--
ALTER TABLE `OrderAction`
  ADD PRIMARY KEY (`ActionID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ActionUserID` (`ActionUserID`);

--
-- Indices de la tabla `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `StatusID` (`StatusID`),
  ADD KEY `OrderedUserID` (`OrderedUserID`);

--
-- Indices de la tabla `Photo`
--
ALTER TABLE `Photo`
  ADD PRIMARY KEY (`PhotoID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indices de la tabla `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indices de la tabla `Status`
--
ALTER TABLE `Status`
  ADD PRIMARY KEY (`StatusID`);

--
-- Indices de la tabla `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `RoleID` (`RoleID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `DeletedOrder`
--
ALTER TABLE `DeletedOrder`
  MODIFY `DeletedOrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Department`
--
ALTER TABLE `Department`
  MODIFY `DepartmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `OrderAction`
--
ALTER TABLE `OrderAction`
  MODIFY `ActionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Orders`
--
ALTER TABLE `Orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Photo`
--
ALTER TABLE `Photo`
  MODIFY `PhotoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Role`
--
ALTER TABLE `Role`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Status`
--
ALTER TABLE `Status`
  MODIFY `StatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `DeletedOrder`
--
ALTER TABLE `DeletedOrder`
  ADD CONSTRAINT `deletedorder_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
  ADD CONSTRAINT `deletedorder_ibfk_2` FOREIGN KEY (`DeletedUserID`) REFERENCES `Users` (`UserID`);

--
-- Filtros para la tabla `OrderAction`
--
ALTER TABLE `OrderAction`
  ADD CONSTRAINT `orderaction_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
  ADD CONSTRAINT `orderaction_ibfk_2` FOREIGN KEY (`ActionUserID`) REFERENCES `Users` (`UserID`);

--
-- Filtros para la tabla `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`StatusID`) REFERENCES `Status` (`StatusID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`OrderedUserID`) REFERENCES `Users` (`UserID`);

--
-- Filtros para la tabla `Photo`
--
ALTER TABLE `Photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`);

--
-- Filtros para la tabla `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `Role` (`RoleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
