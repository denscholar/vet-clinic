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

-- project 3

USE vet_clinic;

CREATE TABLE owners
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);
CREATE TABLE species
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

SELECT * FROM animals;
ALTER TABLE animals
DROP COLUMN species;
ALTER TABLE animals 
ADD COLUMN species_id INT, 
ADD COLUMN owner_id INT;

ALTER TABLE animals 
ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owners(id);

ALTER TABLE animals 
ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);

-- project 4

CREATE TABLE vets ( id AUTO_INCREMENT PRIMARY KEY, 
name varchar(100) NOT NULL,
age INTEGER,
date_of_graduation DATE NOT NULL);

CREATE TABLE specialization (
  species_id INT, 
  vets_id INT, 
  CONSTRAINT species_key FOREIGN KEY (species_id) REFERENCES species(id), 
  CONSTRAINT vets_key FOREIGN KEY (vets_id) REFERENCES vets(id) ON DELETE CASCADE
);

CREATE TABLE visits (
  animal_id INT, 
  vets_id INT, 
  date_of_visit DATE, 
  CONSTRAINT animals_key FOREIGN KEY (animal_id) REFERENCES animals(id), 
  CONSTRAINT vets_key FOREIGN KEY (vets_id) REFERENCES vets(id)
);


