CREATE TABLE `categoria` (
  `ID_CATEGORIA` int NOT NULL,
  `NOM_CATEGORIA` varchar(100) DEFAULT NULL,
  `ESTADO` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `cuerpo_educativo` (
  `ID_CUERPO_EDUCATIVO` int NOT NULL,
  `ID_PERSONA` int DEFAULT NULL,
  `ID_CATEGORIA` int DEFAULT NULL,
  `ID_TIPO_VEHICULO` int DEFAULT NULL,
  `PLACA` varchar(7) DEFAULT NULL,
  `ESTADO` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `estacionamiento` (
  `COD_ESTACIONAMIENTO` int NOT NULL,
  `NOM_ESTACIONAMIENTO` varchar(255) DEFAULT NULL,
  `CANTIDAD_TOTAL` int DEFAULT NULL,
  `CANTIDAD_DISPONIBLE` int DEFAULT NULL,
  `ESTADO` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `persona` (
  `ID_PERSONA` int NOT NULL,
  `NOMBRES` varchar(100) DEFAULT NULL,
  `APPATERNO` varchar(100) DEFAULT NULL,
  `APMATERNO` varchar(100) DEFAULT NULL,
  `DOCUMENTO` char(8) DEFAULT NULL,
  `CODIGO` varchar(9) DEFAULT NULL,
  `ESTADO` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `placa_escaneada` (
  `ID_PLACA_ESCANEADA` int NOT NULL,
  `ID_CUERPO_EDUCATIVO` int DEFAULT NULL,
  `FECHA_INGRESO` datetime DEFAULT NULL,
  `FECHA_SALIDA` datetime DEFAULT NULL,
  `REGISTRO` char(1) DEFAULT NULL,
  `ESTADO` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `privilegio` (
  `ID_PRIVILEGIO` int NOT NULL,
  `NOM_PRIVILEGIO` varchar(50) DEFAULT NULL,
  `ESTADO` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `tipo_vehiculo` (
  `ID_TIPO_VEHICULO` int NOT NULL,
  `NOM_TIPO_VEHICULO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ESTADO` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `usuario` (
  `ID_USUARIO` int NOT NULL,
  `ID_PERSONA` int DEFAULT NULL,
  `ID_PRIVILEGIO` int DEFAULT NULL,
  `CONTRASENIA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ESTADO` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID_CATEGORIA`);

--
-- Indices de la tabla `cuerpo_educativo`
--
ALTER TABLE `cuerpo_educativo`
  ADD PRIMARY KEY (`ID_CUERPO_EDUCATIVO`),
  ADD KEY `CUERPO_EDUCATIVO_FK_PERSONA` (`ID_PERSONA`),
  ADD KEY `CUERPO_EDUCATIVO_FK_CATEGORIA` (`ID_CATEGORIA`),
  ADD KEY `CUERPO_EDUCATIVO_FK_TIPO_VEHICULO` (`ID_TIPO_VEHICULO`);

--
-- Indices de la tabla `estacionamiento`
--
ALTER TABLE `estacionamiento`
  ADD PRIMARY KEY (`COD_ESTACIONAMIENTO`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`ID_PERSONA`);

--
-- Indices de la tabla `placa_escaneada`
--
ALTER TABLE `placa_escaneada`
  ADD PRIMARY KEY (`ID_PLACA_ESCANEADA`),
  ADD KEY `PLACA_ESCANEADA_FK_CUERPO_EDUCATIVO` (`ID_CUERPO_EDUCATIVO`);

--
-- Indices de la tabla `privilegio`
--
ALTER TABLE `privilegio`
  ADD PRIMARY KEY (`ID_PRIVILEGIO`);

--
-- Indices de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  ADD PRIMARY KEY (`ID_TIPO_VEHICULO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD KEY `USUARIO_FK_PERSONA` (`ID_PERSONA`),
  ADD KEY `USUARIO_FK_PRIVILEGIO` (`ID_PRIVILEGIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID_CATEGORIA` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cuerpo_educativo`
--
ALTER TABLE `cuerpo_educativo`
  MODIFY `ID_CUERPO_EDUCATIVO` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `estacionamiento`
--
ALTER TABLE `estacionamiento`
  MODIFY `COD_ESTACIONAMIENTO` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `ID_PERSONA` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `placa_escaneada`
--
ALTER TABLE `placa_escaneada`
  MODIFY `ID_PLACA_ESCANEADA` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `privilegio`
--
ALTER TABLE `privilegio`
  MODIFY `ID_PRIVILEGIO` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  MODIFY `ID_TIPO_VEHICULO` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USUARIO` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuerpo_educativo`
--
ALTER TABLE `cuerpo_educativo`
  ADD CONSTRAINT `CUERPO_EDUCATIVO_FK_CATEGORIA` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categoria` (`ID_CATEGORIA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `CUERPO_EDUCATIVO_FK_PERSONA` FOREIGN KEY (`ID_PERSONA`) REFERENCES `persona` (`ID_PERSONA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `CUERPO_EDUCATIVO_FK_TIPO_VEHICULO` FOREIGN KEY (`ID_TIPO_VEHICULO`) REFERENCES `tipo_vehiculo` (`ID_TIPO_VEHICULO`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `placa_escaneada`
--
ALTER TABLE `placa_escaneada`
  ADD CONSTRAINT `PLACA_ESCANEADA_FK_CUERPO_EDUCATIVO` FOREIGN KEY (`ID_CUERPO_EDUCATIVO`) REFERENCES `cuerpo_educativo` (`ID_CUERPO_EDUCATIVO`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `USUARIO_FK_PERSONA` FOREIGN KEY (`ID_PERSONA`) REFERENCES `persona` (`ID_PERSONA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `USUARIO_FK_PRIVILEGIO` FOREIGN KEY (`ID_PRIVILEGIO`) REFERENCES `privilegio` (`ID_PRIVILEGIO`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;
