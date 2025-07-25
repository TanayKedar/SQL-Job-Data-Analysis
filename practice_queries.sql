SELECT COUNT(*) AS total_companies FROM company_dim;

SELECT COUNT(*) AS total_jobs FROM job_postings_fact;

SELECT * FROM company_dim;


SELECT job_title, salary
FROM job_postings_fact
ORDER BY salary DESC
LIMIT 5;



SELECT ROUND(AVG(salary),2) AS avg_salary FROM job_postings_fact;


SELECT job_location, COUNT(*) AS job_count
FROM job_postings_fact
GROUP BY job_location
ORDER BY job_count DESC;


SELECT j.job_title, c.name AS company_name, j.salary
FROM job_postings_fact j
JOIN company_dim c ON j.company_id = c.company_id
ORDER BY salary DESC;



SELECT j.job_title, s.skill
FROM job_postings_fact j
JOIN skills_job_dim sj ON j.job_id = sj.job_id
JOIN skills_dim s ON sj.skill_id = s.skill_id
ORDER BY j.job_id;


SELECT DISTINCT j.job_title
FROM job_postings_fact j
JOIN skills_job_dim sj ON j.job_id = sj.job_id
JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE s.skill = 'SQL';





SELECT c.name AS company, ROUND(AVG(j.salary),2) AS avg_salary
FROM job_postings_fact j
JOIN company_dim c ON j.company_id = c.company_id
GROUP BY c.name
ORDER BY avg_salary DESC;



SELECT DISTINCT ON (c.name) c.name, j.job_title, j.salary
FROM job_postings_fact j
JOIN company_dim c ON j.company_id = c.company_id
ORDER BY c.name, j.salary DESC;


SELECT c.name, COUNT(*) AS job_count
FROM job_postings_fact j
JOIN company_dim c ON j.company_id = c.company_id
GROUP BY c.name
ORDER BY job_count DESC
LIMIT 3;



WITH high_salary_jobs AS (
    SELECT job_title, salary FROM job_postings_fact
    WHERE salary > 130000
)
SELECT * FROM high_salary_jobs;


SELECT job_title, salary,
RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM job_postings_fact;


SELECT job_location, ROUND(AVG(salary),2) AS avg_salary
FROM job_postings_fact
GROUP BY job_location
ORDER BY avg_salary DESC;



SELECT j.job_title, COUNT(sj.skill_id) AS skills_required
FROM job_postings_fact j
JOIN skills_job_dim sj ON j.job_id = sj.job_id
GROUP BY j.job_title
ORDER BY skills_required DESC;



SELECT DISTINCT c.name
FROM job_postings_fact j
JOIN company_dim c ON j.company_id = c.company_id
WHERE job_location = 'Remote';




SELECT job_title, salary
FROM job_postings_fact
WHERE salary > (SELECT AVG(salary) FROM job_postings_fact)
ORDER BY salary DESC;


SELECT s.skill,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM skills_job_dim),2) AS percentage
FROM skills_job_dim sj
JOIN skills_dim s ON sj.skill_id = s.skill_id
GROUP BY s.skill
ORDER BY percentage DESC;
