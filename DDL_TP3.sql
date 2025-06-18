drop database if exists Colegio;

create database colegio;

use colegio;

create table profesores(
	id_profesor int auto_increment primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    dni varchar(8) not null unique,
    fechaNacimiento date,
    email varchar(100),
    numeroTelefonico varchar(20) not null,
    especialidad varchar(50) not null
    );

create table cursos(
	id_curso int auto_increment primary key,
    anio int not null check (anio between 1 and 6),
    nivel enum("Primaria", "Secundariqa") not null,
    turno enum("mañana", "tarde") not null,
    division char(20),
    constraint division_primaria_secundaria check(
		(nivel = "Primaria" and division is null) or
        (nivel = "secundaria" and division in ("Economia", "Comunicaciones", "Naturales"))
    )
);

create table alumnos(
	id_alumno int auto_increment primary key,
	nombre varchar(50) not null,
    apellido varchar(50) not null,
    dni varchar(8) not null unique,
    fechaNacimiento date,
    emial varchar(100),
    id_curso int not null
);

create table materias(
	id_materia int auto_increment primary key,
    nombreMateria varchar(100) not null,
    descripcion varchar(200),
    id_profesor int not null
);

create table calificaciones(
	id_calificaciones int auto_increment primary key,
    id_alumno int not null,
    id_materia int not null,
    nota decimal(3,1) check (nota between 1 and 10),
    estadoAprobacion enum("Aprobado", "desaprbado", "Pendiente") not null
);