# Advanced Healthcare Database System for Esophageal Cancer Analysis

This project presents the design and implementation of a relational database system tailored to analyze **Esophageal Cancer Treatment Outcomes**. Built with **MySQL**, this system enables efficient storage, management, and analysis of patient data, diagnoses, treatments, and outcomes. The project includes data analytics, visualizations, and geographic mapping to reveal trends in survival, treatment effectiveness, and regional disparities.

## 📊 Project Summary

- **Title**: Advanced Healthcare Database System: Optimizing Data Storage, Management, and Analytical Insights for Esophageal Cancer Treatment Outcomes
- **Domain**: Clinical and Scientific Database Management
- **Tools & Technologies**: MySQL, SQL, Python, Plotly, Matplotlib
- **Role**: Data Analyst
- **Institution**: Indiana University Indianapolis

## 🏗️ Database Structure

The database is composed of **6 core tables**:
- `patient_table`
- `visit_table`
- `diagnosis_table`
- `treatment_table`
- `outcome_table`
- `country_table`

### Entity Relationships:
- One-to-many: Patient → Visit, Visit → Diagnosis/Treatment
- One-to-one: Visit → Outcome
- Many-to-one: Patient → Country

## 🧠 Key Features

- **Normalized relational design** (3NF + BCNF)
- **Efficient querying** with SQL joins and indexed columns
- **Support for predictive modeling and visualizations**
- **Referential integrity** maintained using foreign keys
- **Scalable design** allowing addition of new attributes without redundancy

## 📈 Analytical Insights

As a Data Analyst, I performed advanced data analysis and visualizations using Python. Key insights included:

- **Survival analysis by tumor location**
- **Treatment frequency and ranking**
- **Radiation therapy coverage**
- **Karnofsky scores by region**
- **Geographic distribution of esophageal cancer**

### Sample Visualizations:
- Bar charts for survival by tumor location
- Pie chart of therapy distribution
- Heatmaps of Karnofsky scores by region
- Google Maps visualizing global case counts

## 🧪 Sample SQL Queries

```sql
-- Survival by tumor location (deceased patients only)
SELECT tumor_location, AVG(days_to_death) AS avg_survival
FROM diagnosis_table d
JOIN outcome_table o ON d.visit_id = o.visit_id
WHERE o.vital_status = 'Dead'
GROUP BY tumor_location;
