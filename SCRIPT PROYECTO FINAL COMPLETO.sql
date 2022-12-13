-- CREACIÓN DE LA BASE DE DATOS

DROP SCHEMA IF EXISTS AMECROS;
CREATE SCHEMA IF NOT EXISTS AMECROS;

-- CREACIÓN DE LAS TABLAS

USE AMECROS;


-- CREACIÓN DE TABLA "SUCURSALES"
 DROP TABLE IF EXISTS SUCURSALES;
 CREATE TABLE IF NOT EXISTS SUCURSALES (
 id_sucursal VARCHAR (50) , 
 domicilio VARCHAR (50),
 ciudad VARCHAR (50) ,
 provincia VARCHAR (50) ,
 email VARCHAR (50),
 telefono VARCHAR (30),
 celular VARCHAR (30),
 PRIMARY KEY (id_sucursal)
 );
 
 -- CREACION DE TABLA "SERVICIOS"
 DROP TABLE IF EXISTS SERVICIOS;
 CREATE TABLE IF NOT EXISTS SERVICIOS(
 cod_servicio VARCHAR (30) ,
 id_sucursal VARCHAR (30) ,
 costo_servicio INT (5) ,
 PRIMARY KEY (cod_servicio) ,
 CONSTRAINT fk_servicios_sucursales FOREIGN KEY (id_sucursal) REFERENCES SUCURSALES(id_sucursal)
 );

 -- CREACION DE TABLA CONVENIOS
 DROP TABLE IF EXISTS CONVENIOS;
 CREATE TABLE IF NOT EXISTS CONVENIOS(
 id_conv INT (3),
 nombre_conv VARCHAR (50) NOT NULL ,
 fecha_conv DATE ,
 vencimiento_conv DATE,
 cod_servicio VARCHAR (30) ,
 PRIMARY KEY (id_conv) ,
 CONSTRAINT fk_convenio_servicio FOREIGN KEY (cod_servicio) REFERENCES SERVICIOS (cod_servicio)
 );
 
 -- CREACION DE TABLA SOCIOS
 DROP TABLE IF EXISTS SOCIOS;
 CREATE TABLE IF NOT EXISTS SOCIOS(
 id_socio INT AUTO_INCREMENT ,
 nombre_socio CHAR (15) ,
 apellido_socio CHAR (15) ,
 edad_socio INT (3) ,
 dni_socio INT (8) NOT NULL ,
 domicilio_socio VARCHAR (20) ,
 ciudad  VARCHAR (15) ,
 provincia VARCHAR (15) ,
 id_convenio INT (3) NOT NULL ,
 PRIMARY KEY (id_socio) ,
 CONSTRAINT fk_socios_convenio FOREIGN KEY (id_convenio) REFERENCES CONVENIOS (id_conv)
 );
 
 -- CREACION DE TABLA PROVEEDORES
 DROP TABLE IF EXISTS PROVEEDORES;
 CREATE TABLE IF NOT EXISTS PROVEEDORES(
 id_proveedor INT (5) ,
 nombre_proveedor  VARCHAR (20) ,
 pagos_proveedor  VARCHAR (25) ,
 deuda_proveedor INT (10) ,
 devolucion_pedidos VARCHAR (30) ,
 id_sucursal VARCHAR (30) ,
 PRIMARY KEY (id_proveedor) ,
 CONSTRAINT fk_proveedor_sucursal FOREIGN KEY (id_sucursal) REFERENCES SUCURSALES (id_sucursal)
 );
 
 -- CREACION TABLA EMPLEADOS
 DROP TABLE IF EXISTS EMPLEADOS;
 CREATE TABLE IF NOT EXISTS EMPLEADOS(
 legajo INT AUTO_INCREMENT ,
 nombre_empleado  CHAR (35) NOT NULL ,
 apellido_empleado  CHAR (35) NOT NULL ,
 dni INT (8) NOT NULL ,
 telefono VARCHAR (30) ,
 direccion VARCHAR (50) ,
 ciudad VARCHAR (30) ,
 provincia VARCHAR (30) ,
 categoria INT (3) ,
 id_sucursal VARCHAR (30) ,
 cod_servicio VARCHAR (30) ,
 PRIMARY KEY (legajo) ,
 CONSTRAINT fk_empleados_sucursal FOREIGN KEY (id_sucursal) REFERENCES SUCURSALES (id_sucursal) ,
 CONSTRAINT fk_empleados_servicio FOREIGN KEY (cod_servicio) REFERENCES SERVICIOS (cod_servicio) 
 ); 
 
 -- CREACION TABLA SERV_EXTERNOS 
DROP TABLE IF EXISTS SERV_EXTERNOS;
CREATE TABLE IF NOT EXISTS SERV_EXTERNOS (
id_serv VARCHAR (10), 
cod_tarea VARCHAR (40),
ciudad VARCHAR (30),
provincia VARCHAR (30),
domicilio VARCHAR (40),
cod_servicio VARCHAR (30),
id_sucursal VARCHAR (30),
PRIMARY KEY (ID_SERV),
CONSTRAINT fk_servicios_externos FOREIGN KEY (cod_servicio) REFERENCES servicios(cod_servicio),
CONSTRAINT fk_sucursal_externos FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
); 
 
 
  -- INSERCIÓN DE REGISTROS EN LAS TABLAS DE LA BASE DE DATOS AMECROS 
 
 -- INSERCIÓN DE DATOS EN TABLA "SUCURSALES" 
 INSERT INTO SUCURSALES (id_sucursal , domicilio, ciudad , provincia , email , telefono , celular ) VALUES 
 ('Sede Central' , 'Mitre 362', 'Rosario' , 'Santa Fe' , 'mutualamecro@gmail.com' , '3414256456' , '3415802765' ) ,
 ('Sede Funes' , 'Eva Perón 8032', 'Funes' , 'Santa Fe' , 'amecrofunes@gmail.com' , '03413256490' , '3416061890' ) , 
 ('Tiro Suizo' , 'S. Bustamante 744', 'Rosario' , 'Santa Fe' , 'amecrosur@gmail.com' , '03414267512' , '3416234066' ) ,
 ('Sede Nono' , 'Illia 486', 'Los Nonos' , 'Cordoba' , 'amecrohotelnonos@gmail.com' , '0343524236533' , '34353151677' ) ,
 ('Sede Fisherton' , '9 de Julio 1455', 'Rosario' , 'Santa Fe' , 'amecrofisherton@gmail.com' , '03414277552' , '3415603318') ,
 ('Sede Nuñez' , 'Ricardo Nuñez 224', 'Rosario' , 'Santa Fe' , 'amecronuñez@gmail.com' , '03414889009' , '3412395456' ) ,
 ('Sede Zavalla' , 'Av SiempreViva 224', 'Zavalla' , 'Santa Fe' , 'amecrozavalla@gmail.com' , '03414556623' , '3416906090' ) ,
 ('Sede Echesortu' , 'San Nicolas 1452', 'Rosario' , 'Santa Fe' , 'amecroechesortu@gmail.com' , '03414256286' , '3416709915' )
 ;
 
 -- INSERCIÓN DE DATOS EN TABLA "SERVICIOS"
 INSERT INTO SERVICIOS (cod_servicio , id_sucursal , costo_servicio) VALUES 
 ('Pleno' , 'Sede Central' , 0 ) ,
 ('Comedor' , 'Sede Central' , 380 ) ,
 ('Delivery' , 'Sede Central' , 420 ) ,
 ('Gimnasio' , 'Sede Central' , 1500 ) ,
 ('Centro Médico' , 'Sede Central' , 700 ) , 
 ('Proveeduria' , 'Sede Central' , 450 ) ,
 ('Camping SF' , 'Sede Funes' , 500 ) ,
 ('Pileta SF' , 'Sede Funes' , 350 ) ,
 ('Buffet' , 'Tiro Suizo' , 480 ) ,
 ('Boxeo' , 'Tiro Suizo' , 1000 ) ,
 ('Delivery TS' , 'Tiro Suizo' , 420 ) ,
 ('Resort' , 'Sede Nono' , 19000 ) ,
 ('Proveeduria F' , 'Sede Fisherton' , 450 ) ,
 ('Comedor SN' , 'Sede Nuñez' , 420 ) ,
 ('Pileta SN' , 'Sede Nuñez' , 300 ) ,
 ('Delivery SN' , 'Sede Nuñez' , 340 ) ,
 ('Camping SZ' , 'Sede Zavalla' , 500 ) ,
 ('Pileta SZ' , 'Sede Zavalla' , 350 ) ,
 ('Comedor Echesortu' , 'Sede Echesortu' , 480 ) ,
 ('Pileta Echesortu' , 'Sede Echesortu' , 350 ) ,
 ('Delivery Echesortu' , 'Sede Echesortu' , 340 ) 
;

-- INSERCIÓN DE DATOS EN TABLA "CONVENIOS" 
INSERT INTO CONVENIOS (id_conv , nombre_conv , fecha_conv , vencimiento_conv , cod_servicio ) VALUES
( 1 , 'Amecro' , '2015-01-01' , '2025-01-01' , 'Pleno' ) ,
( 2 , 'Mutual 13 de Abril' , '2018-06-01' , '2022-05-31' , 'Delivery' ) ,
( 3 , 'Bancarios' , '2020-09-15' , '2024-09-14' , 'Pileta Echesortu' ) ,
( 4 , 'UNR' , '2017-08-13' , '2022-12-01' , 'Pleno' ) ,
( 5 , 'AEC' , '2015-11-13' , '2022-12-01' , 'Comedor SN' ) ,
( 6 , 'Aceiteros' , '2022-03-16' , '2023-04-22' , 'Camping SF' ) ,
( 7 , 'Judiciales' , '2019-02-08' , '2024-06-19' , 'Camping SZ' ) ,
( 8 , 'FRAPAM' , '2018-12-04' , '2023-12-04' , 'Proveeduria' ) ,
( 9 , 'ATE' , '2021-01-29' , '2022-01-01' , 'Resort' ) ,
( 10 , 'PAMI' , '2022-07-17' , '2022-12-31' , 'Pileta SZ' ) ,
( 11 , 'IAPOS' , '2021-09-22' , '2022-09-23' , 'Centro Médico' ) ,
( 12 , 'SITRATEL' , '2021-10-02' , '2023-10-01' , 'Proveeduria' ) 
;

