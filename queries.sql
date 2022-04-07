/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered = true and escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu'; 
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT name, neutered FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name = 'Gabumon';
SELECT name FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


-- Project 2 

BEGIN;
UPDATE animals
SET species = 'unspecified';

SELECT name, species FROM animals;

ROLLBACK;

SELECT name, species FROM animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

SELECT species, name FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;


SELECT * FROM animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SELECT name, date_of_birth FROM animals; 

SAVEPOINT species_;

UPDATE animals
SET weight_kg = weight_kg * -1;
SELECT name, weight_kg FROM animals;

ROLLBACK TO species_;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT name, weight_kg FROM animals;

-- QUERIES

SELECT COUNT(*) as total_number_of_animals FROM animals;

SELECT COUNT(*) as animals_not_tried_to_escape FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) as average_weight FROM animals;

SELECT neutered, SUM(escape_attempts) as escape_attempted FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg) as min_weight, MAX(weight_kg) as max_weight FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) as avergage_escape_attempted FROM animals
WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000
GROUP BY species;