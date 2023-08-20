-- 创建一个触发器，当毕业生表中插入或更新数据时，检查毕业时间是否晚于入学时间，如果不是，则回滚事务并抛出错误
CREATE TRIGGER check_graduation_date
    ON graduates
    AFTER INSERT, UPDATE
    AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE graduation_date <= enrollment_date)
        BEGIN
            ROLLBACK TRANSACTION;
            RAISERROR (N'毕业时间必须晚于入学时间', 16, 1);
        END
END;
GO

-- 创建一个触发器，当就业表中插入或更新数据时，检查合同期限是否晚于毕业时间，如果不是，则回滚事务并抛出错误
CREATE TRIGGER check_contract_date
    ON employment
    AFTER INSERT, UPDATE
    AS
BEGIN
    IF EXISTS (SELECT *
               FROM inserted i
                        JOIN graduates g ON i.employment_id = g.employment_id
               WHERE i.contract_date <= g.graduation_date)
        BEGIN
            ROLLBACK TRANSACTION;
            RAISERROR (N'合同期限必须晚于毕业时间', 16, 1);
        END
END;
GO

-- 创建一个触发器，当就业表中删除数据时，将对应的毕业生表中的就业ID设置为NULL
CREATE TRIGGER delete_employment_id
    ON employment
    AFTER DELETE
    AS
BEGIN
    DECLARE @employment_id INT;
    SELECT @employment_id = employment_id FROM deleted;
    UPDATE graduates SET employment_id = NULL WHERE employment_id = @employment_id;
END;
GO


-- 创建一个触发器，当专业表中插入或更新数据时，检查专业名称是否重复，如果是，则回滚事务并抛出错误
CREATE TRIGGER check_major_name
    ON majors
    AFTER INSERT, UPDATE
    AS
BEGIN
    IF EXISTS (SELECT *
               FROM inserted i
                        JOIN majors m ON i.major_id <> m.major_id AND i.major_name = m.major_name)
        BEGIN
            ROLLBACK TRANSACTION;
            RAISERROR (N'专业名称不能重复', 16, 1);
        END
END;
GO

-- 创建一个触发器，当科目表中插入或更新数据时，检查科目名称是否重复，如果是，则回滚事务并抛出错误
CREATE TRIGGER check_subject_name
    ON subjects
    AFTER INSERT, UPDATE
    AS
BEGIN
    IF EXISTS (SELECT *
               FROM inserted i
                        JOIN subjects s ON i.subject_id != s.subject_id AND i.subject_name = s.subject_name)
        BEGIN
            ROLLBACK TRANSACTION;
            RAISERROR (N'科目名称不能重复', 16, 1);
        END
END;
GO

-- 创建一个触发器，当就业单位表中插入或更新数据时，检查就业单位名称是否重复，如果是，则回滚事务并抛出错误
CREATE TRIGGER check_employer_name
    ON employer
    AFTER INSERT, UPDATE
    AS
BEGIN
    IF EXISTS (SELECT *
               FROM inserted i
                        JOIN employer e ON i.employer_id != e.employer_id AND i.employer_name = e.employer_name)
        BEGIN
            ROLLBACK TRANSACTION;
            RAISERROR (N'就业单位名称不能重复', 16, 1);
        END
END;
GO

-- 创建一个触发器，当毕业生表中删除数据时，将对应的成绩表中的数据也删除
CREATE TRIGGER delete_grades
    ON graduates
    AFTER DELETE
    AS
BEGIN
    DECLARE @student_id VARCHAR(10);
    SELECT @student_id = student_id FROM deleted;
    DELETE FROM grades WHERE student_id = @student_id;
END;
GO