-- INSERCIÓN DE DATOS EN TABLA "SOCIOS"
INSERT INTO SOCIOS ( apellido_socio , nombre_socio , edad_socio , dni_socio , domicilio_socio , ciudad , provincia , id_convenio ) VALUES
( 'Ghioldi' , 'Ruben Mario' , 70 , 10538523 , 'Urquiza 1354 8 D' , 'Rosario' , 'Santa Fe' , 1 ) , 
( 'Salguero' , 'Carmen Elena' , 68 , 11345827 , 'Urquiza 1354 8 D' , 'Rosario' , 'Santa Fe' , 1 ) , 
( 'Sabatinsky' , 'Sara' , 32 , 34356377 , 'Israel 233' , 'Rosario' , 'Santa Fe' , 1 ) , 
( 'Muller' , 'Carlos Alberto' , 33 , 34459643 , 'Israel 233' , 'Rosario' , 'Santa Fe' , 1 ) , 
( 'Gahona' , 'Marina Leonor' , 65 , 12176472 , 'Brown 1922' , 'Rosario' , 'Santa Fe' , 1 ) , 
( 'Salguero' , 'Hector Daniel' , 67 , 12112649 , 'Brown 1922' , 'Rosario' , 'Santa Fe' , 1 ) , 
( 'Salguero' , 'Fernando' , 19 , 43736927 , 'Brown 1922' , 'Rosario' , 'Santa Fe' , 1 ) , 
( 'Treviño' , 'Susana' , 26 , 38635996 , 'San Lorenzo 354 5 A' , 'Rosario' , 'Santa Fe' , 1 ) , 
( 'Garcia' , 'Jorge' , 30 , 37625183 , 'Santa Fe 1482 8 B' , 'Rosario' , 'Santa Fe' , 1 ) , 
( 'Silvano' , 'Damian' , 27 , 38837261 , 'Reconquista 675' , 'Rosario' , 'Santa Fe' , 1 ) , 
( 'Rodriguez' , 'Gloria' , 46 , 25538523 , 'Alberdi 1237' , 'Rosario' , 'Santa Fe' , 1 ) , 
( 'Margutti' , 'Esteban' , 35 , 34583332 , 'Cordoba 451 1 B' , 'Rosario' , 'Santa Fe' , 2 ) , 
( 'Lopez' , 'Julieta' , 33 , 34783314 , 'Nicaragua 3412' , 'Rosario' , 'Santa Fe' , 2 ) , 
( 'Prodan' , 'Mauricio' , 28 , 37585832 , 'Salta 2245 5 D' , 'Rosario' , 'Santa Fe' , 1 ) ,
( 'Tosi' , 'Analia' , 59 , 16583632 , 'Laguna 1153' , 'Rosario' , 'Santa Fe' , 3 ) , 
( 'Alvarez' , 'Carlos' , 22 , 40287174 , 'Catamarca 2331 13 C' , 'Rosario' , 'Santa Fe' , 3 ) , 
( 'Gonzales' , 'Natalia' , 24 , 39383311 , 'Richieri 143 2 B' , 'Rosario' , 'Santa Fe' , 4 ) , 
( 'Lopez' , 'Ignacio' , 35 , 34482332 , 'Juan B. Justo 1340' , 'Rosario' , 'Santa Fe' , 4 ) , 
( 'Hernandez' , 'Esteban' , 90 , 4583332 , 'Dorrego 192 4 C' , 'Rosario' , 'Santa Fe' , 5 ) , 
( 'Zucceti' , 'Esteban' , 57 , 34583332 , 'Cordoba 451 1 B' , 'Rosario' , 'Santa Fe' , 5 ) , 
( 'Arnedo' , 'Marcos' , 62 , 14583332 , 'Arijon 1643' , 'Rosario' , 'Santa Fe' , 1 ) , 
( 'Acevedo' , 'Juliana' , 35 , 34583332 , 'Paraguay 782' , 'Rosario' , 'Santa Fe' , 2 ) , 
( 'Napolitano' , 'Esteban' , 35 , 34583332 , 'Corrientes 1892' , 'Rosario' , 'Santa Fe' , 3 ) , 
( 'Vallejos' , 'Ricardo' , 35 , 34583332 , 'Moreno 2261' , 'Rosario' , 'Santa Fe' , 1 ) , 
( 'Rios' , 'Norma' , 31 , 37688232 , 'Pellegrini 890' , 'Rosario' , 'Santa Fe' , 6 ) , 
( 'Bonansea' , 'Alan' , 35 , 34583332 , 'Valle Alpino' , 'Los Nonos' , 'Cordoba' , 9 ) , 
( 'Castellanos' , 'Camila' , 13 , 44223332 , 'Los Alerces' , 'Rosario' , 'Santa Fe' , 11 ) , 
( 'Lara' , 'Vanesa' , 23 , 34583332 , 'Nicaragua 267' , 'Rosario' , 'Santa Fe' , 3 ) , 
( 'Romani' , 'Guido' , 51 , 24826732 , 'Cordoba 998 4 F' , 'Rosario' , 'Santa Fe' , 2 ) , 
( 'Margutti' , 'Yanina' , 35 , 34583332 , 'Mitre 371' , 'Rosario' , 'Santa Fe' , 6 ) , 
( 'Torres' , 'Greta' , 17 , 42876510 , 'Maipu 2134' , 'Rosario' , 'Santa Fe' , 6 ) , 
( 'Marolio' , 'Sofia' , 19 , 40184163 , 'Laprida 3425' , 'Rosario' , 'Santa Fe' , 7 ) , 
( 'Dupuy' , 'Florencia' , 47 , 23635183 , '9 de Julio 231' , 'Rosario' , 'Santa Fe' , 7 ) , 
( 'Vecchio' , 'Marina' , 41 , 23672836, 'Ameghino 3416' , 'Rosario' , 'Santa Fe' , 8 ) , 
( 'Blanco' , 'Federico' , 35 , 33826118 , 'Avellaneda 671' , 'Rosario' , 'Santa Fe' , 8 ) , 
( 'Martinez' , 'Mario' , 33 , 35194817 , 'Valle Alpino 215' , 'Los Nonos' , 'Cordoba' , 9 ) , 
( 'Alvarez' , 'Esteban' , 38 , 31857109 , 'Talleres 2834' , 'Los Nonos' , 'Cordoba' , 9 ) , 
( 'Ledesma' , 'Franco' , 34 , 34567139 , 'Weelright 14' , 'Rosario' , 'Santa Fe' , 10 ) , 
( 'Lezcano' , 'Juan Cruz' , 35 , 34583332 , 'Av. Belgrano 1456' , 'Rosario' , 'Santa Fe' , 10 ) , 
( 'Lencinas' , 'Esteban' , 41 , 34583332 , '3 de Febrero 215' , 'Rosario' , 'Santa Fe' , 11 ) , 
( 'Sgerebiglia' , 'Javier' , 32 , 35126439 , 'San Luis 3076 2' , 'Rosario' , 'Santa Fe' , 12 ) , 
( 'Rearte' , 'Valeria' , 35 , 34887332 , 'Junin 223 3 A' , 'Rosario' , 'Santa Fe' , 12 ) , 
( 'Carelli' , 'Silvia' , 55 , 25817244 , 'Tucuman 4614' , 'Rosario' , 'Santa Fe' , 5 ) , 
( 'Ghioldi' , 'Federico' , 33 , 34185105 , 'Zeballos 1260 2 D' , 'Rosario' , 'Santa Fe' , 1 ) , 
( 'Ghioldi' , 'Eduardo' , 30 , 36538510 , 'Zeballos 1260 2 D' , 'Rosario' , 'Santa Fe' , 1 ) , 
( 'Caraglio' , 'Alfonso' , 45 , 22672336, 'Cordiviola 257' , 'Rosario' , 'Santa Fe' , 8 ) , 
( 'Parot' , 'Alfonso' , 31 , 36187614 , 'Rioja 1514' , 'Rosario' , 'Santa Fe' , 5 ) , 
( 'Veliz' , 'Yamila' , 27 , 37841717 , 'Instituto 161' , 'Los Nonos' , 'Cordoba' , 9 ),
( 'Andino' , 'Florencia' , 28 , 36238142 , 'España 637' , 'Rosario' , 'Santa Fe' , 7 ),
( 'Alencar' , 'Irene' , 29 , 36784168 , 'Santa Fe 1482 7 C' , 'Rosario' , 'Santa Fe' , 3 ) ,
( 'Aldo' , 'Rico' , 53 , 22573928 , 'Alvear 938' , 'Rosario' , 'Santa Fe' , 2 ) ,
( 'Mariano' , 'Cheviteli' , 26 , 39827821 , '27 de Febrero 1246' , 'Rosario' , 'Santa Fe' , 4 ) ,
( 'Juan' , 'Joplin' , 30 , 36872018 , 'Lamadrid 917' , 'Rosario' , 'Santa Fe' , 6 ) ,
( 'Rodrigo' , 'Fiera' , 33 , 35817462 , 'Montes de Oca 5528' , 'Los Nonos' , 'Cordoba' , 9 ) ,
( 'Javier' , 'Espert' , 18 , 45489154 , 'Santa Fe 1629 9 E' , 'Rosario' , 'Santa Fe' , 4 ) ,
( 'Maria' , 'Diego' , 87 , 5726103 , 'Catamarca 331' , 'Rosario' , 'Santa Fe' , 5 ) ,
( 'Gonzalo' , 'Farias' , 42 , 27563821 , 'Buenos Aires 781' , 'Rosario' , 'Santa Fe' , 2 ) , 
( 'Francisco' , 'Montesano' , 19 , 41817563 , 'Maipu 4171' , 'Rosario' , 'Santa Fe' , 8 ) ,
( 'Gloria' , 'Trevi' , 26 , 38383175 , 'Cabildo 225' , 'Rosario' , 'Santa Fe' , 6 ) ,
( 'Lara' , 'Soldini' , 21 , 41938105 , 'Entre Rios 901' , 'Rosario' , 'Santa Fe' , 4 ) ,
( 'Ernesto' , 'Farias' , 20 , 42094638 , 'Pte Roca 1456 3 A' ,  'Rosario' , 'Santa Fe' , 11 ) ,
( 'Marcos' , 'Russo' , 33 , 34141991 , 'Laprida 102 4 C' , 'Rosario' , 'Santa Fe' , 8 ) ,
( 'Damian' , 'Farias' , 92 , 5998174 , 'Avenida Rosario 1543' ,  'Rosario' , 'Santa Fe' , 12 ) ,
( 'Julio' , 'Azurdi' , 48 , 26338194 , 'Arijon 1644' , 'Rosario' , 'Santa Fe' , 4 ) 
;

