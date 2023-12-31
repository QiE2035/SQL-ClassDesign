-- 插入专业表数据
INSERT INTO majors (major_name, degree_type)
VALUES (N'计算机科学', N'学士'),
       (N'软件工程', N'硕士'),
       (N'信息管理', N'博士'),
       (N'数学', N'学士'),
       (N'物理', N'硕士'),
       (N'化学', N'博士'),
       (N'生物', N'学士'),
       (N'经济', N'硕士'),
       (N'管理', N'博士'),
       (N'法律', N'学士');


-- 插入科目表数据
INSERT INTO subjects (subject_name)
VALUES (N'高等数学'),
       (N'线性代数'),
       (N'C语言程序设计'),
       (N'数据结构与算法'),
       (N'数据库原理与应用'),
       (N'操作系统'),
       (N'计算机网络'),
       (N'软件工程'),
       (N'信息系统分析与设计'),
       (N'人工智能');

-- 插入就业单位表数据
INSERT INTO employer (employer_name, employer_address, employer_contact)
VALUES (N'百度', N'北京市海淀区上地十街10号百度大厦', N'(010)59928888'),
       (N'腾讯', N'深圳市南山区科技园腾讯大厦', N'(0755)86013388'),
       (N'阿里巴巴', N'杭州市滨江区网商路699号阿里巴巴总部', N'(0571)85022088'),
       (N'华为', N'深圳市龙岗区坂田华为基地', NULL),
       (N'微软', N'北京市海淀区西北旺东路10号院5号楼微软亚太研发集团总部', NULL),
       (N'字节跳动', N'北京市海淀区中关村东路6号院1号楼字节跳动大厦', NULL),
       (N'京东', N'北京市朝阳区北辰西路8号院1号楼京东总部大厦', NULL),
       (N'新浪', NULL, NULL),
       (N'网易', NULL, NULL),
       (N'CSDN', NULL, NULL);

-- 插入就业表数据
INSERT INTO employment (employer_id, position, contract_date, salary)
VALUES (1, N'软件工程师', '2025-7-8', 20000),
       (2, N'产品经理', '2025-7-9', 18000),
       (3, N'数据分析师', '2025-7-7', 15000),
       (4, N'测试工程师', '2025-7-8', 12000),
       (5, N'项目经理', '2025-7-8', 22000),
       (6, N'运维工程师', '2025-7-8', 14000),
       (7, N'前端开发工程师', '2025-7-9', 16000),
       (8, N'后端开发工程师', '2025-7-7', 17000),
       (9, N'UI设计师', '2025-7-8', 13000),
       (10, N'网络安全工程师', '2025-7-8', 19000),
       (1, N'算法工程师', '2025-7-9', 21000),
       (2, N'运营专员', '2025-7-8', 10000),
       (3, N'市场营销专员', '2025-7-7', 11000),
       (4, N'客服专员', NULL, 8000),
       (5, N'技术支持专员', '2025-7-8', 9000),
       (6, N'内容编辑', NULL, 7000),
       (7, N'财务专员', '2025-7-9', 12000),
       (8, N'人力资源专员', '2025-7-7', 10000),
       (9, NULL, NULL, NULL),
       (10, NULL, NULL, NULL);


