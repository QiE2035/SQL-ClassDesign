-- 创建一个存储过程，用于添加一个新的毕业生信息
CREATE PROCEDURE add_graduate @student_id VARCHAR(10),
                              @name VARCHAR(20),
                              @gender CHAR(2),
                              @birth_date DATE,
                              @id_card CHAR(18),
                              @contact VARCHAR(50),
                              @major_id INT,
                              @enrollment_date DATE,
                              @graduation_date DATE,
                              @degree_date DATE,
                              @employment_id INT
AS
BEGIN
    -- 检查输入参数是否合法
    IF @student_id IS NULL OR @name IS NULL OR @gender IS NULL OR @birth_date IS NULL OR @id_card IS NULL OR @major_id IS NULL OR @enrollment_date IS NULL OR @graduation_date IS NULL
        RAISERROR (N'参数不合法', 16, 1)

    -- 检查学号是否已存在
    IF EXISTS (SELECT * FROM graduates WHERE student_id = @student_id)
        RAISERROR (N'学号已存在', 16, 1)

    -- 检查身份证号是否已存在
    IF EXISTS (SELECT * FROM graduates WHERE id_card = @id_card)
        RAISERROR (N'身份证号已存在', 16, 1)

    -- 检查专业ID是否存在
    IF NOT EXISTS (SELECT * FROM majors WHERE major_id = @major_id)
        RAISERROR (N'专业ID不存在', 16, 1)

    -- 检查就业ID是否存在
    IF @employment_id IS NOT NULL AND NOT EXISTS (SELECT * FROM employment WHERE employment_id = @employment_id)
        RAISERROR (N'就业ID不存在', 16, 1)

    -- 插入新的毕业生信息
    INSERT INTO graduates VALUES (@student_id, @name, @gender, @birth_date, @id_card, @contact, @major_id, @enrollment_date, @graduation_date, @degree_date, @employment_id)
END
GO


-- 创建一个存储过程，用于更新一个毕业生的就业信息
CREATE PROCEDURE update_employment @student_id VARCHAR(10),
                                   @employer_id INT,
                                   @position VARCHAR(50),
                                   @contract_date DATE,
                                   @salary INT
AS
BEGIN
    -- 检查输入参数是否合法
    IF @student_id IS NULL OR @employer_id IS NULL
        RAISERROR (N'参数不合法', 16, 1)

    -- 检查学号是否存在
    IF NOT EXISTS (SELECT * FROM graduates WHERE student_id = @student_id)
        RAISERROR (N'学号不存在', 16, 1)

    -- 检查就业单位ID是否存在
    IF NOT EXISTS (SELECT * FROM employer WHERE employer_id = @employer_id)
        RAISERROR (N'就业单位ID不存在', 16, 1)

    -- 查询毕业生的就业ID，如果没有则创建一个新的就业记录并返回就业ID，如果有则更新就业记录并返回就业ID
    DECLARE @employment_id INT

    SELECT @employment_id = employment_id FROM graduates WHERE student_id = @student_id

    IF @employment_id IS NULL
        BEGIN
            INSERT INTO employment (employer_id, position, contract_date, salary) VALUES (@employer_id, @position, @contract_date, @salary)

            SET @employment_id = SCOPE_IDENTITY()

            UPDATE graduates SET employment_id = @employment_id WHERE student_id = @student_id
        END
    ELSE
        BEGIN
            UPDATE employment SET employer_id = @employer_id, position = @position, contract_date = @contract_date, salary = @salary WHERE employment_id = @employment_id

            SELECT employment_id INTO employment_id FROM employment WHERE employer_id = @employer_id AND position = @position AND contract_date = @contract_date AND salary = @salary
        END

END
GO


-- 创建一个存储过程，用于查询一个毕业生的所有成绩信息，包括科目名称和成绩分数，并按照成绩分数降序排序
CREATE PROCEDURE query_grades @student_id VARCHAR(10)
AS
BEGIN
    -- 检查输入参数是否合法
    IF @student_id IS NULL
        RAISERROR (N'参数无效', 16, 1)

    -- 检查学号是否存在
    IF NOT EXISTS (SELECT * FROM graduates WHERE student_id = @student_id)
        RAISERROR (N'学号不存在', 16, 1)

    -- 查询成绩信息并排序
    SELECT s.subject_name, g.grade_score
    FROM grades g
             JOIN subjects s ON g.subject_id = s.subject_id
    WHERE g.student_id = @student_id
    ORDER BY g.grade_score DESC
END
GO

