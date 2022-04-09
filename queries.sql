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

-- Project 3

SELECT animals.name
FROM animals 
INNER JOIN owners 
ON animals.owner_id = owners.id 
WHERE owners.name = 'Melody Pond';  

SELECT animals.name
FROM animals 
INNER JOIN species 
ON animals.species_id = species.id 
WHERE species.name = 'Pokemon';

SELECT owners.name as owner_name, animals.name as animal_name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.id)
FROM species
JOIN animals ON species.id = animals.species_id
GROUP BY species.name;

SELECT animals.name as animal_name
FROM owners
JOIN animals ON owners.id = animals.owner_id
JOIN species ON species.id = animals.species_id
WHERE species.name = 'Digimon' AND owners.name = 'Jennifer Orwell'; 

SELECT animals.name as animal_name
FROM owners
JOIN animals ON owners.id = animals.owner_id
WHERE owners.name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT filtered name
FROM (
  SELECT owners.name as owner_name, COUNT(animals.id) as animals_owned 
  FROM owners
  JOIN animals ON owners.id = animals.owner_id
  GROUP BY owners.name
) AS filtered
WHERE filtered.animals_owned = 
  (
    SELECT MAX (filtered.animals_owned)
    FROM (
      SELECT owners.name as owner_name, COUNT(animals.id) as animals_owned 
      FROM owners
      JOIN animals ON owners.id = animals.owner_id
      GROUP BY owners.name
    ) AS filtered
);

-- Project 4

SELECT vets.name, animals.name, visits.date_of_visit  
FROM animals
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;  

CREATE VIEW Stephanie_Mendez AS
  SELECT animals.name, COUNT(animals.name) 
  FROM animals
  JOIN visits ON visits.animal_id = animals.id
  JOIN vets Ve ON visits.vets_id = vets.id
  WHERE vets.name = 'Stephanie Mendez'
  GROUP BY animals.name;

SELECT COUNT(name) FROM Stephanie_Mendez;

SELECT vets.name, species.name
FROM vets
LEFT JOIN specialization ON vets.id = specialization.vets_id
LEFT JOIN species ON species.id = specialization.species_id; 

SELECT animals.name
FROM animals
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '1-4-2020' AND '30-8-2020';

SELECT animals.name, COUNT(animals.name) as number_of_visits
FROM animals 
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON visits.vets_id = vets.id
GROUP BY animals.name
ORDER BY number_of_visits DESC
LIMIT 1;

SELECT animals.name  
FROM animals
JOIN visits ON Visits.animal_id = animals.id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit
LIMIT 1;

SELECT animals.name as animal, species.name as type, animals.date_of_birth as birth_date, animals.escape_attempts, animals.neutered, 
animals.weight_kg, owners.name as Owner, vets.name as Vet, vets.age as Vet_age, vets.date_of_graduation, visits.date_of_visit  
FROM animals
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON visits.vets_id = vets.id
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
ORDER BY visits.date_of_visit DESC
LIMIT 1;


CREATE VIEW speciality AS
  SELECT vets.name as Vet
  FROM vets
  LEFT JOIN specialization ON vets.id = specialization.vets_id
  LEFT JOIN species ON species.id = specialization.species_id;

SELECT COUNT(visits.date_of_visit)
FROM animals
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vets_id
LEFT JOIN specialization ON vets.id = specialization.vets_id
WHERE (animals.species_id != specialization.species_id OR specialization.species_id IS NULL) AND 2 != (
  SELECT COUNT(speciality.vet)
  FROM speciality
  WHERE speciality.vet = vets.name 
);

SELECT species.name, COUNT(species.name) as visits
FROM animals 
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON visits.vets_id = vets.id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY visits DESC
LIMIT 1;