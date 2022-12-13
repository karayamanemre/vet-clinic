CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(30) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histoeries (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at timestamp NOT NULL,
    patient_id INT NOT NULL,
    status VARCHAR(30) NOT NULL
);

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL NOT NULL,
    generated_at timestamp NOT NULL,
    payed_at timestamp NOT NULL,
    medical_history__id INT NOT NULL
);

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL NOT NULL,
    invoice_id INT NOT NULL,
    treatment_id INT NOT NULL
);

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL
);