-- INSERCIÓN DE DATOS EN TABLA "PROVEEDORES" 
INSERT INTO PROVEEDORES ( id_proveedor , nombre_proveedor , pagos_proveedor , deuda_proveedor , devolucion_pedidos , id_sucursal ) VALUES 
( 00101 , 'Laury' , 'Cuenta Corriente' , 45000 , 'Sin Pendientes' , 'Sede Central' ),
( 00201 , 'Cirstal Rock' , 'Pago Adelantado' , 18580 , 'En Stock' , 'Sede Central' ),
( 00301 , 'Aspen' , 'Cuenta Corriente' , 2000 , 'Sin Pendientes' , 'Sede Central' ),
( 00401 , 'Genemma' , 'Cheques' , 180 , 'Sin Pendientes' , 'Sede Central' ),
( 00501 , 'Manghi' , 'Cheques' , 9015 , 'Sin Stock' , 'Sede Central' ),
( 00102 , 'La Mercantil' , 'Pagare' , 12000 , 'Sin Pendientes' , 'Sede Funes' ),
( 00202 , 'Paroli SRL' , 'Cuenta Corriente' , 4300 , 'En Stock' , 'Sede Funes' ),
( 00302 , 'Amazonas' , 'Cuenta Corriente' , 3810 , 'Sin Pendientes' , 'Sede Funes' ),
( 00103 , 'ExoPress SRL' , 'Pagare' , 90 , 'Sin Pendientes' , 'Tiro Suizo' ),
( 00203 , 'Arrow' , 'Pago Adelantado' , 67100 , 'Sin Pendientes' ,'Tiro Suizo' ),
( 00303 , 'Food Service' , 'Cuenta Corriente' , 5410 , 'Sin Stock' , 'Tiro Suizo' ),
( 00104 , 'Le Marque' , 'Cheques' , 0 , 'Sin Stock' , 'Sede Nono' ),
( 00204 , 'Finger Foods' , 'Pagare' , 670 , 'Sin Pendientes' , 'Sede Nono' ),
( 00304 , 'Urban Velvet' , 'Cuenta Corriente' , 4500 , 'Sin Pendientes' , 'Sede Nono' ),
( 00105 , 'Egipciana' , 'Cheques' , 0 , 'Sin Stock' , 'Sede Fisherton' ),
( 00205 , 'Glutal SA' , 'Cuenta Corriente' , 5000 , 'Sin Pendientes' , 'Sede Fisherton' ),
( 00305 , 'Cotal SRL' , 'Pago Adelantado' , 2300 , 'En Stock' , 'Sede Fisherton' ),
( 00405 , 'La Cabaña Coop' , 'Cuenta Corriente' , 800 , 'Sin Pendientes' , 'Sede Fisherton' ),
( 00106 , 'GastroMedia' , 'Cheques' , 0 , 'Sin Pendientes' , 'Sede Nuñez' ),
( 00206 , 'Gitanes SRL' , 'Cuenta Corriente' , 45000 , 'Sin Pendientes' , 'Sede Nuñez' ),
( 00306 , 'Baliarda' , 'Pago Adelantado' , 30000 , 'Sin Stock' , 'Sede Nuñez' ),
( 00107 , 'Gerdau SA' , 'Cuenta Corriente' , 8900 , 'En Stock' , 'Sede Zavalla' ),
( 00207 , 'Pavon Arriba' , 'Cheques' , 5000 , 'Sin Pendientes' , 'Sede Zavalla' ),
( 00108 , 'Puente Gallegos' , 'Pagare' , 200 , 'En Stock' , 'Sede Echesortu' ),
( 00208 , 'San Roman SA' , 'Cheques' , 1300 , 'En Stock' , 'Sede Echesortu' )
;
-- INSERCIÓN DE DATOS EN TABLA "EMPLEADOS" 
INSERT INTO EMPLEADOS ( nombre_empleado , apellido_empleado , dni , telefono , direccion , ciudad , provincia , categoria , id_sucursal , cod_servicio) VALUES
( 'Eugenio' , 'Gonzales' , 35444819 , '4558019' , 'Mitre 419'  , 'Rosario' , 'Santa Fe' , 2 , 'Sede Central' , 'Comedor' ) ,
( 'Luis' , 'Martin' , 33190569 , '3412905567' , 'Urquiza 2139'  , 'Rosario' , 'Santa Fe' , 2 , 'Sede Central' , 'Comedor' ) ,
( 'Maria' , 'Nuñez' , 29891556 , '3413561920' , 'Maipu 451'  , 'Rosario' , 'Santa Fe' , 2 , 'Sede Central' , 'Comedor' ) ,
( 'Lucas' , 'Davinoch' , 12980560 , '3413568140' , 'Laprida 3391'  , 'Rosario' , 'Santa Fe' , 3 , 'Sede Central' , 'Comedor' ) ,
( 'Nino' , 'Aldobe' , 35439814 , '3414558019' , 'Mitre 890'  , 'Rosario' , 'Santa Fe' , 3 , 'Sede Central' , 'Delivery' ) ,
( 'Alvaro' , 'Robles' , 29044819 , '34178990435' , 'Corrientes 678'  , 'Rosario' , 'Santa Fe' , 2 , 'Sede Central' , 'Gimnasio' ) ,
( 'Johana' , 'Ruiz' , 31776340 , '3415801690' , 'Paraguay 1482'  , 'Rosario' , 'Santa Fe' , 1  , 'Sede Central' , 'Gimnasio' ) ,
( 'Irina' , 'Rosa' , 15233454 , '34178732435' , 'Junin 3390'  , 'Rosario' , 'Santa Fe' , 1  , 'Sede Central' , 'Centro Medico' ) ,
( 'Luis' , 'Blanco' , 35899146 , '3415886309' , 'Catmarca 331'  , 'Rosario' , 'Santa Fe' , 2  , 'Sede Central' , 'Centro Medico' ) ,
( 'Martina' , 'Roa' , 29029019 , '34135990435' , 'Pte. Roca 722'  , 'Rosario' , 'Santa Fe' , 3  , 'Sede Central' , 'Centro Medico' ) ,
( 'Juliana' , 'Alvarez' , 38290515 , '3416780115' , 'España 459'  , 'Rosario' , 'Santa Fe' , 2  , 'Sede Central' , 'Centro Medico' ) ,
( 'Pablo' , 'Lezcano' , 19054819 , '34138690735' , 'Italia 1231'  , 'Rosario' , 'Santa Fe' , 1  , 'Sede Central' , 'Centro Medico' ) ,
( 'Mario' , 'Broca' , 33044819 , '34132810435' , 'Corrientes 1322'  , 'Rosario' , 'Santa Fe' , 2  , 'Sede Central' , 'Proveeduria' ) ,
( 'Nicolas' , 'Valdez' , 14112569 , '3413667343' , 'Mitre 441'  , 'Rosario' , 'Santa Fe' , 3  , 'Sede Central' , 'Proveeduria' ) ,
( 'Norma' , 'Marquez' , 40291886 , '3413991753' , 'Buenos Aires 515'  , 'Rosario' , 'Santa Fe' , 1 , 'Sede Central' , 'Proveeduria' ) ,
( 'Kevin' , 'Ortiz' , 17442890 , '3412489315' , 'JM Rosas 4414'  , 'Rosario' , 'Santa Fe' , 3  , 'Sede Central' , 'Proveeduria' ) ,
( 'Daniel' , 'Herrera' , 41291886 , '3415671753' , 'Viamonte 998'  , 'Rosario' , 'Santa Fe' , 3  , 'Sede Central' , 'Proveeduria' ) ,
( 'Gonzalo' , 'Batiatio' , 25765890 , '3413991753' , 'Avellaneda 1568'  , 'Rosario' , 'Santa Fe' , 1  , 'Sede Central' , 'Proveeduria' ) ,
( 'Gonzalo' , 'Savio' , 38145670 , '3412670285' , 'Tucuman 1455'  , 'Rosario' , 'Santa Fe' , 2  , 'Sede Central' , 'Proveeduria' ) ,
( 'Bianca' , 'Auer' , 41669156 , '3412816522' , 'Buenos Aires 1532'  , 'Rosario' , 'Santa Fe' , 2  , 'Sede Central' , 'Proveeduria' ) ,
( 'Fernando' , 'Casas' , 33175914 , '341748219' , 'Alvear 248'  , 'Rosario' , 'Santa Fe' , 3  , 'Sede Central' , 'Proveeduria' ) ,
( 'Roberto' , 'Espinoza' ,330146186 , '3413654753' , 'Santiago 3315'  , 'Rosario' , 'Santa Fe' , 2  , 'Sede Central' , 'Proveeduria' ) ,
( 'Silvana' , 'Careli' , 28571925 , '3412581752' , 'Pueyrredon 1617'  , 'Rosario' , 'Santa Fe' , 3  , 'Sede Funes' , 'Camping SF' ) ,
( 'Andres' , 'Rucci' , 34185715 , '3413341753' , 'Jujuy 2311'  , 'Rosario' , 'Santa Fe' , 1  , 'Sede Funes' , 'Camping SF' ) ,
( 'Gonzalo' , 'Horvat' , 12636923 , '3414678251' , 'San Lorenzo 3421'  , 'Funes' , 'Santa Fe' , 1  , 'Sede Funes' , 'Camping SF' ) ,
( 'Mariano' , 'Acosta' , 17291886 , '34154989753' , 'Miraflores'  , 'Funes' , 'Santa Fe' , 1  , 'Sede Funes' , 'Pileta SF' ) ,
( 'Fausto' , 'De Angelis' , 25827502 , '341245185' , 'S. de Bustamante 2526'  , 'Rosario' , 'Santa Fe' , 1  , 'Tiro Suizo' , 'Buffet' ) ,
( 'Maria Soledad' , 'Gahona' , 26291886 , '3413884753' , 'Pte Quintana 3317'  , 'Rosario' , 'Santa Fe' , 1  , 'Tiro Suizo' , 'Buffet' ) ,
( 'Gabriela' , 'Furia' , 31291453 , '3413991665' , 'Bv Oroño 5561'  , 'Rosario' , 'Santa Fe' , 3  , 'Tiro Suizo' , 'Buffet' ) ,
( 'Marcelo' , 'Botta' , 21562684 , '3415761589' , 'Buenos Aires 4515'  , 'Rosario' , 'Santa Fe' , 3  , 'Tiro Suizo' , 'Boxeo' ) ,
( 'Juan Ignacio' , 'Mansilla' , 42291886 , '3413225763' , 'Junin 4832'  , 'Rosario' , 'Santa Fe' , 2  , 'Tiro Suizo' , 'Delivery TS' ) ,
( 'Tomas' , 'Grillo' , 32791480 , '343562941766' , 'Colombia 5322'  , 'Los Nonos' , 'Cordoba' , 3  , 'Sede Nono' , 'Resort' ) ,
( 'Juan Ignacio' , 'Zarate' , 40296936 , '343513991753' , 'Jauretche 5832'  , 'Los Nonos' , 'Cordoba' , 1  , 'Sede Nono' , 'Resort' ) ,
( 'Victor' , 'Russo' , 28572525 , '34351267823' , 'Colorados 2492'  , 'Los Nonos' , 'Cordoba' , 1  , 'Sede Nono' , 'Resort' ) ,
( 'Ivan' , 'Brodolonich' , 36291649 , '3413943753' , 'Marcos Paz 527'  , 'Rosario' , 'Santa Fe' , 2  , 'Sede Fisherton' , 'Proveeduria F' ) ,
( 'Camila' , 'Urruchua' , 37291386 , '3412431854' , 'Salta 3019'  , 'Rosario' , 'Santa Fe' , 1  , 'Sede Fisherton' , 'Proveeduria F' ) ,
( 'Paloma' , 'Caceres' , 39291314 , '3412907634' , 'Albevar 3492'  , 'Rosario' , 'Santa Fe' , 1  , 'Sede Fisherton' , 'Proveeduria F' ) ,
( 'Carla' , 'Colombres' , 41756986 , '3412761743' , 'Rioja 418'  , 'Rosario' , 'Santa Fe' , 2  , 'Sede Fisherton' , 'Proveeduria F' ) ,
( 'Manuel' , 'Dominguez' , 38761855 , '3415954053' , 'Republica 482'  , 'Rosario' , 'Santa Fe' , 1  , 'Sede Fisherton' , 'Proveeduria F' ) ,
( 'Cesar' , 'Delgado' , 33729176 , '3412528017' , 'Buenos Aires 215'  , 'Rosario' , 'Santa Fe' , 1  , 'Sede Fisherton' , 'Proveeduria F' ) ,
( 'Joel' , 'Chichor' , 33891657 , '3413886552' , 'Colombre 2345'  , 'Rosario' , 'Santa Fe' , 1  , 'Sede Nuñez' , 'Comedor SN' ) ,
( 'Rocio' , 'Trovanes' , 44814876 , '3413991753' , 'Martin Fierro 4092'  , 'Rosario' , 'Santa Fe' , 1  , 'Sede Nuñez' , 'Comedor SN' ) ,
( 'Florencia' , 'Polans' , 17462817 , '341581652' , '3 de Febrero 2325'  , 'Rosario' , 'Santa Fe' , 3  , 'Sede Nuñez' , 'Comedor SN' ) ,
( 'Jesica' , 'Liniers' , 38716491 , '3413198026' , 'Mendoza 3825'  , 'Rosario' , 'Santa Fe' , 2  , 'Sede Nuñez' , 'Pileta SN' ) ,
( 'Maria Angeles' , 'Croceto'  , 38917526 , '3414621751' , 'Guatemala 485'  , 'Rosario' , 'Santa Fe' , 3 , 'Sede Nuñez' , 'Pileta SN' ) ,
( 'Esteban' , 'Graffo' , 33781652 , '3415681572' , 'San Juan 158'  , 'Rosario' , 'Santa Fe' , 2  , 'Sede Nuñez' , 'Delivery SN' ) ,
( 'Ignacio' , 'Acosta' , 38716592 , '3415186294' , 'Andes 3814'  , 'Zavalla' , 'Santa Fe' , 1  , 'Sede Zavalla' , 'Camping SZ' ) ,
( 'Nanci' , 'Carloni' , 18452650 , '3413451356' , 'Fuerza Aerea 528'  , 'Zavalla' , 'Santa Fe' , 3 , 'Sede Zavalla' , 'Camping SZ' ) ,
( 'Dario' , 'Mazzei' , 18372562 , '3413662858' , 'Los Cocos 492'  , 'Zavalla' , 'Santa Fe' , 1  , 'Sede Zavalla' , 'Pileta SZ' ) ,
( 'Jonatan' , 'Herrera' , 40247156 , '341258268' , 'Alsina 981'  , 'Rosario' , 'Santa Fe' , 2  , 'Sede Echesortu' , 'Comedor Echesortu' ) ,
( 'Washington' , 'Camacho' , 37268915 , '3415784721' , 'Castellanos 2852'  , 'Rosario' , 'Santa Fe' , 1 , 'Sede Echesortu' , 'Comedor Echesortu' ) ,
( 'German' , 'Herrera' , 28573015 , '3413558203' , 'Constitucion 1345'  , 'Rosario' , 'Santa Fe' , 2  , 'Sede Echesortu' , 'Comedor Echesortu' ) ,
( 'Hernan' , 'Castellano' , 34291146 , '3415682729' , 'Lavalle 1288'  , 'Rosario' , 'Santa Fe' , 1  , 'Sede Echesortu' , 'Comedor Echesortu' ) ,
( 'Camila' , 'Aldao' , 12187562 , '3413801965' , 'Lima 1480'  , 'Rosario' , 'Santa Fe' , 3  , 'Sede Echesortu' , 'Pileta Echesortu' ) ,
( 'Juan' , 'Segundo' , 33726195 , '3412545081' , 'Gutemberg 2391'  , 'Rosario' , 'Santa Fe' , 1  , 'Sede Echesortu' , 'Delivery Echesortu' ) 
;

