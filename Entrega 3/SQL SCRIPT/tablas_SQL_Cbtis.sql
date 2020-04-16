DROP DATABASE IF EXISTS BD_CEBTIS; 
#Crea una base de datos. 
CREATE DATABASE BD_CEBTIS; 

USE BD_CEBTIS; 

CREATE TABLE EXAMEN
(
  ID_Examen int(5) NOT NULL AUTO_INCREMENT,
  Num_Preguntas int(30) DEFAULT NULL,
  tiempo_Limite int(30) DEFAULT NULL, 
  PRIMARY KEY (ID_Examen)
);

CREATE TABLE SECCION(
	ID_Seccion int(5) NOT NULL,
    Nombre_Seccion varchar (50) DEFAULT NULL, 
    PRIMARY KEY (ID_Seccion)
);

CREATE TABLE FORMADO_POR(
	ID_Examen int(5) NOT NULL AUTO_INCREMENT,
    ID_Seccion int(5) NOT NULL,
    PRIMARY KEY (ID_Examen, ID_Seccion)
);

CREATE TABLE ROL(
	ID_ROL int(5) NOT NULL,
    Nombre_ROL varchar (50) DEFAULT NULL, 
    PRIMARY KEY (ID_ROL)
);

CREATE TABLE PERMISOS(
	ID_PERMISOS int(5) NOT NULL,
    ID_ROL int(5) DEFAULT NULL,
    Privilegios int (5) DEFAULT NULL,
    PRIMARY KEY (ID_PERMISOS),
    FOREIGN KEY (ID_ROL) REFERENCES ROL(ID_ROL)
);

CREATE TABLE ESTUDIANTE(
    Ficha int(30) NOT NULL,
	CURP varchar(30) NOT NULL, 
    ID_ROL int(5) NOT NULL,
    Nombre_Completo varchar (5) DEFAULT NULL,
    Correo varchar (30) DEFAULT NULL,
    TelefonoFijo int(30) DEFAULT NULL,
    TelefonoCelular int(30) DEFAULT NULL,
    OpcionCarrera_1 varchar(30) DEFAULT NULL,
    OpcionCarrera_2 varchar(30) DEFAULT NULL,
    OpcionCarrera_3 varchar(30) DEFAULT NULL,
    EstadoNacimiento varchar (30) DEFAULT NULL, 
    FechaExamen int (30) DEFAULT NULL, 
    HoraExamen int (30) DEFAULT NULL,
    
    PRIMARY KEY (Ficha)
);

CREATE TABLE USUARIO(
    NumeroNomina int(5) NOT NULL,
	CURP varchar(30) NOT NULL, 
    ID_ROL int(5) NOT NULL,
    Nombre_Completo varchar (5) DEFAULT NULL,
    Correo varchar (30) DEFAULT NULL,
    TelefonoFijo int(30) DEFAULT NULL,
    TelefonoCelular int(30) DEFAULT NULL,
    
    PRIMARY KEY (NumeroNomina)
    
);

#RELACION ENTRE USUARIO Y ROL 
CREATE TABLE TIENE(
	NumeroNomina varchar (30) NOT NULL,
    ID_ROL int(5) DEFAULT NULL,

    PRIMARY KEY (NumeroNomina, ID_ROL),
    FOREIGN KEY (ID_ROL) REFERENCES ROL(ID_ROL)

);

#RELACION ENTRE ESTUDIANTE Y ROL 
CREATE TABLE TIENE_ESTUDIANTE (
	Ficha varchar (30) NOT NULL,
    ID_ROL int(5) DEFAULT NULL,

    PRIMARY KEY (Ficha, ID_ROL),
    FOREIGN KEY (ID_ROL) REFERENCES ROL(ID_ROL)
);


CREATE TABLE PREGUNTAS(
    ID_PREGUNTA int(5) NOT NULL,
	RecursoVisual LONGBLOB DEFAULT NULL, 
    RecursoTexto TEXT DEFAULT NULL,
 
    PRIMARY KEY (ID_PREGUNTA)
    
);

# Relacion entre examn y estudiante 
CREATE TABLE PRESENTAN (
    ID_PRESENTAN int (5) NOT NULL, 
	ID_Examen int(5) DEFAULT NULL,
    Ficha int(30) DEFAULT NULL,
	
    PRIMARY KEY (ID_PRESENTAN, ID_Examen, Ficha) ,
    FOREIGN KEY (ID_Examen) REFERENCES EXAMEN(ID_Examen)
	
);