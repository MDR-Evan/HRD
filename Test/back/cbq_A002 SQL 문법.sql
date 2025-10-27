create table TBL_UNIVERSITY(
	UNIVERSITY_CODE CHAR(4) NOT NULL,
	UNIVERSITY_NAME VARCHAR2(15),
	PHONE_NUM VARCHAR2(13),
	primary key(UNIVERSITY_CODE)
);

INSERT INTO TBL_UNIVERSITY VALUES('U001', '서울대학교', '01015880001');
INSERT INTO TBL_UNIVERSITY VALUES('U002', '경기대학교', '01015880002');

---

create table TBL_MAJOR(
	MAJOR_CODE CHAR(4) NOT NULL,
	DEPT_NAME VARCHAR2(15),
	MAJOR_NAME VARCHAR2(20),
	QUOTA NUMBER,
	primary key(MAJOR_CODE)
);

INSERT INTO TBL_MAJOR VALUES('M001', '인문계열', '법학과', 20);
INSERT INTO TBL_MAJOR VALUES('M002', '자연계열', '컴퓨터공학과', 30);

---

create table TBL_APPLY(
	REGIST_NUM CHAR(13) NOT NULL,
	UNIVERSITY_CODE CHAR(4),
	MAJOR_CODE CHAR(4),
	NAME VARCHAR2(15),
	S_SCORE NUMBER,
	N_SCORE NUMBER,
	TOTAL_SCORE NUMBER,
	primary key(REGIST_NUM)
);

INSERT INTO TBL_APPLY VALUES('0201013000001', 'U001', 'M001', '김철수', 100, 100, 200);
INSERT INTO TBL_APPLY VALUES('0201013000002', 'U001', 'M002', '이철수', 90, 85, 175);
INSERT INTO TBL_APPLY VALUES('0201013000003', 'U001', 'M001', '박철수', 80, 75, 155);
INSERT INTO TBL_APPLY VALUES('0201013000004', 'U002', 'M001', '조철수', 70, 95, 165);
INSERT INTO TBL_APPLY VALUES('0201013000005', 'U002', 'M002', '권철수', 60, 65, 125);
INSERT INTO TBL_APPLY VALUES('0201013000006', 'U001', 'M002', '김영희', 65, 100, 165);
INSERT INTO TBL_APPLY VALUES('0201013000007', 'U002', 'M001', '이영희', 75, 70, 145);
INSERT INTO TBL_APPLY VALUES('0201013000008', 'U002', 'M001', '박영희', 85, 60, 145);
INSERT INTO TBL_APPLY VALUES('0201013000009', 'U001', 'M001', '조영희', 95, 80, 175);
INSERT INTO TBL_APPLY VALUES('0201013000010', 'U001', 'M002', '권영희', 100, 90, 190);

---

select university_code, university_name, phone_num from tbl_university;

select name, regist_num, university_code, major_code, s_score, n_score, total_score from tbl_apply order by total_score desc, s_score desc

// 왼쪽 값
select a.name, a.regist_num, u.university_name from tbl_apply a right join tbl_university u on a.university_code = u.university_code;

// 중앙 값
select m.major_name, a.s_score, a.n_score, a.total_score from tbl_major m right join tbl_apply a on m.major_code = a.major_code;

// 왼족 + 중앙
select a.name, a.regist_num, u.university_name, m.major_name, a.s_score, a.n_score, a.total_score from tbl_major m right join tbl_apply a on m.major_code = a.major_code left join tbl_university u on a.university_code = u.university_code order by total_score desc;

// 오른쪽 값
select rank(total_score) within  group  from tbl_apply;
 



// select a.name, a.regist_num, a.university_code, a.major_code, a.s_score, a.n_score, a.total_score, rank(b.total_score) from tbl_apply a right join tbl_apply b on a.regist_num = b.regist_num order by total_score desc;


---
select u.university_code, u.university_name, count(a.university_code), sum(a.total_score) / count(a.university_code) from tbl_university u join tbl_apply a on u.university_code = a.university_code group by u.university_code, u.university_name order by university_code;

select name, regist_num, university_code, s_score, n_score, total_score, rank(total_score) from tbl_apply group by name, regist_num, university_code, s_score, n_score, total_score order by total_score desc;

select name, regist_num, university_code, major_code, s_score, n_score, total_score, rank(total_score) within group name, regist_num, university_code, major_code, s_score, n_score, total_score from tbl_apply order by total_score desc;