-- INSERCION DE DATOS EN LA TABLA SERV_EXTERNOS
INSERT INTO SERV_EXTERNOS ( id_serv , cod_tarea , ciudad , provincia , domicilio , cod_servicio , id_sucursal ) VALUES
( 'TM_SC' , 'Taller Mecanico LUIS' , 'Rosario' , 'Santa Fe' , 'Urquiza 1421' , 'Delivery' , 'Sede Central' ), 
( 'TM_SE' , 'Taller Mecanico CATANIA' , 'Rosario' , 'Santa Fe' , 'Rio de Janeiro 1289' , 'Delivery Echesortu' , 'Sede Echesortu' ), 
( 'TM_SN' , 'Taller Mecanico ARROYITO' , 'Rosario' , 'Santa Fe' , 'Av. Genova 336' , 'Delivery SN' , 'Sede Nuñez' ), 
( 'TM_TS' , 'Taller Mecanico ARIJON' , 'Rosario' , 'Santa Fe' , 'Sanchez de Bustamante 754' , 'Delivery TS' , 'Tiro Suizo' ), 
( 'LP_SNC' , 'Pool Clean Mario' , 'Los Nonos' , 'Cordoba' , 'Arturo Illia 489' , 'Resort' , 'Sede Nono' )
;


-- CREACIÓN DE VISTAS BASE DE DATOS AMECROS

-- 1er VISTA:

create or replace view vw_idConvenio_nombreConvenio_codServicio as(
select nombre_conv as Convenio, cod_servicio as Servicio, id_conv as ID
from convenios
);



-- 2da VISTA: 
create or replace view vw_nombreConvenio_nombreSocio as(
select s.nombre_socio as Nombre , s.apellido_socio as Apellido, c.id_conv as Id  , c.nombre_conv as Convenio
from socios as s inner join convenios as c
on s.id_convenio = c.id_conv
);



-- 3er VISTA:

