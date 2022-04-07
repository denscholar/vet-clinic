/* Database schema to keep the structure of entire database. */

USE vet_clinic;
CREATE TABLE animals
(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
escape_attempts INT NOT NULL,
neutered BOOLEAN NOT NULL,
weight_kg FLOAT NOT NULL
);

ALTER TABLE animals
ADD species VARCHAR(100);