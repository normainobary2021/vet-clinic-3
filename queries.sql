SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- Transaction 1
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

-- Transaction 2
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
SELECT species FROM animals;
COMMIT;
SELECT species FROM animals;

-- Transaction 3
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Transaction 4
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO SP1;
SELECT * FROM animals;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- Queries Using JOIN

SELECT name AS animal FROM animals  INNER JOIN owners ON owner_id = owners.id WHERE full_name = 'Melody Pond';
SELECT animals.name AS animal FROM animals INNER JOIN species ON species_id = species.id WHERE species.name = 'Pokemon';
SELECT full_name AS owner, name AS animal FROM animals  RIGHT JOIN owners ON owner_id = owners.id ORDER BY full_name;
SELECT species.name AS species, COUNT(species_id) AS "number of animals" FROM animals INNER JOIN species ON species_id = species.id GROUP BY species.name;
SELECT animals.name AS Digimons FROM animals INNER JOIN owners ON owner_id = owners.id WHERE full_name = 'Jennifer Orwell' AND animals.name LIKE '%mon'; 
SELECT animals.name AS animals FROM animals INNER JOIN owners ON owner_id = owners.id WHERE full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT full_name AS "Owner", COUNT(owner_id) AS MaxAnimals FROM animals INNER JOIN owners ON owner_id = owners.id  GROUP BY full_name ORDER BY MaxAnimals DESC LIMIT 1;