create or replace view vw_devolucionProductos as (
select id_proveedor, nombre_proveedor, devolucion_pedidos
from proveedores
where devolucion_pedidos = 'Sin Pendientes'
);



-- 4ta VISTA:

create or replace view vw_sociosMenores30 as(
select nombre_socio as Nombre, apellido_socio as Apellido , id_socio as Socio, edad_socio as Edad
from socios
where edad_socio < 30
order by Socio ASC 
);



-- 5ta VISTA:
create or replace view vw_conveniosVigentes as (
select  s.nombre_socio, s.apellido_socio , c.nombre_conv , c.vencimiento_conv
from socios as s inner join convenios as c
on s.id_convenio = c.id_conv
where vencimiento_conv > now()
);


-- 6ta VISTA: 

create or replace view vw_conveniosVencidos as (
select  s.nombre_socio, s.apellido_socio , c.nombre_conv , c.vencimiento_conv
from socios as s inner join convenios as c
on s.id_convenio = c.id_conv
where vencimiento_conv < now()
);

-- CREACIÓN DE FUNCIONES EN LA BASE DE DATOS AMECROS

-- 1RA FUNCIOÓN: 

drop function if exists fn_nombre_convenio ;
delimiter //
create function fn_nombre_convenio ( p_nombre_conv varchar (30) )
returns varchar(40) 
deterministic 
begin
 declare Convenio_Elegido varchar(40) ;
 
set Convenio_Elegido = ( 
                           select nombre_conv 
                           from convenios 
                           where nombre_conv = p_nombre_conv 
                            ) ;

set Convenio_Elegido = concat('Convenio Celebrado: ' , Convenio_Elegido);
return Convenio_Elegido ;
end//
delimiter ;



-- SEGUNDA FUNCIÓN.

drop function if exists fn_socioConvenios_vigentes;
delimiter //
create function fn_socioConvenios_vigentes (Ingrese_IdSocio int (3))
returns Varchar (150) 
deterministic
begin 
declare consulta_socio Varchar (150);
set consulta_socio = (
							select socios.id_socio 
							from socios 
							where id_convenio in ( select id_conv 
												   from convenios
												   where vencimiento_conv > now() )	
							and id_socio = Ingrese_IdSocio ) ;
set consulta_socio = concat('Socio Nro ' , consulta_socio, ': Acceso Permitido');
return consulta_socio; 
end //
delimiter ; 


-- CREACION DE STORED PROCEDURES DE LA BASE DE DATOS AMECROS

-- SP_ORDENCONVENIOS

drop procedure  if exists sp_ordenConvenios ;
 DELIMITER //
 CREATE PROCEDURE sp_ordenConvenios (INOUT P_ORDER VARCHAR(35),INOUT P_ASC_DESC VARCHAR(35))
BEGIN
  SET @STRING1 =  CONCAT('SELECT * FROM convenios ORDER BY',' ',P_ORDER, ' ',P_ASC_DESC);
  PREPARE param_stmt FROM @STRING1;
  EXECUTE param_stmt;  
  DEALLOCATE PREPARE param_stmt;
END //
DELIMITER ;


-- SP_MUDANZASOCIO

drop procedure if exists sp_mudanzaSocio;
DELIMITER //
CREATE PROCEDURE sp_mudanzaSocio (
	IN p_nueva_direccion VARCHAR (40) ,
    IN p_id_socio int (3) )
BEGIN
	UPDATE socios 
    SET domicilio_socio = p_nueva_direccion
    WHERE id_socio = p_id_socio; 
    
END //
DELIMITER ; 

-- SP: SP_ELIMINARSOCIO

drop procedure if exists sp_eliminarSocio;
delimiter //
create procedure sp_eliminarSocio (in p_id_socio int (3)) 
begin 
	delete 
	from socios 
	where id_socio = p_id_socio;
end //
delimiter ;

-- CREACIÓN TRIGGERS DE BASE DE DATOS "AMECROS" 

-- TRIGGER SOCIOS_UPDATE

DROP TABLE IF EXISTS LOG_SOCIOS_UPDATE;
CREATE TABLE IF NOT EXISTS LOG_SOCIOS_UPDATE(
	ID_LOG INT AUTO_INCREMENT , 
    NOMBRE_ACCION VARCHAR (25) , 
    NOMBRE_TABLA VARCHAR (25) , 
	USUARIO VARCHAR (25) , 
    FECHA_MODIFICACION DATE , 
	PRIMARY KEY (ID_LOG) 
);

DROP TRIGGER IF EXISTS TGR_LOG_SOCIOS_UPDATE;
DELIMITER //
CREATE TRIGGER TGR_LOG_SOCIOS_UPDATE AFTER UPDATE ON AMECROS.SOCIOS
FOR EACH ROW
BEGIN
	
INSERT INTO LOG_SOCIOS_UPDATE (NOMBRE_ACCION , NOMBRE_TABLA , USUARIO , FECHA_MODIFICACION )
VALUES ('UPDATE' , 'SOCIOS' , CURRENT_USER() , NOW() );

END //
DELIMITER ; 



-- TRIGGER SOCIOS_INSERT


DROP TABLE IF EXISTS LOG_SOCIOS_INSERT;
CREATE TABLE IF NOT EXISTS LOG_SOCIOS_INSERT(
	ID_LOG INT AUTO_INCREMENT , 
    NOMBRE_ACCION VARCHAR (25) , 
    NOMBRE_TABLA VARCHAR (25) , 
	USUARIO VARCHAR (25) , 
    FECHA_MODIFICACION DATE , 
	PRIMARY KEY (ID_LOG) 
);

DROP TRIGGER IF EXISTS TGR_LOG_SOCIOS_INSERT;
DELIMITER //
CREATE TRIGGER TGR_LOG_SOCIOS_INSERT AFTER INSERT ON AMECROS.SOCIOS
FOR EACH ROW
BEGIN
	
INSERT INTO LOG_SOCIOS_INSERT (NOMBRE_ACCION , NOMBRE_TABLE , USUARIO , FECHA_MODIFICACION )
VALUES ('INSERT' , 'SOCIOS' , CURRENT_USER() , NOW() );

END //
DELIMITER ; 



-- TRIGGER PROVEEDORES_DELETE


DROP TABLE IF EXISTS LOG_PROVEEDORES_DELETE;
CREATE TABLE IF NOT EXISTS LOG_PROVEEDORES_DELETE(
	ID_LOG INT AUTO_INCREMENT , 
    NOMBRE_ACCION VARCHAR (25) , 
    NOMBRE_TABLA VARCHAR (25) , 
	USUARIO VARCHAR (25) , 
    FECHA_MODIFICACION DATE , 
	PRIMARY KEY (ID_LOG) 
);

DROP TRIGGER IF EXISTS TGR_LOG_PROVEEDORES_DELETE;
DELIMITER //
CREATE TRIGGER TGR_LOG_PROVEEDORES_DELETE AFTER DELETE ON AMECROS.PROVEEDORES
FOR EACH ROW
BEGIN
	
INSERT INTO LOG_PROVEEDORES_DELETE (NOMBRE_ACCION , NOMBRE_TABLA , USUARIO , FECHA_MODIFICACION )
VALUES ('DELETE' , 'PROVEEDORES' , CURRENT_USER() , NOW() );

END //
DELIMITER ; 



-- TRIGGER PROVEEDORES_INSERT


DROP TABLE IF EXISTS LOG_PROVEEDORES_INSERT;
CREATE TABLE IF NOT EXISTS LOG_PROVEEDORES_INSERT(
	ID_LOG INT AUTO_INCREMENT , 
    NOMBRE_ACCION VARCHAR (25) , 
    NOMBRE_TABLA VARCHAR (25) , 
	USUARIO VARCHAR (25) , 
    FECHA_MODIFICACION DATE , 
	PRIMARY KEY (ID_LOG) 
);

DROP TRIGGER IF EXISTS TGR_LOG_PROVEEDORES_INSERT;
DELIMITER //
CREATE TRIGGER TGR_LOG_PROVEEDORES_INSERT BEFORE INSERT ON AMECROS.PROVEEDORES
FOR EACH ROW
BEGIN
	
INSERT INTO LOG_PROVEEDORES_INSERT (NOMBRE_ACCION , NOMBRE_TABLA , USUARIO , FECHA_MODIFICACION )
VALUES ('INSERT' , 'PROVEEDORES' , CURRENT_USER() , NOW() );

END //
DELIMITER ; 


-- SE CREARÁN 2 NUEVOS USARIOS: 
DROP USER IF EXISTS 'COORDINACION'@'LOCALHOST' ; 
CREATE USER IF NOT EXISTS 'COORDINACION'@'LOCALHOST' IDENTIFIED BY 'U1LH' ; 

DROP USER IF EXISTS 'ADMINISTRACION'@'LOCALHOST' ;  
CREATE USER IF NOT EXISTS 'ADMINISTRACION'@'LOCALHOST' IDENTIFIED BY 'U2LH' ; 

-- UNO DE LOS USUARIOS CREADOS DEBERA TENER PERMISOS DE SOLO LECTURA SOBRE LAS TABLAS. 
-- SOLO DAREMOS PERMISO PARA EL ESQUEMA QUE USAMOS PARA NUESTRO PROYECTO. 

GRANT SELECT ON AMECROS.* TO 'COORDINACION'@'LOCALHOST'; 
-- ESTO DARÁ PERMISO A QUE TENGA ACESSO DE LECTURA A TODOS LOS OBJETOS DEL ESQUEMA AMECROS

-- EL OTRO USUARIO DEBERÁ TENER PERMISOS DE LECTURA, INSERCIÓN Y MODIFICACIÓN DE DATOS.
-- SOLO DAREMOS PERMISO PARA EL ESQUEMA QUE USAMOS PARA NUESTRO PROYECTO. 

