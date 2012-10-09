CREATE DATABASE AUTOMOTRIZ
USE AUTOMOTRIZ

CREATE TABLE MODELO
(
id_modelo int primary key ,
descripcion varchar(40)
)
CREATE TABLE VEHICULO
(
id_vehiculo int primary key ,
ano_fabricacion varchar(4),
placa char(5),
nro_asiento char(2),
uso_vehiculo varchar(10),
serie_motor char(25),
colo varchar(40),
kilometro_inicio varchar(10),
consumo_galon varchar(10),
nro_movil char(10),
id_modelo int
)
alter table VEHICULO
ADD FOREIGN KEY (id_modelo)REFERENCES MODELO
-----------------
CREATE PROCEDURE PA_LISTAR_VEHICULO
AS
SELECT id_vehiculo,ano_fabricacion,placa,nro_asiento,uso_vehiculo,serie_motor,colo,kilometro_inicio,consumo_galon,nro_movil FROM VEHICULO
-----
CREATE PROCEDURE PA_INSERTAR_VEHICULO
@IDVEHICULO INT,
@ANOFABRI VARCHAR(4),
@PLACA CHAR(5),
@NROASIENTO CHAR(2),
@USOVEHICULO VARCHAR(10),
@SERIEMOTOR CHAR(25),
@COLOR VARCHAR(40),
@KILOMETROUSO VARCHAR(10),
@CONSUMOGALON VARCHAR(10),
@NUMEROMOVIL CHAR(10),
@IDMODELO INT
AS
INSERT INTO VEHICULO(id_vehiculo,ano_fabricacion,placa,nro_asiento,uso_vehiculo,serie_motor,colo,kilometro_inicio,consumo_galon,nro_movil,id_modelo)
VALUES(@IDVEHICULO,@ANOFABRI,@PLACA,@NROASIENTO,
@USOVEHICULO ,
@SERIEMOTOR ,
@COLOR,
@KILOMETROUSO ,
@CONSUMOGALON ,
@NUMEROMOVIL ,
@IDMODELO 
)
-------
CREATE PROCEDURE PA_MODIFICAR_VEHICULO
@IDVEHICULO INT,
@ANOFABRI VARCHAR(4),
@PLACA CHAR(5),
@NROASIENTO CHAR(2),
@USOVEHICULO VARCHAR(10),
@SERIEMOTOR CHAR(25),
@COLOR VARCHAR(40),
@KILOMETROUSO VARCHAR(10),
@CONSUMOGALON VARCHAR(10),
@NUMEROMOVIL CHAR(10),
@IDMODELO INT
AS
UPDATE VEHICULO SET ano_fabricacion=@ANOFABRI,placa=@PLACA,nro_asiento=@NROASIENTO,uso_vehiculo=@USOVEHICULO,serie_motor=@SERIEMOTOR,colo=@COLOR,kilometro_inicio=@KILOMETROUSO,consumo_galon=@CONSUMOGALON,nro_movil=@NUMEROMOVIL
WHERE id_vehiculo=@IDVEHICULO
-------------
CREATE PROCEDURE PA_ELIMINAR_VEHICULO
@IDVEHICULO INT
AS
DELETE FROM VEHICULO WHERE id_vehiculo=@IDVEHICULO
DELETE FROM MODELO WHERE id_modelo=@IDVEHICULO

