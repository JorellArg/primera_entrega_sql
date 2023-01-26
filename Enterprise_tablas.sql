-- Creación del esquema "Enterprise"

create schema enterprise;

-- Uso del esquema
USE enterprise;

-- Creación de las tablas

-- Tabla: ESTADOS

CREATE TABLE ESTADOS (
Id_Est_Func	Int Auto_increment Unique Not null PRIMARY KEY ,
Fec_Init_Est Date,
Fec_Fin_Est	Date,
Est_Func Varchar(30));

-- Tabla: DOMICILIO

CREATE TABLE DOMICILIO (
Id_Dom	Int Auto_increment Unique Not null PRIMARY KEY,
País_Dom Varchar(20),
Prov_Dom Varchar(20),
Loc_Dom Varchar(35),
Calle_Dom Varchar(25),
Num_Dom Int,
Piso_Dom Int,
Dep_Dom Varchar(4),
EC1_Dom Varchar(25),
EC2_Dom Varchar(25));

-- Tabla: FUNCION

CREATE TABLE FUNCION (
Id_Func Int Auto_increment Unique Not null PRIMARY KEY,
Fec_Alta_Func Date,
Cargo_Func Varchar(35),
Hor_Func Varchar(13),
Turno_Func Varchar(2),
Id_Est_Func Int,
FOREIGN KEY (Id_Est_Func) 
REFERENCES ESTADOS(Id_Est_Func),
Observ_Func Varchar(250),
Fec_Baja_Func Date);

-- Tabla: Área

CREATE TABLE AREA (
Id_A Int Auto_increment Unique Not null PRIMARY KEY,
Nomb_A Varchar(35),
Ger Varchar(35),
Dir_A Varchar(35),
Clase_A Varchar(3));

-- Tabla: Contacto

CREATE TABLE CONTACTO (
Id_Contact	Int Auto_increment Unique Not null PRIMARY KEY,
Tel_Contact Int,
Cel_Contact Int,
Mail_Contact Varchar(50),
MailC_Contact Varchar(50),
Red_Contact Varchar(50));

-- Tabla: Personal

CREATE TABLE PERSONAL(
Id_Pers Int Auto_increment Unique Not null PRIMARY KEY,
Id_A Int,
FOREIGN KEY (Id_A) 
REFERENCES AREA(Id_A),
Id_Func Int,
FOREIGN KEY (Id_Func) 
REFERENCES FUNCION(Id_Func),
Id_Dom Int,
FOREIGN KEY (Id_Dom) 
REFERENCES DOMICILIO(Id_Dom),
Id_Contact Int,
FOREIGN KEY (Id_Contact) 
REFERENCES CONTACTO(Id_Contact),
Nomb_Pers Varchar(50),
Ape_Pers Varchar(50),
DNI_Pers Int,
Fec_Nac Date,
Gen_Pers Varchar(1));