GRANT SELECT, INSERT, UPDATE ON *.* TO 'ADMINISTRACION'@'LOCALHOST'; 
-- "SELECT" DARÁ PERMISO DE LECTURA, "INSERT" DE INSERCIÓN Y "UPDATE" DE MODIFICACIÓN.


SET @@AUTOCOMMIT = 0 ;
SET SQL_SAFE_UPDATES = 0;

-- TABLA 1 SOBRE LA QUE TRABAJAREMOS: TABLA PROVEEDORES. 
SELECT * 
FROM PROVEEDORES
WHERE ID_PROVEEDOR = 201;


START TRANSACTION ;
DELETE FROM PROVEEDORES WHERE ID_PROVEEDOR = 201 ; 
-- ROLLBACK -- (PARA VOLVER AL PUNTO ANTERIOR AL "START TRANSACTION")
-- COMMIT -- (PARA CONFIRMAR TODOS LOS CAMBIOS HASTA ESTE MOMENTO)
-- 201	Cirstal Rock	Pago Adelantado	18580	En Stock	Sede Central -- (SENTENCIA ELIMINADA) 

-- TABLA 2 SOBRE LA QUE TRABAJAREMOS: TABLA SERVICIOS

SELECT * 
FROM SERVICIOS;

START TRANSACTION;
INSERT INTO SERVICIOS (cod_servicio , id_sucursal , costo_servicio) VALUES  ('Pleno1' , 'Sede Fisherton' , 0 ) ;
INSERT INTO SERVICIOS (cod_servicio , id_sucursal , costo_servicio) VALUES  ('Pleno2' , 'Sede Nono' , 0 ) ;
INSERT INTO SERVICIOS (cod_servicio , id_sucursal , costo_servicio) VALUES  ('Pleno3' , 'Sede Zavalla' , 0 ) ;
INSERT INTO SERVICIOS (cod_servicio , id_sucursal , costo_servicio) VALUES  ('Pleno4' , 'Sede Nuñez' , 0 ) ;
SAVEPOINT SP1; 
INSERT INTO SERVICIOS (cod_servicio , id_sucursal , costo_servicio) VALUES  ('Pleno5' , 'Sede Echesortu' , 0 ) ;
INSERT INTO SERVICIOS (cod_servicio , id_sucursal , costo_servicio) VALUES  ('Pleno6' , 'Sede Fisherton' , 0 ) ;
INSERT INTO SERVICIOS (cod_servicio , id_sucursal , costo_servicio) VALUES  ('Pleno7' , 'Sede Nono' , 0 ) ;
INSERT INTO SERVICIOS (cod_servicio , id_sucursal , costo_servicio) VALUES  ('Pleno8' , 'Sede Nuñez' , 0 ) ;
SAVEPOINT SP2; 
-- RELEASE SAVEPOINT SP1; 


CREATE DATABASE  IF NOT EXISTS `amecros` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `amecros`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: amecros
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `convenios`
--

