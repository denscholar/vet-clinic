/* Populate database with sample data. */

SELECT * FROM animals;

INSERT INTO animals
(
	name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts
) VALUES
(
	'Agumon',
    '2020-03-02',
    10.23,
    true,
    0   
),
(
	'Gabumon',
    '2018-11-15',
     8,
    true,
    2  
),
(
	'Pikachu',
    '2021-01-07',
    15.04,
    false,
    1  
),
(
	'Devimon',
    '2017-05-12',
    11,
    true,
    5  
);

INSERT INTO animals
(
	name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts
) VALUES
(
	'Charmander',
    '2020-02-08',
    -11,
    false,
    0
),
(
	'Plantmon',
    '2021-11-15',
    -5.7,
    true,
    2
),
(
	'Squirtle',
    '1993-04-03',
    -12.13,
    false,
    3
),
(
	'Angemon',
    '2005-06-12',
    -45,
    true,
    1
),
(
	'Boarmo',
    '2005-06-07',
    20.4,
    true,
    7
),
(
	'Blossom',
    '1998-10-13',
    17,
    true,
    3
),
(
	'Ditto',
    '2022-05-14',
    22,
    true,
    4
)

-- project 3

USE vet_clinic;

INSERT INTO owners
(
	full_name,
    age
)
VALUES
(
	'Sam Smith',
    34
),
(
	'Jennifer Orwell',
    19
),
(
	'Bob',
    45
),
(
	'Melody Pond',
    77
),
(
	'Dean Wincheste',
    14
),
(
	'Jodie Whittaker',
    38
);


INSERT INTO species
(
	name
)
VALUES
(
	'Pokemon'
),
(
	'Digimon'
)


UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon','Boarmon');


-- project 4


INSERT INTO vets (name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specialization (species_id, vets_id)
VALUES
  (1, 1),
  (1, 3),
  (2, 3), 
  (2, 4);

INSERT INTO visits (animal_id, vets_id, date_of_visit)
VALUES
  (1, 1, '2020-05-24'),
  (1, 3, '2020-07-22'),
  (2, 4, '2021-02-02'),
  (3, 2, '2020-01-05'),
  (3, 2, '2020-03-08'),
  (3, 2, '2020-05-14'),
  (4, 3, '2021-05-04'),
  (5, 4, '2021-02-24'),
  (6, 2, '2019-12-21'),
  (6, 1, '2020-08-10'),
  (6, 2, '2021-04-07'),
  (7, 3, '2019-09-29'),
  (8, 4, '2020-10-03'),
  (8, 4, '2020-11-04'),
  (9, 2, '2019-01-24'),
  (9, 2, '2019-05-15'),
  (9, 2, '2020-02-27'),
  (9, 2, '2020-08-03'),
  (10, 3, '2020-05-24'),
  (10, 1, '2021-01-11');