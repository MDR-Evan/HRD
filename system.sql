/*
create table TBL_DEPT (
    DEPT_CODE char(2) NOT NULL,
    DEPT_NAME varchar2(14),
    DEPT_OFFR varchar2(14),
    primary key(DEPT_CODE)
);

insert into TBL_DEPT values('10', '영업부', '김영업');
insert into TBL_DEPT values('20', '총무부', '이총무');
insert into TBL_DEPT values('30', '구매부', '박구매');
insert into TBL_DEPT values('40', '개발부', '조개발');

create table TBL_CAR (
        CAR_NO char(10) NOT NULL,
        CAR_MODEL varchar2(14),
        CAR_COMPANY varchar2(10),
        CAR_DATE char(8),
    primary key(CAR_NO)
);

insert into TBL_CAR values('10가0001', '소나타', '현대', '20230101');
insert into TBL_CAR values('10가0002', 'K5', '기아', '20230102');
insert into TBL_CAR values('10가0003', 'SM5', '삼성', '20230103');
insert into TBL_CAR values('10가0004', '그랜저', '현대', '20230104');
insert into TBL_CAR values('10가0005', 'K5', '기아', '20230105');

create table TBL_DRIVE (
    DRV_DATE char(8) NOT NULL,
    CAR_NO char(10) NOT NULL,
    DRV_START number,
    DRV_END number,
    DEPT_CODE char(2),
    DRV_MONEY number,
    primary key(DRV_DATE, CAR_NO)
);

insert into TBL_DRIVE values('20230301', '10가0001', 10000, 10100, '10', 20000);
insert into TBL_DRIVE values('20230301', '10가0002', 10000, 10150, '10', 30000);
insert into TBL_DRIVE values('20230301', '10가0003', 10000, 10200, '20', 30000);
insert into TBL_DRIVE values('20230301', '10가0004', 10000, 10250, '30', 40000);
insert into TBL_DRIVE values('20230301', '10가0005', 10000, 10300, '40', 40000);
insert into TBL_DRIVE values('20230302', '10가0001', 10100, 10300, '10', 25000);
insert into TBL_DRIVE values('20230302', '10가0002', 10150, 10300, '10', 20000);
insert into TBL_DRIVE values('20230302', '10가0003', 10200, 10400, '20', 35000);
insert into TBL_DRIVE values('20230302', '10가0004', 10250, 10500, '20', 40000);
insert into TBL_DRIVE values('20230302', '10가0005', 10300, 10600, '30', 50000);
*/

select car_no, car_model, car_company, car_date from TBL_CAR;

select DRV_DATE ,
CAR_NO ,
DRV_START ,
DRV_END ,
DEPT_CODE ,
DRV_MONEY  from TBL_DRIVE; 

select DEPT_CODE, drv_end - drv_start from tbl_drive group by dept_code;


select d.drv_date, d.car_no, c.car_model, d.drv_start, d.drv_end, d.dept_code, d.drv_money from tbl_car c, tbl_drive d where c.car_no = d.car_no;

select de.dept_code as 부서코드, de.dept_code as 부서명, drive.drv_end - drive.drv_start as 총운행거리, sum(drive.drv_money) from tbl_dept de, tbl_drive drive where de.dept_code = drive.dept_code group by de.dept_code, de.dept_code, drive.drv_end - drive.drv_start order by de.dept_code asc;

select de.dept_code as 부서코드, de.dept_code as 부서명, sum(dr.drv_end - dr.drv_start) as 총운행거리, sum(dr.drv_money) from tbl_dept de join tbl_drive dr on dr.dept_code = de.dept_code group by de.dept_code, de.dept_code order by de.dept_code asc;