-- 插入毕业生表数据
INSERT INTO graduates
VALUES
-- 学号, 姓名, 性别, 出生日期, 身份证号, 联系方式, 专业ID, 入学时间, 毕业时间, 学位授予时间, 就业ID
('20210001', N'王晓明', N'男', '2001-01-01', '110101200101010011', 'wangxm@163.com', 1, '2017-09-01', '2023-07-08', '2023-07-09', 1),
('20210002', N'李梦琪', N'女', '2001-02-02', '120102200102020022', 'limq@qq.com', 2, '2017-09-01', '2023-07-07', '2023-07-08', 2),
('20210003', N'张伟杰', N'男', '2001-03-03', '130103200103030033', '13800000003', 3, '2017-09-01', '2023-07-06', NULL, 3),
('20210004', N'刘婷婷', N'女', '2001-04-04', '140104200104040044', NULL, 4, '2017-09-01', '2023-07-08', NULL, 4),
('20210005', N'陈浩然', N'男', '2001-05-05', '150105200105050055', NULL, 5, '2017-09-01', '2023-07-10', NULL, 5),
('20210006', N'赵雅婷', N'女', '2001-06-06', '210106200106060066', NULL, 6, '2017-09-01', '2023-07-08', NULL, 6),
('20210007', N'周文涛', N'男', '2001-07-07', '220107200107070077', 'zhouwt@126.com', 7, '2017-09-01', '2023-07-08', NULL, 7),
('20210008', N'孙悦', N'女', '2001-08-08', '230108200108080088', 'sunyue@gmail.com', 8, '2017-09-01', '2023-07-10', '2023-07-11', 8),
('20210009', N'吴云飞', N'男', '2001-09-09', '310109200109090099', 'wuyf@outlook.com', 9, '2017-09-01', '2023-07-06', '2023-07-06', 9),
('20210010', N'郑晓雨', N'女', '2001-10-10', '320110200110100010', 'zhengxy@sina.com', 10, '2017-09-01', '2023-07-08', '2023-07-10', 10),
('20210011', N'林志豪', N'男', '2001-11-11', '330111200111110011', 'linzh@msn.com', 1, '2017-09-01', '2023-07-10', '2023-07-11', 11),
('20210012', N'何佳怡', N'女', '2001-12-12', '340112200112120012', 'hejy@foxmail.com', 2, '2017-09-01', '2023-07-06', '2023-07-06', 12),
('20210013', N'马鑫', N'男', '2002-01-13', '350113200201130013', 'maxin@sohu.com', 3, '2017-09-01', '2023-07-08', '2023-07-10', 13),
('20210014', N'罗婷婷', N'女', '2002-02-14', '360114200202140014', 'luott@tom.com', 4, '2017-09-01', '2023-07-07', '2023-07-08', 14),
('20210015', N'高伟', N'男', '2002-03-15', '370115200203150015', 'gaowei@edu.cn', 5, '2017-09-01', '2023-07-08', '2023-07-10', 15),
('20210016', N'黄婷婷', N'女', '2002-04-16', '410116200204160016', 'huangtt@vip.com', 6, '2017-09-01', '2023-07-06', '2023-07-06', 16),
('20210017', N'曹磊', N'男', '2002-05-17', '420117200205170017', 'caolei@yeah.net', 7, '2017-09-01', '2023-07-10', '2023-07-11', 17),
('20210018', N'徐嘉欣', N'女', '2002-06-18', '430118200206180018', 'xujx@163.com', 8, '2017-09-01', '2023-07-08', '2023-07-10', 18),
('20210019', N'杨浩然', N'男', '2002-07-19', '440119200207190019', 'yanghr@qq.com', 9, '2017-09-01', '2023-07-08', '2023-07-10', 19),
('20210020', N'谢雨欣', N'女', '2002-08-20', '450120200208200020', 'xiexy@126.com', 10, '2017-09-01', '2023-07-06', '2023-07-06', 20),
('20210021', N'邓志强', N'男', '2002-09-21', '460121200209210021', 'dengzq@outlook.com', 1, '2017-09-01', '2023-07-10', NULL, 1),
('20210022', N'潘佳琪', N'女', '2002-10-22', '500122200210220022', NULL, 2, '2017-09-01', '2023-07-08', NULL, 2),
('20210023', N'韩伟杰', N'男', '2002-11-23', '510123200211230023', NULL, 3, '2017-09-01', '2023-07-08', NULL, 3),
('20210024', N'蔡婷婷', N'女', '2002-12-24', '520124200212240024', NULL, 4, '2017-09-01', '2023-07-10', NULL, 4),
('20210025', N'陶晓峰', N'男', '2002-01-25', '530125200201250031', 'taoxf@163.com', 5, '2017-09-01', '2023-07-07', '2023-07-08', 5),
('20210026', N'魏婷婷', N'女', '2002-02-26', '540126200202260042', 'weit@126.com', 6, '2017-09-01', '2023-07-10', '2023-07-11', 6),
('20210027', N'方志强', N'男', '2002-03-27', '610127200203270053', 'fangzq@qq.com', 7, '2017-09-01', '2023-07-06', NULL, 7),
('20210028', N'余佳欣', N'女', '2002-04-28', '620128200204280064', 'yujx@outlook.com', 8, '2017-09-01', '2023-07-08', '2023-07-10', 8),
('20210029', N'梁浩然', N'男', '2002-05-29', '630129200205290075', 'lianghr@gmail.com', 9, '2017-09-01', '2023-07-08', '2023-07-10', 9),
('20210030', N'蒋雨欣', N'女', '2002-06-30', '640130200206300086', 'jiangyx@sina.com', 10, '2017-09-01', '2023-07-06', '2023-07-06', 10),
('20210031', N'冯志豪', N'男', '2002-07-31', '650131200207310097', 'fengzh@msn.com', 1, '2017-09-01', '2023-07-10', '2023-07-11', 11),
('20210032', N'苏佳琪', N'女', '2002-08-01', '660132200208010018', 'sujq@foxmail.com', 2, '2017-09-01', '2023-07-08', NULL, 12),
('20210033', N'邱伟杰', N'男', '2002-09-02', '710133200209020029', 'qiuwj@sohu.com', 3, '2017-09-01', '2023-07-08', '2023-07-10', 13),
('20210034', N'卢婷婷', N'女', '2002-10-03', '720134200210030030', 'lutt@tom.com', 4, '2017-09-01', '2023-07-07', '2023-07-08', 14),
('20210035', N'沈伟', N'男', '2002-11-04', '730135200211040041', 'shenwei@edu.cn', 5, '2017-09-01', '2023-07-08', '2023-07-10', 15),
('20210036', N'曾婷婷', N'女', '2002-12-05', '740136200212050052', 'zengtt@vip.com', 6, '2017-09-01', '2023-07-06', '2023-07-06', 16),
('20210037', N'姜磊', N'男', '2003-01-06', '750137200301060063', 'jianglei@yeah.net', 7, '2017-09-01', '2023-07-10', '2023-07-11', 17),
('20210038', N'郭嘉欣', N'女', '2003-02-07', '760138200302070074', 'guojx@163.com', 8, '2017-09-01', '2023-07-08', '2023-07-10', 18),
('20210039', N'孔浩然', N'男', '2003-03-08', '770139200303080085', 'konghr@qq.com', 9, '2017-09-01', '2023-07-08', '2023-07-10', 19),
('20210040', N'余雨欣', N'女', '2003-04-09', '780140200304090096', 'yuyx@126.com', 10, '2017-09-01', '2023-07-06', '2023-07-06', 20),
('20210041', N'董志强', N'男', '2003-05-10', '790141200305100017', '13912345678', 1, '2017-09-01', '2023-07-10', NULL, 1),
('20210042', N'王佳琪', N'女', '2003-06-11', '800142200306110028', '15887654321', 2, '2017-09-01', '2023-07-08', NULL, 2),
('20210043', N'杜伟杰', N'男', '2003-07-12', '810143200307120039', '18623456789', 3, '2017-09-01', '2023-07-08', '2023-07-10', 3),
('20210044', N'陈婷婷', N'女', '2003-08-13', '820144200308130040', '17776543210', 4, '2017-09-01', '2023-07-10', NULL, 4),
('20210045', N'赵伟', N'男', '2003-09-14', '830145200309140051', '13509876543', 5, '2017-09-01', '2023-07-08', '2023-07-10', 5),
('20210046', N'吴婷婷', N'女', '2003-10-15', '840146200310150062', '18987654321', 6, '2017-09-01', '2023-07-06', '2023-07-06', 6),
('20210047', N'张磊', N'男', '2003-11-16', '850147200311160073', '13712345678', 7, '2017-09-01', '2023-07-10', '2023-07-11', 7),
('20210048', N'李嘉欣', N'女', '2003-12-17', '860148200312170084', '15976543210', 8, '2017-09-01', '2023-07-08', '2023-07-10', 8),
('20210049', N'刘浩然', N'男', '2004-01-18', '870149200401180095', '18723456789', 9, '2017-09-01', '2023-07-08', '2023-07-10', 9),
('20210050', N'方浩然', N'男', '2003-01-25', '530125200301250025', NULL, 5, '2017-09-01', '2023-07-06', NULL, 5)

