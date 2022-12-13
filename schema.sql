/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(30) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    species VARCHAR(50),
);

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE animals ADD PRIMARY KEY(id);
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD FOREIGN KEY(owner_id) REFERENCES owners(id);

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(150) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    species_id INTEGER REFERENCES species(id),
    vet_id INTEGER REFERENCES vets(id),
    PRIMARY KEY (species_id, vet_id)
);

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date_of_visit DATE,
  PRIMARY KEY(id)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