DROP TABLE IF EXISTS `convenios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convenios` (
  `id_conv` int NOT NULL,
  `nombre_conv` varchar(50) NOT NULL,
  `fecha_conv` date DEFAULT NULL,
  `vencimiento_conv` date DEFAULT NULL,
  `cod_servicio` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_conv`),
  KEY `fk_convenio_servicio` (`cod_servicio`),
  CONSTRAINT `fk_convenio_servicio` FOREIGN KEY (`cod_servicio`) REFERENCES `servicios` (`cod_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convenios`
--

LOCK TABLES `convenios` WRITE;
/*!40000 ALTER TABLE `convenios` DISABLE KEYS */;
INSERT INTO `convenios` VALUES (1,'Amecro','2015-01-01','2025-01-01','Pleno'),(2,'Mutual 13 de Abril','2018-06-01','2022-05-31','Delivery'),(3,'Bancarios','2020-09-15','2024-09-14','Pileta Echesortu'),(4,'UNR','2017-08-13','2022-12-01','Pleno'),(5,'AEC','2015-11-13','2022-12-01','Comedor SN'),(6,'Aceiteros','2022-03-16','2023-04-22','Camping SF'),(7,'Judiciales','2019-02-08','2024-06-19','Camping SZ'),(8,'FRAPAM','2018-12-04','2023-12-04','Proveeduria'),(9,'ATE','2021-01-29','2022-01-01','Resort'),(10,'PAMI','2022-07-17','2022-12-31','Pileta SZ'),(11,'IAPOS','2021-09-22','2022-09-23','Centro Médico'),(12,'SITRATEL','2021-10-02','2023-10-01','Proveeduria');
/*!40000 ALTER TABLE `convenios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `legajo` int NOT NULL AUTO_INCREMENT,
  `nombre_empleado` char(35) NOT NULL,
  `apellido_empleado` char(35) NOT NULL,
  `dni` int NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `provincia` varchar(30) DEFAULT NULL,
  `categoria` int DEFAULT NULL,
  `id_sucursal` varchar(30) DEFAULT NULL,
  `cod_servicio` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`legajo`),
  KEY `fk_empleados_sucursal` (`id_sucursal`),
  KEY `fk_empleados_servicio` (`cod_servicio`),
  CONSTRAINT `fk_empleados_servicio` FOREIGN KEY (`cod_servicio`) REFERENCES `servicios` (`cod_servicio`),
  CONSTRAINT `fk_empleados_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Eugenio','Gonzales',35444819,'4558019','Mitre 419','Rosario','Santa Fe',2,'Sede Central','Comedor'),(2,'Luis','Martin',33190569,'3412905567','Urquiza 2139','Rosario','Santa Fe',2,'Sede Central','Comedor'),(3,'Maria','Nuñez',29891556,'3413561920','Maipu 451','Rosario','Santa Fe',2,'Sede Central','Comedor'),(4,'Lucas','Davinoch',12980560,'3413568140','Laprida 3391','Rosario','Santa Fe',3,'Sede Central','Comedor'),(5,'Nino','Aldobe',35439814,'3414558019','Mitre 890','Rosario','Santa Fe',3,'Sede Central','Delivery'),(6,'Alvaro','Robles',29044819,'34178990435','Corrientes 678','Rosario','Santa Fe',2,'Sede Central','Gimnasio'),(7,'Johana','Ruiz',31776340,'3415801690','Paraguay 1482','Rosario','Santa Fe',1,'Sede Central','Gimnasio'),(8,'Irina','Rosa',15233454,'34178732435','Junin 3390','Rosario','Santa Fe',1,'Sede Central','Centro Medico'),(9,'Luis','Blanco',35899146,'3415886309','Catmarca 331','Rosario','Santa Fe',2,'Sede Central','Centro Medico'),(10,'Martina','Roa',29029019,'34135990435','Pte. Roca 722','Rosario','Santa Fe',3,'Sede Central','Centro Medico'),(11,'Juliana','Alvarez',38290515,'3416780115','España 459','Rosario','Santa Fe',2,'Sede Central','Centro Medico'),(12,'Pablo','Lezcano',19054819,'34138690735','Italia 1231','Rosario','Santa Fe',1,'Sede Central','Centro Medico'),(13,'Mario','Broca',33044819,'34132810435','Corrientes 1322','Rosario','Santa Fe',2,'Sede Central','Proveeduria'),(14,'Nicolas','Valdez',14112569,'3413667343','Mitre 441','Rosario','Santa Fe',3,'Sede Central','Proveeduria'),(15,'Norma','Marquez',40291886,'3413991753','Buenos Aires 515','Rosario','Santa Fe',1,'Sede Central','Proveeduria'),(16,'Kevin','Ortiz',17442890,'3412489315','JM Rosas 4414','Rosario','Santa Fe',3,'Sede Central','Proveeduria'),(17,'Daniel','Herrera',41291886,'3415671753','Viamonte 998','Rosario','Santa Fe',3,'Sede Central','Proveeduria'),(18,'Gonzalo','Batiatio',25765890,'3413991753','Avellaneda 1568','Rosario','Santa Fe',1,'Sede Central','Proveeduria'),(19,'Gonzalo','Savio',38145670,'3412670285','Tucuman 1455','Rosario','Santa Fe',2,'Sede Central','Proveeduria'),(20,'Bianca','Auer',41669156,'3412816522','Buenos Aires 1532','Rosario','Santa Fe',2,'Sede Central','Proveeduria'),(21,'Fernando','Casas',33175914,'341748219','Alvear 248','Rosario','Santa Fe',3,'Sede Central','Proveeduria'),(22,'Roberto','Espinoza',330146186,'3413654753','Santiago 3315','Rosario','Santa Fe',2,'Sede Central','Proveeduria'),(23,'Silvana','Careli',28571925,'3412581752','Pueyrredon 1617','Rosario','Santa Fe',3,'Sede Funes','Camping SF'),(24,'Andres','Rucci',34185715,'3413341753','Jujuy 2311','Rosario','Santa Fe',1,'Sede Funes','Camping SF'),(25,'Gonzalo','Horvat',12636923,'3414678251','San Lorenzo 3421','Funes','Santa Fe',1,'Sede Funes','Camping SF'),(26,'Mariano','Acosta',17291886,'34154989753','Miraflores','Funes','Santa Fe',1,'Sede Funes','Pileta SF'),(27,'Fausto','De Angelis',25827502,'341245185','S. de Bustamante 2526','Rosario','Santa Fe',1,'Tiro Suizo','Buffet'),(28,'Maria Soledad','Gahona',26291886,'3413884753','Pte Quintana 3317','Rosario','Santa Fe',1,'Tiro Suizo','Buffet'),(29,'Gabriela','Furia',31291453,'3413991665','Bv Oroño 5561','Rosario','Santa Fe',3,'Tiro Suizo','Buffet'),(30,'Marcelo','Botta',21562684,'3415761589','Buenos Aires 4515','Rosario','Santa Fe',3,'Tiro Suizo','Boxeo'),(31,'Juan Ignacio','Mansilla',42291886,'3413225763','Junin 4832','Rosario','Santa Fe',2,'Tiro Suizo','Delivery TS'),(32,'Tomas','Grillo',32791480,'343562941766','Colombia 5322','Los Nonos','Cordoba',3,'Sede Nono','Resort'),(33,'Juan Ignacio','Zarate',40296936,'343513991753','Jauretche 5832','Los Nonos','Cordoba',1,'Sede Nono','Resort'),(34,'Victor','Russo',28572525,'34351267823','Colorados 2492','Los Nonos','Cordoba',1,'Sede Nono','Resort'),(35,'Ivan','Brodolonich',36291649,'3413943753','Marcos Paz 527','Rosario','Santa Fe',2,'Sede Fisherton','Proveeduria F'),(36,'Camila','Urruchua',37291386,'3412431854','Salta 3019','Rosario','Santa Fe',1,'Sede Fisherton','Proveeduria F'),(37,'Paloma','Caceres',39291314,'3412907634','Albevar 3492','Rosario','Santa Fe',1,'Sede Fisherton','Proveeduria F'),(38,'Carla','Colombres',41756986,'3412761743','Rioja 418','Rosario','Santa Fe',2,'Sede Fisherton','Proveeduria F'),(39,'Manuel','Dominguez',38761855,'3415954053','Republica 482','Rosario','Santa Fe',1,'Sede Fisherton','Proveeduria F'),(40,'Cesar','Delgado',33729176,'3412528017','Buenos Aires 215','Rosario','Santa Fe',1,'Sede Fisherton','Proveeduria F'),(41,'Joel','Chichor',33891657,'3413886552','Colombre 2345','Rosario','Santa Fe',1,'Sede Nuñez','Comedor SN'),(42,'Rocio','Trovanes',44814876,'3413991753','Martin Fierro 4092','Rosario','Santa Fe',1,'Sede Nuñez','Comedor SN'),(43,'Florencia','Polans',17462817,'341581652','3 de Febrero 2325','Rosario','Santa Fe',3,'Sede Nuñez','Comedor SN'),(44,'Jesica','Liniers',38716491,'3413198026','Mendoza 3825','Rosario','Santa Fe',2,'Sede Nuñez','Pileta SN'),(45,'Maria Angeles','Croceto',38917526,'3414621751','Guatemala 485','Rosario','Santa Fe',3,'Sede Nuñez','Pileta SN'),(46,'Esteban','Graffo',33781652,'3415681572','San Juan 158','Rosario','Santa Fe',2,'Sede Nuñez','Delivery SN'),(47,'Ignacio','Acosta',38716592,'3415186294','Andes 3814','Zavalla','Santa Fe',1,'Sede Zavalla','Camping SZ'),(48,'Nanci','Carloni',18452650,'3413451356','Fuerza Aerea 528','Zavalla','Santa Fe',3,'Sede Zavalla','Camping SZ'),(49,'Dario','Mazzei',18372562,'3413662858','Los Cocos 492','Zavalla','Santa Fe',1,'Sede Zavalla','Pileta SZ'),(50,'Jonatan','Herrera',40247156,'341258268','Alsina 981','Rosario','Santa Fe',2,'Sede Echesortu','Comedor Echesortu'),(51,'Washington','Camacho',37268915,'3415784721','Castellanos 2852','Rosario','Santa Fe',1,'Sede Echesortu','Comedor Echesortu'),(52,'German','Herrera',28573015,'3413558203','Constitucion 1345','Rosario','Santa Fe',2,'Sede Echesortu','Comedor Echesortu'),(53,'Hernan','Castellano',34291146,'3415682729','Lavalle 1288','Rosario','Santa Fe',1,'Sede Echesortu','Comedor Echesortu'),(54,'Camila','Aldao',12187562,'3413801965','Lima 1480','Rosario','Santa Fe',3,'Sede Echesortu','Pileta Echesortu'),(55,'Juan','Segundo',33726195,'3412545081','Gutemberg 2391','Rosario','Santa Fe',1,'Sede Echesortu','Delivery Echesortu');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL,
  `nombre_proveedor` varchar(20) DEFAULT NULL,
  `pagos_proveedor` varchar(25) DEFAULT NULL,
  `deuda_proveedor` int DEFAULT NULL,
  `devolucion_pedidos` varchar(30) DEFAULT NULL,
  `id_sucursal` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `fk_proveedor_sucursal` (`id_sucursal`),
  CONSTRAINT `fk_proveedor_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (101,'Laury','Cuenta Corriente',45000,'Sin Pendientes','Sede Central'),(102,'La Mercantil','Pagare',12000,'Sin Pendientes','Sede Funes'),(103,'ExoPress SRL','Pagare',90,'Sin Pendientes','Tiro Suizo'),(104,'Le Marque','Cheques',0,'Sin Stock','Sede Nono'),(105,'Egipciana','Cheques',0,'Sin Stock','Sede Fisherton'),(106,'GastroMedia','Cheques',0,'Sin Pendientes','Sede Nuñez'),(107,'Gerdau SA','Cuenta Corriente',8900,'En Stock','Sede Zavalla'),(108,'Puente Gallegos','Pagare',200,'En Stock','Sede Echesortu'),(201,'Cirstal Rock','Pago Adelantado',18580,'En Stock','Sede Central'),(202,'Paroli SRL','Cuenta Corriente',4300,'En Stock','Sede Funes'),(203,'Arrow','Pago Adelantado',67100,'Sin Pendientes','Tiro Suizo'),(204,'Finger Foods','Pagare',670,'Sin Pendientes','Sede Nono'),(205,'Glutal SA','Cuenta Corriente',5000,'Sin Pendientes','Sede Fisherton'),(206,'Gitanes SRL','Cuenta Corriente',45000,'Sin Pendientes','Sede Nuñez'),(207,'Pavon Arriba','Cheques',5000,'Sin Pendientes','Sede Zavalla'),(208,'San Roman SA','Cheques',1300,'En Stock','Sede Echesortu'),(301,'Aspen','Cuenta Corriente',2000,'Sin Pendientes','Sede Central'),(302,'Amazonas','Cuenta Corriente',3810,'Sin Pendientes','Sede Funes'),(303,'Food Service','Cuenta Corriente',5410,'Sin Stock','Tiro Suizo'),(304,'Urban Velvet','Cuenta Corriente',4500,'Sin Pendientes','Sede Nono'),(305,'Cotal SRL','Pago Adelantado',2300,'En Stock','Sede Fisherton'),(306,'Baliarda','Pago Adelantado',30000,'Sin Stock','Sede Nuñez'),(401,'Genemma','Cheques',180,'Sin Pendientes','Sede Central'),(405,'La Cabaña Coop','Cuenta Corriente',800,'Sin Pendientes','Sede Fisherton'),(501,'Manghi','Cheques',9015,'Sin Stock','Sede Central');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serv_externos`
--

DROP TABLE IF EXISTS `serv_externos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serv_externos` (
  `ID_SERV` varchar(10) NOT NULL,
  `COD_TAREA` varchar(40) DEFAULT NULL,
  `CIUDAD` varchar(30) DEFAULT NULL,
  `PROVINCIA` varchar(30) DEFAULT NULL,
  `DOMICILIO` varchar(40) DEFAULT NULL,
  `COD_SERVICIO` varchar(30) DEFAULT NULL,
  `ID_SUCURSAL` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_SERV`),
  KEY `fk_servicios_externos` (`COD_SERVICIO`),
  KEY `fk_sucursal_externos` (`ID_SUCURSAL`),
  CONSTRAINT `fk_servicios_externos` FOREIGN KEY (`COD_SERVICIO`) REFERENCES `servicios` (`cod_servicio`),
  CONSTRAINT `fk_sucursal_externos` FOREIGN KEY (`ID_SUCURSAL`) REFERENCES `sucursales` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serv_externos`
--

LOCK TABLES `serv_externos` WRITE;
/*!40000 ALTER TABLE `serv_externos` DISABLE KEYS */;
INSERT INTO `serv_externos` VALUES ('LP_SNC','Pool Clean Mario','Los Nonos','Cordoba','Arturo Illia 489','Resort','Sede Nono'),('TM_SC','Taller Mecanico LUIS','Rosario','Santa Fe','Urquiza 1421','Delivery','Sede Central'),('TM_SE','Taller Mecanico CATANIA','Rosario','Santa Fe','Rio de Janeiro 1289','Delivery Echesortu','Sede Echesortu'),('TM_SN','Taller Mecanico ARROYITO','Rosario','Santa Fe','Av. Genova 336','Delivery SN','Sede Nuñez'),('TM_TS','Taller Mecanico ARIJON','Rosario','Santa Fe','Sanchez de Bustamante 754','Delivery TS','Tiro Suizo');
/*!40000 ALTER TABLE `serv_externos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `cod_servicio` varchar(30) NOT NULL,
  `id_sucursal` varchar(30) DEFAULT NULL,
  `costo_servicio` int DEFAULT NULL,
  PRIMARY KEY (`cod_servicio`),
  KEY `fk_servicios_sucursales` (`id_sucursal`),
  CONSTRAINT `fk_servicios_sucursales` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES ('Boxeo','Tiro Suizo',1000),('Buffet','Tiro Suizo',480),('Camping SF','Sede Funes',500),('Camping SZ','Sede Zavalla',500),('Centro Médico','Sede Central',700),('Comedor','Sede Central',380),('Comedor Echesortu','Sede Echesortu',480),('Comedor SN','Sede Nuñez',420),('Delivery','Sede Central',420),('Delivery Echesortu','Sede Echesortu',340),('Delivery SN','Sede Nuñez',340),('Delivery TS','Tiro Suizo',420),('Gimnasio','Sede Central',1500),('Pileta Echesortu','Sede Echesortu',350),('Pileta SF','Sede Funes',350),('Pileta SN','Sede Nuñez',300),('Pileta SZ','Sede Zavalla',350),('Pleno','Sede Central',0),('Proveeduria','Sede Central',450),('Proveeduria F','Sede Fisherton',450),('Resort','Sede Nono',19000);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios`
--

DROP TABLE IF EXISTS `socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socios` (
  `id_socio` int NOT NULL AUTO_INCREMENT,
  `nombre_socio` char(15) DEFAULT NULL,
  `apellido_socio` char(15) DEFAULT NULL,
  `edad_socio` int DEFAULT NULL,
  `dni_socio` int NOT NULL,
  `domicilio_socio` varchar(20) DEFAULT NULL,
  `ciudad` varchar(15) DEFAULT NULL,
  `provincia` varchar(15) DEFAULT NULL,
  `id_convenio` int NOT NULL,
  PRIMARY KEY (`id_socio`),
  KEY `fk_socios_convenio` (`id_convenio`),
  CONSTRAINT `fk_socios_convenio` FOREIGN KEY (`id_convenio`) REFERENCES `convenios` (`id_conv`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios`
