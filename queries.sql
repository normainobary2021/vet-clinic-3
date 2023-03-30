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

SELECT animals.name AS "Animal Name" FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY date_of_visit DESC LIMIT 1;

SELECT COUNT(animals.name) AS "number of different animals seen" FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name AS "Vet Name", species.name AS specializations FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON species.id = specializations.species_id
ORDER BY vets.name;

SELECT animals.Name AS Animals FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez' 
AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name AS "animal most visits to vets", COUNT(animals.name) AS "number of visits to vets" FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY "number of visits to vets" DESC LIMIT 1;

SELECT animals.name AS "Animal Name" FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
ORDER BY date_of_visit ASC LIMIT 1;

SELECT animals.name AS "animal_name", vets.name AS "vet_name", date_of_visit FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
ORDER BY date_of_visit DESC LIMIT 1;

SELECT COUNT(*) AS "number of visits" FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN specializations ON visits.vet_id = specializations.vet_id
WHERE specializations.species_id != animals.species_id;

SELECT species.name AS specialty FROM animals
INNER JOIN species ON species.id = animals.species_id
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
GROUP BY specialty
ORDER BY COUNT(*) DESC LIMIT 1;
