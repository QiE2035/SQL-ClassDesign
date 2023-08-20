-- 一个唯一索引是在毕业生表上的身份证号字段上创建的。这样可以保证身份证号的唯一性，同时加快根据身份证号查询毕业生信息的速度。创建这个索引的SQL语句如下：
CREATE UNIQUE INDEX idx_graduates_id_card ON graduates (id_card);

-- 另一个索引是在成绩表上的成绩分数字段上创建的。这样可以加快根据成绩分数进行排序，分组，聚合等操作的速度。例如，如果要查询每个专业的平均成绩，或者查询某个科目的最高分和最低分等。创建这个索引的SQL语句如下：
CREATE INDEX idx_grades_grade_score ON grades (grade_score);