-- 插入成绩表数据
BEGIN
    DECLARE @student_id VARCHAR(10); -- 声明一个变量存储学号
    DECLARE @subject_id INT; -- 声明一个变量存储科目ID
    DECLARE @grade_score INT; -- 声明一个变量存储成绩分数
    DECLARE @subject_count INT; -- 声明一个变量存储每个学生的科目数
    DECLARE @i INT = 1;

    -- 声明一个循环计数器, 循环插入50个学生的数据
    WHILE @i <= 50
        BEGIN
            -- 生成学号，格式为20210001到20210050
            SET @student_id = '2021' + RIGHT('0000' + CAST(@i AS VARCHAR(4)), 4);
            -- 随机生成每个学生的科目数，范围为3到5
            SET @subject_count = ROUND(RAND() * (5 - 3) + 3, 0);
            -- 循环插入每个学生的每个科目的数据
            WHILE @subject_count > 0
                BEGIN
                    -- 随机生成科目ID，范围为1到10
                    SET @subject_id = ROUND(RAND() * (10 - 1) + 1, 0);
                    -- 随机生成成绩分数，范围为0到100
                    SET @grade_score = ROUND(RAND() * (100 - 0) + 0, 0);
                    -- 插入一条数据到成绩表中
                    INSERT INTO grades (student_id, subject_id, grade_score)
                    VALUES (@student_id, @subject_id, @grade_score);
                    -- 科目数减一
                    SET @subject_count = @subject_count - 1;
                END;
            -- 学生数加一
            SET @i = @i + 1;
        END;
END