-- 创建一个存储过程，用于查询一个专业的所有毕业生信息，包括姓名，性别，毕业时间，就业单位名称和就业职位，并按照毕业时间升序排序
CREATE PROCEDURE query_graduates_by_major @major_id INT
AS
BEGIN
    -- 检查输入参数是否合法
    IF @major_id IS NULL
        RAISERROR (N'参数不合法', 16, 1)

    -- 检查专业ID是否存在
    IF NOT EXISTS (SELECT * FROM majors WHERE major_id = @major_id)
        RAISERROR (N'专业ID不存在', 16, 1)

    -- 查询毕业生信息并排序
    SELECT g.name, g.gender, g.graduation_date, er.employer_name, e.position
    FROM graduates g
             LEFT JOIN employment e ON g.employment_id = e.employment_id
             LEFT JOIN employer er ON e.employer_id = er.employer_id
    WHERE g.major_id = @major_id
    ORDER BY g.graduation_date
END
GO


-- 创建一个存储过程，用于查询一个科目的所有成绩信息，包括学号，姓名，成绩分数，并按照成绩分数降序排序
CREATE PROCEDURE query_grades_by_subject @subject_id INT
AS
BEGIN
    -- 检查输入参数是否合法
    IF @subject_id IS NULL
        RAISERROR (N'参数不合法', 16, 1)

    -- 检查科目ID是否存在
    IF NOT EXISTS (SELECT * FROM subjects WHERE subject_id = @subject_id)
        RAISERROR (N'科目ID不存在', 16, 1)

    -- 查询成绩信息并排序
    SELECT grades.student_id, graduates.name, grades.grade_score
    FROM grades
             JOIN graduates ON grades.student_id = graduates.student_id
    WHERE grades.subject_id = @subject_id
    ORDER BY grades.grade_score DESC
END
GO

-- 创建一个存储过程，用于查询一个就业单位的所有毕业生信息，包括学号，姓名，专业名称，就业职位，并按照学号升序排序
CREATE PROCEDURE query_graduates_by_employer @employer_id INT
AS
BEGIN
    -- 检查输入参数是否合法
    IF @employer_id IS NULL
        RAISERROR (N'参数不合法', 16, 1)

    -- 检查就业单位ID是否存在
    IF NOT EXISTS (SELECT * FROM employer WHERE employer_id = @employer_id)
        RAISERROR (N'就业单位ID不存在', 16, 1)

    -- 查询毕业生信息并排序
    SELECT g.student_id, g.name, m.major_name, e.position
    FROM graduates g
             JOIN majors m ON g.major_id = m.major_id
             JOIN employment e ON g.employment_id = e.employment_id
    WHERE e.employer_id = @employer_id
    ORDER BY g.student_id
END
GO

-- 创建一个存储过程，用于查询一个毕业生的所有信息，包括姓名，性别，出生日期，身份证号，联系方式，专业名称，学位类型，入学时间，毕业时间，学位授予时间，就业单位名称，就业职位，合同期限和薪水
CREATE PROCEDURE query_graduate_info @student_id VARCHAR(10)
AS
BEGIN
    -- 检查输入参数是否合法
    IF @student_id IS NULL
        RAISERROR (N'参数不合法', 16, 1)

    -- 检查学号是否存在
    IF NOT EXISTS (SELECT * FROM graduates WHERE student_id = @student_id)
        RAISERROR (N'学号不存在', 16, 1)

    -- 查询毕业生信息
    SELECT g.name,
           g.gender,
           g.birth_date,
           g.id_card,
           g.contact,
           m.major_name,
           m.degree_type,
           g.enrollment_date,
           g.graduation_date,
           g.degree_date,
           er.employer_name,
           e.position,
           e.contract_date,
           e.salary
    FROM graduates g
             JOIN majors m ON g.major_id = m.major_id
             LEFT JOIN employment e ON g.employment_id = e.employment_id
             LEFT JOIN employer er ON e.employer_id = er.employer_id
    WHERE g.student_id = @student_id
END
GO

-- 创建一个存储过程，用于查询一个专业的平均成绩分数，包括专业名称和平均分数，并按照平均分数降序排序
CREATE PROCEDURE query_average_grade_by_major
AS
BEGIN
    -- 查询平均成绩分数并排序
    SELECT m.major_name, AVG(grades.grade_score) AS average_score
    FROM majors m
             JOIN graduates ON m.major_id = graduates.major_id
             JOIN grades ON graduates.student_id = grades.student_id
    GROUP BY m.major_name
    ORDER BY average_score DESC
END
GO

-- 创建一个存储过程，用于查询一个就业单位的平均薪水，包括就业单位名称和平均薪水，并按照平均薪水降序排序
CREATE PROCEDURE query_average_salary_by_employer
AS
BEGIN
    -- 查询平均薪水并排序
    SELECT employer.employer_name, AVG(employment.salary) AS average_salary
    FROM employer
             JOIN employment ON employment.employer_id = employer.employer_id
    GROUP BY employer.employer_name
    ORDER BY average_salary DESC
END
GO