CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(30) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histoeries (
    id INT REFERENCES treatments(id),
    admitted_at timestamp NOT NULL,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(30) NOT NULL
);

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL NOT NULL,
    generated_at timestamp NOT NULL,
    payed_at timestamp NOT NULL,
    medical_history__id INT REFERENCES medical_histoeries(id)
);

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL NOT NULL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id)
);

CREATE TABLE treatments (
    id INT REFERENCES medical_histoeries(patient_id),
    type VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE joined (
    medical_history_id INTEGER REFERENCES medical_histoeries(id),
    treatments_id INTEGER REFERENCES treatments(id),
    PRIMARY KEY (treatment_id, medical_history_id)
);

CREATE INDEX index_patient_id ON medical_histoeries (patient_id);
CREATE INDEX index_treatment_id ON invoice_items (treatment_id);
CREATE INDEX index_invoice_id ON invoice_items (invoice_id);
CREATE INDEX index_medical_history_id ON invoices (medical_history__id);
CREATE INDEX index_medical_histories_id ON joined (medical_history_id);
CREATE INDEX index_treatments_id ON joined (treatments_id);
