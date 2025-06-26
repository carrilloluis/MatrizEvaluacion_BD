/*
@description Gestión de Matrices de Evaluación.
@author Luis Carrillo Gutiérrez
@date Septiembre, 2017
@version 0.0.1
*/

CREATE TABLE IF NOT EXISTS ab ( -- Docente
a_ INTEGER PRIMARY KEY AUTOINCREMENT, -- docenteID [PK]
b_ VARCHAR(120) NOT NULL  -- nombre completo
);

CREATE TABLE IF NOT EXISTS bc ( -- Carrera Profesional
a_ INTEGER PRIMARY KEY AUTOINCREMENT, -- carreraProfID [PK]
b_ VARCHAR(80) NOT NULL -- nombre/descripción
);

CREATE TABLE IF NOT EXISTS cd ( -- Curso/Asignatura
a_ INTEGER PRIMARY KEY AUTOINCREMENT, -- cursoID [PK]
b_ VARCHAR(120) NOT NULL -- nombre/descripción
);

CREATE TABLE IF NOT EXISTS a001 ( -- Oferta Académica
a_ INTEGER PRIMARY KEY AUTOINCREMENT, -- ofertaAcadémicaID [PK]
b_ INTEGER UNSIGNED NOT NULL, -- carreraProfID [FK]
c_ INTEGER UNSIGNED NOT NULL, -- cursoID [FK]
d_ CHAR(4) NOT NULL, -- año de dictado 
e_ CHAR(1) NOT NULL, -- extensión temporal { mensual = 0, bimestral, trimestral, ..., anual }
f_ CHAR(2) NOT NULL, -- numeración { I, II, ... }
g_ INTEGER UNSIGNED NOT NULL, -- docenteID/teoría [FK]
h_ INTEGER UNSIGNED NULL, -- docenteID/práctica/responsable laboratorio
i_ DATE NOT NULL, -- fecha tentativa de inicio del dictado
FOREIGN KEY (b_) REFERENCES bc(a_),
FOREIGN KEY (c_) REFERENCES cd(a_),
FOREIGN KEY (g_) REFERENCES ab(a_)
);

CREATE TABLE IF NOT EXISTS de ( -- Unidad Formativa
a_ INTEGER PRIMARY KEY AUTOINCREMENT, -- unidadFormativaID [PK]
b_ VARCHAR(120) NOT NULL, -- descripción general
c_ INTEGER UNSIGNED NOT NULL, -- ofertaAcadémicaID [FK]
FOREIGN KEY (c_) REFERENCES a001(a_) 
);

CREATE TABLE IF NOT EXISTS ef ( -- Matriz de Evaluación
a_ INTEGER PRIMARY KEY AUTOINCREMENT, -- matrizEvaluaciónID [PK]
b_ INTEGER UNSIGNED NOT NULL, -- ofertaAcadémicaIDID [FK]
c_ INTEGER UNSIGNED NOT NULL, -- unidadFormativaID [FK]
d_ DATE NOT NULL, -- fecha de aplicación de la matriz de evaluación
FOREIGN KEY (b_) REFERENCES a001(a_), 
FOREIGN KEY (c_) REFERENCES de(a_) 
);

CREATE TABLE IF NOT EXISTS fg ( -- Detalle de la Matriz de Ev.
a_ INTEGER PRIMARY KEY AUTOINCREMENT, -- detalleID [PK]
b_ INTEGER UNSIGNED NOT NULL, -- matrizEvaluaciónID [FK]
c_ INTEGER UNSIGNED NOT NULL, -- número de sesión
d_ VARCHAR(140) NOT NULL, -- dominio de aprendizaje (objetivos)
e_ BOOLEAN NOT NULL DEFAULT false, -- Criterio/Información verbal 
f_ BOOLEAN NOT NULL DEFAULT false, -- Criterio/Destreza intelectual
g_ BOOLEAN NOT NULL DEFAULT false, -- Criterio/Estrategia cognitiva
h_ BOOLEAN NOT NULL DEFAULT false, -- Criterio/Actitudinal
i_ INTEGER UNSIGNED NOT NULL, -- item-orden de aparición
j_ FLOAT NOT NULL, -- puntuaje/puntos/puntuación
FOREIGN KEY (b_) REFERENCES ef(a_) 
);