--

LOCK TABLES `socios` WRITE;
/*!40000 ALTER TABLE `socios` DISABLE KEYS */;
INSERT INTO `socios` VALUES (1,'Ruben Mario','Ghioldi',70,10538523,'Urquiza 1354 8 D','Rosario','Santa Fe',1),(2,'Carmen Elena','Salguero',68,11345827,'Urquiza 1354 8 D','Rosario','Santa Fe',1),(3,'Sara','Sabatinsky',32,34356377,'Israel 233','Rosario','Santa Fe',1),(4,'Carlos Alberto','Muller',33,34459643,'Israel 233','Rosario','Santa Fe',1),(5,'Marina Leonor','Gahona',65,12176472,'Brown 1922','Rosario','Santa Fe',1),(6,'Hector Daniel','Salguero',67,12112649,'Brown 1922','Rosario','Santa Fe',1),(7,'Fernando','Salguero',19,43736927,'Brown 1922','Rosario','Santa Fe',1),(8,'Susana','Treviño',26,38635996,'San Lorenzo 354 5 A','Rosario','Santa Fe',1),(9,'Jorge','Garcia',30,37625183,'Santa Fe 1482 8 B','Rosario','Santa Fe',1),(10,'Damian','Silvano',27,38837261,'Reconquista 675','Rosario','Santa Fe',1),(11,'Gloria','Rodriguez',46,25538523,'Alberdi 1237','Rosario','Santa Fe',1),(12,'Esteban','Margutti',35,34583332,'Cordoba 451 1 B','Rosario','Santa Fe',2),(13,'Julieta','Lopez',33,34783314,'Nicaragua 3412','Rosario','Santa Fe',2),(14,'Mauricio','Prodan',28,37585832,'Salta 2245 5 D','Rosario','Santa Fe',1),(15,'Analia','Tosi',59,16583632,'Laguna 1153','Rosario','Santa Fe',3),(16,'Carlos','Alvarez',22,40287174,'Catamarca 2331 13 C','Rosario','Santa Fe',3),(17,'Natalia','Gonzales',24,39383311,'Richieri 143 2 B','Rosario','Santa Fe',4),(18,'Ignacio','Lopez',35,34482332,'Juan B. Justo 1340','Rosario','Santa Fe',4),(19,'Esteban','Hernandez',90,4583332,'Dorrego 192 4 C','Rosario','Santa Fe',5),(20,'Esteban','Zucceti',57,34583332,'Cordoba 451 1 B','Rosario','Santa Fe',5),(21,'Marcos','Arnedo',62,14583332,'Arijon 1643','Rosario','Santa Fe',1),(22,'Juliana','Acevedo',35,34583332,'Paraguay 782','Rosario','Santa Fe',2),(23,'Esteban','Napolitano',35,34583332,'Corrientes 1892','Rosario','Santa Fe',3),(24,'Ricardo','Vallejos',35,34583332,'Moreno 2261','Rosario','Santa Fe',1),(25,'Norma','Rios',31,37688232,'Pellegrini 890','Rosario','Santa Fe',6),(26,'Alan','Bonansea',35,34583332,'Valle Alpino','Los Nonos','Cordoba',9),(27,'Camila','Castellanos',13,44223332,'Los Alerces','Rosario','Santa Fe',11),(28,'Vanesa','Lara',23,34583332,'Nicaragua 267','Rosario','Santa Fe',3),(29,'Guido','Romani',51,24826732,'Cordoba 998 4 F','Rosario','Santa Fe',2),(30,'Yanina','Margutti',35,34583332,'Mitre 371','Rosario','Santa Fe',6),(31,'Greta','Torres',17,42876510,'Maipu 2134','Rosario','Santa Fe',6),(32,'Sofia','Marolio',19,40184163,'Laprida 3425','Rosario','Santa Fe',7),(33,'Florencia','Dupuy',47,23635183,'9 de Julio 231','Rosario','Santa Fe',7),(34,'Marina','Vecchio',41,23672836,'Ameghino 3416','Rosario','Santa Fe',8),(35,'Federico','Blanco',35,33826118,'Avellaneda 671','Rosario','Santa Fe',8),(36,'Mario','Martinez',33,35194817,'Valle Alpino 215','Los Nonos','Cordoba',9),(37,'Esteban','Alvarez',38,31857109,'Talleres 2834','Los Nonos','Cordoba',9),(38,'Franco','Ledesma',34,34567139,'Weelright 14','Rosario','Santa Fe',10),(39,'Juan Cruz','Lezcano',35,34583332,'Av. Belgrano 1456','Rosario','Santa Fe',10),(40,'Esteban','Lencinas',41,34583332,'3 de Febrero 215','Rosario','Santa Fe',11),(41,'Javier','Sgerebiglia',32,35126439,'San Luis 3076 2','Rosario','Santa Fe',12),(42,'Valeria','Rearte',35,34887332,'Junin 223 3 A','Rosario','Santa Fe',12),(43,'Silvia','Carelli',55,25817244,'Tucuman 4614','Rosario','Santa Fe',5),(44,'Federico','Ghioldi',33,34185105,'Zeballos 1260 2 D','Rosario','Santa Fe',1),(45,'Eduardo','Ghioldi',30,36538510,'Zeballos 1260 2 D','Rosario','Santa Fe',1),(46,'Alfonso','Caraglio',45,22672336,'Cordiviola 257','Rosario','Santa Fe',8),(47,'Alfonso','Parot',31,36187614,'Rioja 1514','Rosario','Santa Fe',5),(48,'Yamila','Veliz',27,37841717,'Instituto 161','Los Nonos','Cordoba',9),(49,'Florencia','Andino',28,36238142,'España 637','Rosario','Santa Fe',7),(50,'Irene','Alencar',29,36784168,'Santa Fe 1482 7 C','Rosario','Santa Fe',3),(51,'Rico','Aldo',53,22573928,'Alvear 938','Rosario','Santa Fe',2),(52,'Cheviteli','Mariano',26,39827821,'27 de Febrero 1246','Rosario','Santa Fe',4),(53,'Joplin','Juan',30,36872018,'Lamadrid 917','Rosario','Santa Fe',6),(54,'Fiera','Rodrigo',33,35817462,'Montes de Oca 5528','Los Nonos','Cordoba',9),(55,'Espert','Javier',18,45489154,'Santa Fe 1629 9 E','Rosario','Santa Fe',4),(56,'Diego','Maria',87,5726103,'Catamarca 331','Rosario','Santa Fe',5),(57,'Farias','Gonzalo',42,27563821,'Buenos Aires 781','Rosario','Santa Fe',2),(58,'Montesano','Francisco',19,41817563,'Maipu 4171','Rosario','Santa Fe',8),(59,'Trevi','Gloria',26,38383175,'Cabildo 225','Rosario','Santa Fe',6),(60,'Soldini','Lara',21,41938105,'Entre Rios 901','Rosario','Santa Fe',4),(61,'Farias','Ernesto',20,42094638,'Pte Roca 1456 3 A','Rosario','Santa Fe',11),(62,'Russo','Marcos',33,34141991,'Piano 652','Rosario','Santa Fe',8),(63,'Farias','Damian',92,5998174,'Avenida Rosario 1543','Rosario','Santa Fe',12),(65,'Rolan','Zielinsky',48,26338194,'Arijon 1644','Rosario','Santa Fe',4);
/*!40000 ALTER TABLE `socios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `id_sucursal` varchar(50) NOT NULL,
  `domicilio` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `provincia` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `celular` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES ('Sede Central','Mitre 362','Rosario','Santa Fe','mutualamecro@gmail.com','3414256456','3415802765'),('Sede Echesortu','San Nicolas 1452','Rosario','Santa Fe','amecroechesortu@gmail.com','03414256286','3416709915'),('Sede Fisherton','9 de Julio 1455','Rosario','Santa Fe','amecrofisherton@gmail.com','03414277552','3415603318'),('Sede Funes','Eva Perón 8032','Funes','Santa Fe','amecrofunes@gmail.com','03413256490','3416061890'),('Sede Nono','Illia 486','Los Nonos','Cordoba','amecrohotelnonos@gmail.com','0343524236533','34353151677'),('Sede Nuñez','Ricardo Nuñez 224','Rosario','Santa Fe','amecronuñez@gmail.com','03414889009','3412395456'),('Sede Zavalla','Av SiempreViva 224','Zavalla','Santa Fe','amecrozavalla@gmail.com','03414556623','3416906090'),('Tiro Suizo','S. Bustamante 744','Rosario','Santa Fe','amecrosur@gmail.com','03414267512','3416234066');
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-06 22:13:30
