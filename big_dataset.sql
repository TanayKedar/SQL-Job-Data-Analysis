DROP TABLE IF EXISTS skills_job_dim;
DROP TABLE IF EXISTS job_postings_fact;
DROP TABLE IF EXISTS skills_dim;
DROP TABLE IF EXISTS company_dim;


CREATE TABLE company_dim (
    company_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    link TEXT
);

CREATE TABLE skills_dim (
    skill_id SERIAL PRIMARY KEY,
    skill TEXT NOT NULL
);

CREATE TABLE job_postings_fact (
    job_id SERIAL PRIMARY KEY,
    company_id INT REFERENCES company_dim(company_id),
    job_title TEXT,
    job_location TEXT,
    salary INT
);

CREATE TABLE skills_job_dim (
    job_id INT REFERENCES job_postings_fact(job_id),
    skill_id INT REFERENCES skills_dim(skill_id)
);


INSERT INTO company_dim (name, link) VALUES
('Google', 'https://google.com'),
('Amazon', 'https://amazon.com'),
('Microsoft', 'https://microsoft.com'),
('Apple', 'https://apple.com'),
('Netflix', 'https://netflix.com'),
('Meta', 'https://meta.com'),
('IBM', 'https://ibm.com'),
('Adobe', 'https://adobe.com'),
('Intel', 'https://intel.com'),
('Salesforce', 'https://salesforce.com');



INSERT INTO skills_dim (skill) VALUES
('SQL'),
('Python'),
('Excel'),
('Power BI'),
('Tableau'),
('R'),
('Java'),
('AWS'),
('Google Cloud'),
('Machine Learning');




INSERT INTO job_postings_fact (company_id, job_title, job_location, salary) VALUES
(1, 'Data Analyst', 'New York', 90000),
(1, 'Data Scientist', 'Remote', 130000),
(2, 'Data Engineer', 'Seattle', 115000),
(2, 'Business Analyst', 'Chicago', 85000),
(3, 'Database Administrator', 'Remote', 95000),
(4, 'BI Developer', 'Austin', 105000),
(5, 'Machine Learning Engineer', 'San Francisco', 140000),
(6, 'Cloud Data Engineer', 'Remote', 125000),
(7, 'Data Quality Analyst', 'Boston', 88000),
(8, 'Data Architect', 'Remote', 150000),
(9, 'ETL Developer', 'New Jersey', 102000),
(10, 'AI Researcher', 'California', 155000),
(1, 'Data Governance Analyst', 'Remote', 95000),
(2, 'Data Modeler', 'Dallas', 98000),
(3, 'BI Analyst', 'New York', 92000),
(4, 'Data Visualization Specialist', 'Remote', 100000),
(5, 'Data Engineer II', 'Seattle', 118000),
(6, 'Senior Data Analyst', 'Chicago', 105000),
(7, 'ML Ops Engineer', 'Remote', 132000),
(8, 'Big Data Engineer', 'Austin', 122000),
(9, 'Data Scientist II', 'Boston', 135000),
(10, 'ETL Specialist', 'Remote', 108000),
(1, 'Reporting Analyst', 'Chicago', 87000),
(2, 'Data Strategist', 'Remote', 112000),
(3, 'Analytics Manager', 'Austin', 140000),
(4, 'Business Intelligence Engineer', 'Remote', 120000),
(5, 'Junior Data Analyst', 'New Jersey', 75000),
(6, 'SQL Developer', 'Remote', 96000),
(7, 'Data Warehouse Engineer', 'California', 125000),
(8, 'Data Compliance Officer', 'Remote', 115000),
(9, 'Data Scientist III', 'New York', 145000),
(10, 'Lead Data Engineer', 'Seattle', 150000),
(1, 'Power BI Developer', 'Remote', 95000),
(2, 'Tableau Specialist', 'Chicago', 93000),
(3, 'Excel Data Analyst', 'Boston', 88000),
(4, 'Data Science Consultant', 'Remote', 142000),
(5, 'AI Specialist', 'California', 155000),
(6, 'Junior BI Developer', 'New York', 80000),
(7, 'Analytics Consultant', 'Remote', 120000),
(8, 'Cloud BI Engineer', 'Austin', 126000),
(9, 'Senior ML Engineer', 'San Francisco', 148000),
(10, 'Data Ops Analyst', 'Remote', 100000),
(1, 'Research Data Scientist', 'Chicago', 145000),
(2, 'ETL Pipeline Engineer', 'Remote', 108000),
(3, 'Senior SQL Developer', 'Seattle', 120000),
(4, 'Data Integration Specialist', 'Remote', 110000),
(5, 'Big Data Consultant', 'California', 140000),
(6, 'AI Engineer', 'Remote', 150000),
(7, 'Data Migration Analyst', 'Boston', 95000),
(8, 'Data Transformation Specialist', 'Remote', 115000),
(9, 'Cloud Data Analyst', 'Austin', 124000),
(10, 'ML Scientist', 'Remote', 155000);





INSERT INTO skills_job_dim (job_id, skill_id) VALUES
(1, 1), (1, 3), (1, 4),
(2, 1), (2, 2), (2, 10),
(3, 1), (3, 2), (3, 7),
(4, 1), (4, 3), (4, 4),
(5, 2), (5, 10), (5, 8),
(6, 8), (6, 9), (6, 2),
(7, 1), (7, 3), (7, 4),
(8, 1), (8, 8), (8, 9),
(9, 1), (9, 7), (9, 3),
(10, 2), (10, 10), (10, 1),
(11, 1), (11, 2), (11, 6),
(12, 1), (12, 3), (12, 4),
(13, 2), (13, 10), (13, 8),
(14, 1), (14, 4), (14, 5),
(15, 1), (15, 2), (15, 9),
(16, 1), (16, 3), (16, 6);
