DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `score_schoolid` int(11) NOT NULL COMMENT '学生编号，学号',
    `score_student` varchar(50) NOT NULL COMMENT '姓名',
    `score_subject` int(3) NOT NULL COMMENT '科目分数',
    `score_total` int(3) NOT NULL COMMENT '总分',
    `score_average` int(3) NOT NULL COMMENT '平均分',
    `score_rank` int(10) NOT NULL COMMENT '排名',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `student_no` varchar(100) NOT NULL COMMENT '学生学号',
    `student_name` varchar(50) NOT NULL COMMENT '学生姓名',
    `student_sex` varchar(10) NOT NULL COMMENT '学生性别',
    `student_start_year` varchar(10) NOT NULL COMMENT '入学年份',
    `student_finish_year` varchar(10) NOT NULL COMMENT '毕业年份',
    `student_nation` varchar(20) NOT NULL COMMENT '民族',
    `student_birthday` datetime DEFAULT NULL COMMENT '学生生日',
    `student_college` varchar(50) NOT NULL COMMENT '学院',
    `student_major` varchar(50) NOT NULL COMMENT '专业',
    `student_type` varchar(20) NOT NULL COMMENT '学生类型',
    UNIQUE KEY `student_no` (`student_no`),
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `course_id` int(10) NOT NULL COMMENT '课程编号',
    `course_name` varchar(50) NOT NULL COMMENT '课程名',
    `course_url` varchar(100) NOT NULL COMMENT '课程链接',
    `course_desc` text DEFAULT NULL COMMENT '课程描述',
    `course_instructor` varchar(50) NOT NULL COMMENT '课程讲师',
    `course_thumbnail` varchar(100) DEFAULT NULL COMMENT '课程封面缩略图地址',
    `course_start_time` datetime NOT NULL COMMENT '课程开始时间',
    `course_end_time` datetime NOT NULL COMMENT '课程结束时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
