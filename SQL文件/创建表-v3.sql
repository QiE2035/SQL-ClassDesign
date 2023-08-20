-- 创建专业表
CREATE TABLE majors
(
    -- 专业ID, 主键, 自增
    major_id    INT IDENTITY (1,1) PRIMARY KEY,
    -- 专业名称, 非空, 最多50个字符
    major_name  VARCHAR(50) NOT NULL,
    -- 学位类型, 非空, 最多10个字符
    degree_type VARCHAR(10) NOT NULL CHECK (degree_type IN (N'学士', N'硕士', N'博士')),
);

-- 创建科目表
CREATE TABLE subjects
(
    -- 科目ID, 主键, 自增
    subject_id   INT IDENTITY (1,1) PRIMARY KEY,
    -- 科目名称, 非空, 最多50个字符
    subject_name VARCHAR(50) NOT NULL
);

-- 创建就业单位表
CREATE TABLE employer
(
    -- 就业单位ID, 主键, 自增
    employer_id      INT IDENTITY (1,1) PRIMARY KEY,
    -- 就业单位名称, 非空, 最多100个字符
    employer_name    VARCHAR(100) NOT NULL,
    -- 就业单位地址, 可空, 最多200个字符
    employer_address VARCHAR(200),
    -- 就业单位联系方式, 可空, 最多50个字符
    employer_contact VARCHAR(50),
);

-- 创建就业表
CREATE TABLE employment
(
    -- 就业ID, 主键, 自增
    employment_id INT IDENTITY (1,1) PRIMARY KEY,
    -- 就业单位ID,非空, 外键, 引用就业单位表的主键
    employer_id   INT NOT NULL FOREIGN KEY REFERENCES employer (employer_id),
    -- 就业职位, 可空, 最多50个字符
    position      VARCHAR(50),
    -- 合同期限, 可空, 格式为YYYY-MM-DD
    contract_date DATE,
    -- 薪水, 可空
    salary        INT
);

-- 创建毕业生表
CREATE TABLE graduates
(
    -- 毕业生学号, 非空, 主键, 最多10个字符
    student_id      VARCHAR(10) PRIMARY KEY,
    -- 毕业生姓名, 非空, 最多20个字符
    name            VARCHAR(20) NOT NULL,
    -- 毕业生性别, 非空, 只能是男或女
    gender          CHAR(2)     NOT NULL CHECK (gender IN (N'男', N'女')),
    -- 毕业生出生日期, 非空, 格式为YYYY-MM-DD
    birth_date      DATE        NOT NULL,
    -- 毕业生身份证号, 非空, 唯一, 18位数字或字母
    id_card         CHAR(18)    NOT NULL UNIQUE,
    -- 毕业生联系方式, 可空, 最多50个字符
    contact         VARCHAR(50),
    -- 专业ID, 非空, 外键, 引用专业表的主键
    major_id        INT         NOT NULL FOREIGN KEY REFERENCES majors (major_id),
    -- 入学时间, 非空, 格式为YYYY-MM-DD
    enrollment_date DATE        NOT NULL,
    -- 毕业时间, 非空, 格式为YYYY-MM-DD
    graduation_date DATE        NOT NULL,
    -- 学位授予时间, 可空, 格式为YYYY-MM-DD
    degree_date     DATE,
    -- 就业ID外键, 可空, 引用成绩单表的主键
    employment_id   INT FOREIGN KEY REFERENCES employment (employment_id)
);

-- 创建成绩表
CREATE TABLE grades
(
    -- 毕业生学号, 外键, 引用毕业生表的主键
    student_id  VARCHAR(10) FOREIGN KEY REFERENCES graduates (student_id),
    -- 科目ID, 外键, 引用科目表的主键
    subject_id  INT FOREIGN KEY REFERENCES subjects (subject_id),
    -- 成绩分数, 非空, 整数类型, 值在0到100之间
    grade_score INT NOT NULL CHECK (grade_score BETWEEN 0 AND 100),
    -- 复合主键, 由毕业生学号和科目ID组成
    PRIMARY KEY (student_id, subject_id)
);