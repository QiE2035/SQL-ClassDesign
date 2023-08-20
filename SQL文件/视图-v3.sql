-- 创建一个视图，显示每个专业的毕业生人数和平均薪水
CREATE VIEW major_stats AS
SELECT m.major_name AS 专业, COUNT(g.student_id) AS 毕业人数, AVG(e.salary) AS 平均薪水
FROM majors m
         JOIN graduates g ON m.major_id = g.major_id
         JOIN employment e ON g.employment_id = e.employment_id
GROUP BY m.major_name;
GO

-- 创建一个视图，显示每个科目的平均成绩和最高成绩
CREATE VIEW subject_stats AS
SELECT s.subject_name AS 科目, AVG(g.grade_score) AS 平均分, MAX(g.grade_score) AS 最高分
FROM subjects s
         JOIN grades g ON s.subject_id = g.subject_id
GROUP BY s.subject_name;
GO

-- 创建一个视图，显示每个就业单位的招聘人数和平均薪水
CREATE VIEW employer_stats AS
SELECT e.employer_name AS 工作单位, COUNT(em.employment_id) AS 招聘人数, AVG(em.salary) AS 平均薪水
FROM employer e
         JOIN employment em ON e.employer_id = em.employer_id
GROUP BY e.employer_name;
GO

-- 创建一个视图，显示每个毕业生的姓名、专业、科目和成绩
CREATE VIEW graduate_grades AS
SELECT g.name AS 姓名, m.major_name AS 专业, s.subject_name AS 科目, gr.grade_score AS 成绩
FROM graduates g
         JOIN majors m ON g.major_id = m.major_id
         JOIN grades gr ON g.student_id = gr.student_id
         JOIN subjects s ON gr.subject_id = s.subject_id;
GO

-- 创建一个视图，显示每个毕业生的姓名、专业、就业单位和薪水
CREATE VIEW graduate_employment AS
SELECT g.name 姓名, m.major_name 专业, e.employer_name 就业单位, em.salary 薪水
FROM graduates g
         JOIN majors m ON g.major_id = m.major_id
         JOIN employment em ON g.employment_id = em.employment_id
         JOIN employer e ON em.employer_id = e.employer_id;
GO

-- 创建一个视图，显示每个学位类型的毕业生人数和平均薪水
CREATE VIEW degree_stats AS
SELECT m.degree_type 学位, COUNT(g.student_id) AS 毕业人数, AVG(e.salary) AS 平均薪水
FROM majors m
         JOIN graduates g ON m.major_id = g.major_id
         JOIN employment e ON g.employment_id = e.employment_id
GROUP BY m.degree_type;
