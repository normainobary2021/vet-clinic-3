INSERT INTO animals VALUES 
(1, 'Agumon', '2020-2-3', 0, TRUE, 10.23),
(2, 'Gabumon', '2018-11-15', 2, TRUE, 8),
(3, 'Pikachu', '2021-1-7', 1, FALSE, 15.04),
(4, 'Devimon', '2017-5-12', 5, TRUE, 11);

-- New Animal Data Added
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (5, 'Charmander', '2020-02-08', 0, FALSE, -11),
       (6, 'Plantmon', '2021-11-15', 2, TRUE, -5.7),
       (7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13),
       (8, 'Angemon', '2005-06-12', 1, TRUE, -45),
       (9, 'Boarmon', '2005-06-07', 7, TRUE, 20.4),
       (10, 'Blossom', '1998-10-13', 3, TRUE, 17),
       (11, 'Ditto', '2022-05-14', 4, TRUE, 22);

-- Insert data into the owners table

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell', 19),
       ('Bob ', 45),
       ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);

-- Insert data into the species table

INSERT INTO species (name)
VALUES ('Pokemon'),
       ('Digimon');

-- Modify inserted animals to include the species_id value

UPDATE animals 
SET species_id = 
  CASE
    WHEN name like '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    else (SELECT id FROM species WHERE name = 'Pokemon')
END;

-- Modify inserted animals to include owner information (owner_id)

UPDATE animals 
SET owner_id = 
  CASE
    WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
    WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
    WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
    WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
    WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
END;

-- Insert the following data into the vets table

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
       ('Maisy Smith', 26, '2019-01-17'),
       ('Stephanie Mendez', 64, '1981-05-04'),
       ('Jack Harkness', 38, '2008-06-08');

-- Insert the following data into the specializations table

INSERT INTO specializations (vet_id, species_id)
VALUES (1, 1),
       (3, 1),
       (3, 2),
       (4, 2);
-- Insert the following data into the visits table

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (1, 1, '2020-05-24'),
       (1, 3, '2020-07-22'),
       (2, 4, '2021-02-02'),
       (3, 2, '2020-01-05'),
       (3, 2, '2020-03-08'),
       (3, 2, '2020-05-14'),
       (4, 3, '2021-05-04'),
       (6, 4, '2021-02-24'),
       (5, 2, '2019-12-21'),
       (5, 1, '2020-08-10'),
       (5, 2, '2021-04-07'),
       (7, 3, '2019-09-29'),
       (8, 4, '2020-10-03'),
       (8, 4, '2020-11-04'),
       (9, 2, '2019-01-24'),
       (9, 2, '2019-05-15'),
       (9, 2, '2020-02-27'),
       (9, 2, '2020-08-03'),
       (10, 3, '2020-05-24'),
       (10, 1, '2021-01-11');
