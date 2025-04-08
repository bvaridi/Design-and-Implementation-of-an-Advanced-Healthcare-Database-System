-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS ESOPHAGEAL_CANCER;


-- Step 2: Use the database
USE ESOPHAGEAL_CANCER;

-- Step 3: Create tables

-- Patient Table
CREATE TABLE IF NOT EXISTS patient_table (
    patient_id CHAR(5) PRIMARY KEY,
    country VARCHAR(50),
    country_of_procurement VARCHAR(50),
    state_province_of_procurement VARCHAR(50),
    city_of_procurement VARCHAR(50)
);

-- Visit Table
CREATE TABLE IF NOT EXISTS visit_table (
    visit_id CHAR(5) PRIMARY KEY,
    visit_date DATE,
    patient_id CHAR(5),
    FOREIGN KEY (patient_id) REFERENCES patient_table(patient_id)
);

-- Country Table
CREATE TABLE IF NOT EXISTS country_table (
    patient_id CHAR(5) PRIMARY KEY,
    country VARCHAR(50),
    country_of_procurement VARCHAR(50),
    state_province_of_procurement VARCHAR(50),
    city_of_procurement VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patient_table(patient_id)
);

-- Outcome Table
CREATE TABLE IF NOT EXISTS outcome_table (
    outcome_id CHAR(5) PRIMARY KEY,
    visit_id CHAR(5),
    primary_pathology_karnofsky_performance_score INT,
    primary_pathology_eastern_cancer_oncology_group INT,
    vital_status VARCHAR(20),
    days_to_death INT,
    FOREIGN KEY (visit_id) REFERENCES visit_table(visit_id)
);

-- Treatment Table
CREATE TABLE IF NOT EXISTS treatment_table (
    treatment_id CHAR(5) PRIMARY KEY,
    visit_id CHAR(5),
    antireflux_treatment_types VARCHAR(255),
    primary_pathology_radiation_therapy VARCHAR(50),
    primary_pathology_residual_tumor CHAR(2),
    primary_pathology_init_pathology_dx_method_other VARCHAR(255),
    has_radiations_information BOOLEAN,
    FOREIGN KEY (visit_id) REFERENCES visit_table(visit_id)
);

-- Diagnosis Table
CREATE TABLE IF NOT EXISTS diagnosis_table (
    diagnosis_id CHAR(5) PRIMARY KEY,
    visit_id CHAR(5),
    initial_diagnosis_by VARCHAR(50),
    person_neoplasm_cancer_status VARCHAR(50),
    primary_pathology_esophageal_tumor_cental_location VARCHAR(50),
    primary_pathology_columnar_metaplasia_present BOOLEAN,
    primary_pathology_year_of_initial_pathologic_diagnosis INT,
    primary_pathology_number_of_lymphnodes_positive_by_he INT,
    FOREIGN KEY (visit_id) REFERENCES visit_table(visit_id)
);