SELECT USER
FROM DUAL;
--==>> SCOTT


--?�� ?��?�� ?��?���? ?��?��(�??��: REGION)
CREATE TABLE REGION
( REGIONID      NUMBER          --�??�� ?��?��?��(PK)
, REGIONNAME    VARCHAR2(30)    --�??�� �?
, CONSTRAINT REGION_ID_PK PRIMARY KEY(REGIONID)
);
--==>> Table REGION?��(�?) ?��?��?��?��?��?��?��.


--?�� ?��???�� ?��?��(�??��: REGIONSEQ)
CREATE SEQUENCE REGIONSEQ
NOCACHE;
--==>> Sequence REGIONSEQ?��(�?) ?��?��?��?��?��?��?��.


--?�� ?��?��?�� ?��?��(�??�� ?��?��?�� ?��?��)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '?��?��');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '경기');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '?���?');
--==>> 1 ?�� ?��(�?) ?��?��?��?��?��?��?��. *3


--?�� ?��?��?�� ?��?��(�??�� ?��?��?�� 추�? ?��?��)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '?���?');
--==>> 1 ?�� ?��(�?) ?��?��?��?��?��?��?��.


--?�� ?��?��
SELECT REGIONID, REGIONNAME FROM REGION
;
/*
REGIONID	REGIONNAME
1	?��?��
2	경기
3	?���?
4	?���?
*/
 
 
--?�� 커밋
COMMIT;


--?�� ?��?�� ?��?���? ?��?��(직위: POSITION)
CREATE TABLE POSITION
( POSITIONID    NUMBER          --직위 ?��?��?��(PK)
, POSITIONNAME  VARCHAR2(30)    --직위 �?
, MINBASICPAY   NUMBER          --최소 기본�?
, CONSTRAINT POSITION_ID_PK PRIMARY KEY(POSITIONID)
);
--==>> Table POSITION?��(�?) ?��?��?��?��?��?��?��.


--?�� ?��???�� ?��?��(직위: POSITIONSEQ)
CREATE SEQUENCE POSITIONSEQ
NOCACHE;
--==>> Sequence POSITIONSEQ?��(�?) ?��?��?��?��?��?��?��.


--?�� ?��?��?�� ?��?��(직위 ?��?��?�� ?��?��)
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '?��?��', 1000000); --백만
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '??�?', 2000000); --?��백만
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '�??��', 3000000); --?��백만
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '?���?', 4000000); --?��백만
--==>> 1 ?�� ?��(�?) ?��?��?��?��?��?��?��. *4


--?�� ?��?��
SELECT POSITIONID, POSITIONNAME, MINBASICPAY FROM POSITION
;
/*
POSITIONID	POSITIONNAME	MINBASICPAY
1	        ?��?��      	1000000
2	        ??�?	    2000000
3	        �??��	        3000000
4	        ?���?      	4000000
*/


--?�� 커밋
COMMIT;


--?�� ?��?�� ?��?���? ?��?��(�??��: DEPARTMENT)
CREATE TABLE DEPARTMENT
( DEPARTMENTID      NUMBER          --�??�� ?��?��?��(PK)
, DEPARTMENTNAME    VARCHAR2(30)    --�??�� �?
, CONSTRAINT DEPARTMENT_ID_PK PRIMARY KEY(DEPARTMENTID)
);
--==>> Table DEPARTMENT?��(�?) ?��?��?��?��?��?��?��.


--?�� ?��???�� ?��?��(�??��: DEPARTMENTSEQ)
CREATE SEQUENCE DEPARTMENTSEQ
NOCACHE;
--==>> Sequence DEPARTMENTSEQ?��(�?) ?��?��?��?��?��?��?��.


--?�� ?��?��?�� ?��?��(�??�� ?��?��?�� ?��?��)
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '개발�?');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '마�??���?');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '?��?���?');
--==>> 1 ?�� ?��(�?) ?��?��?��?��?��?��?��. *3


--?�� ?��?��
SELECT DEPARTMENTID, DEPARTMENTNAME FROM DEPARTMENT
;
/*
DEPARTMENTID	DEPARTMENTNAME
1	        개발�?
2	        마�??���?
3	        ?��?���?
*/


--?�� 커밋
COMMIT;
--==>> 커밋 ?���?.


--?�� ?��?�� ?��?���? ?��?��(직원: EMPLOYEE)
-- ?��?��번호, ?��?���?, 주�?�번?��, ?��?��?��?��, ?��?��?��
--, ?��?��번호, �??��, 직위, �??��, 기본�?, ?��?��
CREATE TABLE EMPLOYEE
( EMPLOYEEID    NUMBER                  --?��?��번호(PK)
, NAME          VARCHAR2(30)            --?��?�� �?
, SSN           VARCHAR2(20)            --주�?? 번호(?��?��?�� 기능 ?��?��!)
, BIRTHDAY      DATE                    --?��?��?��?��
, LUNAR         NUMBER(1) DEFAULT 0     --?��?��?��(?��?�� 0, ?��?�� 1)
, TELEPHONE     VARCHAR2(40)            --?��?�� 번호
, DEPARTMENTID  NUMBER                  --�??�� ?��?��?��
, POSITIONID    NUMBER                  --직위 ?��?��?��
, REGIONID      NUMBER                  --�??�� ?��?��?��
, BASICPAY      NUMBER                  --기본�?
, EXTRAPAY      NUMBER                  --?��?��
, CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY(EMPLOYEEID)
, CONSTRAINT EMPLOYEE_DEPARTEMENTID_FK FOREIGN KEY(DEPARTMENTID)
             REFERENCES DEPARTMENT(DEPARTMENTID)
, CONSTRAINT EMPLOYEE_POSITIONID_FK FOREIGN KEY(POSITIONID)
             REFERENCES POSITION(POSITIONID)
, CONSTRAINT EMPLOYEE_REGIONID_FK FOREIGN KEY(REGIONID)
             REFERENCES REGION(REGIONID)
, CONSTRAINT EMPLOYEE_LUNAR_CK CHECK(LUNAR=0 OR LUNAR=1)
);
--==>> Table EMPLOYEE?��(�?) ?��?��?��?��?��?��?��.


--?�� ?��???�� ?��?��(직원: EMPLOYEESEQ)
CREATE SEQUENCE EMPLOYEESEQ
NOCACHE;
--==>> Sequence EMPLOYEESEQ?��(�?) ?��?��?��?��?��?��?��.


--?�� ?��?��?�� ?��?��(직원 ?��?��?�� ?��?��)
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR
                   , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                   , BASICPAY, EXTRAPAY)
VALUES(EMPLOYEESEQ.NEXTVAL, '?��?���?', CRYPTPACK.ENCRYPT('9710062234567','9710062234567')
     , TO_DATE('1997-10-06','YYYY-MM-DD'), 0, '010-8755-9495', 1, 1, 1, 1500000, 1500000);
--==>> 1 ?�� ?��(�?) ?��?��?��?��?��?��?��.


--?? ?��?�� ?��?�� �?�?
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session?��(�?) �?경되?��?��?��?��.


--?�� ?��?��
SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY FROM EMPLOYEE
;
/*
EMPLOYEEID	NAME    	SSN	        BIRTHDAY	    LUNAR	TELEPHONE	    DEPARTMENTID	    POSITIONID	REGIONID	    BASICPAY	    EXTRAPAY
1	        ?��?���?	"?h????"	1997-10-06	0	    010-8755-9495	1	            1	        1	        1500000	    1500000
*/


--?�� 커밋
COMMIT;
--==>> 커밋 ?���?.


--?�� 직원 ?���? 조회 쿼리�? 구성
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '?��?��', 1, '?��?��') AS LUNARNAME
     , E.TELEPHONE
     , E.DEPARTMENTID
     , ( SELECT DEPARTMENTNAME
         FROM DEPARTMENT
         WHERE DEPARTMENTID = E.DEPARTMENTID ) AS DEPARTMENTNAME
     , E.POSITIONID
     , ( SELECT POSITIONNAME
         FROM POSITION
         WHERE POSITIONID = E.POSITIONID ) AS POSITIONNAME
     , E.REGIONID
     , ( SELECT REGIONNAME
         FROM REGION
         WHERE REGIONID = E.REGIONID) AS REGIONNAME
     , E.BASICPAY
     , E.EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E
ORDER BY E.EMPLOYEEID;


--?�� �? ?��?��(EMPLOYEEVIEW)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '?��?��', 1, '?��?��') AS LUNARNAME
     , E.TELEPHONE
     , E.DEPARTMENTID
     , ( SELECT DEPARTMENTNAME
         FROM DEPARTMENT
         WHERE DEPARTMENTID = E.DEPARTMENTID ) AS DEPARTMENTNAME
     , E.POSITIONID
     , ( SELECT POSITIONNAME
         FROM POSITION
         WHERE POSITIONID = E.POSITIONID ) AS POSITIONNAME
     , E.REGIONID
     , ( SELECT REGIONNAME
         FROM REGION
         WHERE REGIONID = E.REGIONID) AS REGIONNAME
     , E.BASICPAY
     , E.EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E
ORDER BY E.EMPLOYEEID;
--==>> View EMPLOYEEVIEW?��(�?) ?��?��?��?��?��?��?��.


--?�� �??�� ?��?��?�� 조회 쿼리�? 구성(�??�� ?��?��?�� ?��?�� �??��?���? ?��?��)
SELECT R.REGIONID, R.REGIONNAME
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE REGIONID = R.REGIONID ) AS DELCHECK
FROM REGION R;
/*
REGIONID	REGIONNAME	DELCHECK
1	    ?��?��      	1
2	    경기	    0
3	    ?���?  	    0
4	    ?���?	    0
*/
--==>> ?�서?��?�의 �??�� ?��?��?��?�� ?��?���? 불�??��?�� ?��?��?���?,
--     ?�경기�??, ?�인천�??, ?�제주�?�의 �??�� ?��?��?��?�� ?��?���? �??��?�� ?��?��?��?��
--     ?��별할 ?�� ?��?�� 쿼리�?


--?�� �? ?��?��(REGIONVEIW)
CREATE OR REPLACE VIEW REGIONVEIW
AS
SELECT R.REGIONID, R.REGIONNAME
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE REGIONID = R.REGIONID ) AS DELCHECK
FROM REGION R;
--==>> View REGIONVEIW?��(�?) ?��?��?��?��?��?��?��.


--?�� 직위 ?��?��?�� 조회 쿼리�? 구성(직위 ?��?��?�� ?��?�� �??��?���? ?��?��)
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE POSITIONID = P.POSITIONID ) AS DELCHECK
FROM POSITION P;
/*
POSITIONID	POSITIONNAME	MINBASICPAY	DELCHECK
1	        ?��?��	        1000000	    1
2	        ??�?	    2000000	    0
3	        �??��      	3000000	    0
4	        ?���?	        4000000	    0
*/


--?�� �? ?��?��(POSITIONVIEW)
CREATE OR REPLACE VIEW POSITIONVIEW
AS
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE POSITIONID = P.POSITIONID ) AS DELCHECK
FROM POSITION P;
--==>> View POSITIONVIEW?��(�?) ?��?��?��?��?��?��?��.


--?�� �??�� ?��?��?�� 조회 쿼리�? 구성(�??�� ?��?��?�� ?��?�� �??��?���? ?��?��)
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
    , ( SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID = D.DEPARTMENTID ) AS DELCHECK
FROM DEPARTMENT D;
/*
DEPARTMENTID    	DEPARTMENTNAME	DELCHECK
1	            개발�?	        1
2	            마�??���?	        0
3	            ?��?���?	        0
*/


--?�� �? ?��?��(DEPARTMENTVIEW)
CREATE OR REPLACE VIEW DEPARTMENTVIEW
AS
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
    , ( SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID = D.DEPARTMENTID ) AS DELCHECK
FROM DEPARTMENT D;
--==>> View DEPARTMENTVIEW?��(�?) ?��?��?��?��?��?��?��.


--?�� 직위�? 최소 기본�? �??�� 쿼리�? 구성
SELECT MINBASICPAY
FROM POSITION
WHERE POSITIONID=1;     --?��?��

--?�� �? 구성
SELECT MINBASICPAY FROM POSITION WHERE POSITIONID=1
;
--==>> 1000000


--------------------------------------------------------------------------------


--?��?��?�� 로그?�� / 로그?��?�� 과정 추�?(�?�?) ?��?��?��--

--ID?? PW 컬럼 ?��?��?���? ?���? ?��?�� ?��?��블이 별도�? 존재?���? ?��?�� ?��?��?��?��.
--?��?? �??��?��?�� EMPLOYEEID(?��?�� ?��?��?��)?? SSN(주�?�번?��) ?��?���?
--7?���? ?��?���? ?��?��?�� ?�� ?��?���? 구성?��?��.

--?? 기존 ?��?���? 구조 �?�?
--?��
--EMPLOYEE(직원 ?��?���?)?�� SSN(주�?�번?��) 컬럼?�� 분리?��?��.
--SSN -> SSN1, SSN2
--SSN1: 주�?�번?�� ?�� 6?���?
--SSN2: 주�?�번?�� ?�� 7?���? ?�� ?��?��?�� ?��?��

--?��
--EMPLOYEE(직원 ?��?���?)?�� GRADE(?���?) 컬럼?�� 추�??��?��.
--GRADE ?�� �?리자 0, ?��반사?�� 1


--?�� 컬럼 분할 SSN ?�� SSN1, SSN2

--컬럼 추�?
ALTER TABLE EMPLOYEE
ADD(SSN1 CHAR(6), SSN2 VARCHAR2(50));
--==>> Table EMPLOYEE?��(�?) �?경되?��?��?��?��.


SELECT *
FROM EMPLOYEE;


UPDATE EMPLOYEE
SET SSN1=SUBSTR(CRYPTPACK.DECRYPT(SSN,'9710062234567'),1,6)
  , SSN2=CRYPTPACK.ENCRYPT(SUBSTR(CRYPTPACK.DECRYPT(SSN,'9710062234567'),7,7)
                        , SUBSTR(CRYPTPACK.DECRYPT(SSN,'9710062234567'),7,7));
--==>> 1 ?�� ?��(�?) ?��?��?��?��?��?��?��?��?��.


--기존 주�?�번?�� 컬럼(SSN) ?���?
ALTER TABLE EMPLOYEE
DROP COLUMN SSN;
--==>> Table EMPLOYEE?��(�?) �?경되?��?��?��?��.


--?�� ?��?��
SELECT *
FROM EMPLOYEE;
--==>> 1	?��?���?	1997-10-06	0	010-8755-9495	1	1	1	1500000	1500000	971006	Y{?7?


--?�� 컬럼 추�? ?�� GRADE - 기본값을 1(?���? 직원)�? 구성
ALTER TABLE EMPLOYEE
ADD GRADE NUMBER(1) DEFAULT 1;
--==>> Table EMPLOYEE?��(�?) �?경되?��?��?��?��.


--?�� ?��?��
SELECT *
FROM EMPLOYEE;
--==>> 1	?��?���?	1997-10-06	0	010-8755-9495	1	1	1	1500000	1500000	971006	Y{?7?	1


--?�� ?��?���? ?��?��?�� �?리자�? ?���?
UPDATE EMPLOYEE
SET GRADE=0
WHERE EMPLOYEEID=1;
--==>> 1 ?�� ?��(�?) ?��?��?��?��?��?��?��?��?��.


--?�� ?��?��
SELECT *
FROM EMPLOYEE;
--==>> 1	?��?���?	1997-10-06	0	010-8755-9495	1	1	1	1500000	1500000	971006	Y{?7?	0


--?�� 커밋
COMMIT;


--?? ?��?��블의 구조�? �?경했�? ?��문에
--   ?��?? �??��?�� �?(VIEW)?�� ?��?��?�� ?���? ?��?��(?��?��)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID AS EMPLOYEEID
     , E.NAME AS NAME
     , E.SSN1 AS SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR AS LUNAR
     , DECODE(E.LUNAR, 0, '?��?��', 1, '?��?��') AS LUNARNAME
     , E.TELEPHONE AS TELEPHONE
     , E.DEPARTMENTID AS DEPARTMENTID
     , ( SELECT DEPARTMENTNAME
         FROM DEPARTMENT
         WHERE DEPARTMENTID = E.DEPARTMENTID ) AS DEPARTMENTNAME
     , E.POSITIONID AS POSITIONID
     , ( SELECT POSITIONNAME
         FROM POSITION
         WHERE POSITIONID = E.POSITIONID ) AS POSITIONNAME
     , E.REGIONID AS REGIONID
     , ( SELECT REGIONNAME
         FROM REGION
         WHERE REGIONID = E.REGIONID) AS REGIONNAME
     , E.BASICPAY AS BASICPAY
     , E.EXTRAPAY AS EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
     , E.GRADE AS GRADE
FROM EMPLOYEE E
ORDER BY E.EMPLOYEEID;
--==>> View EMPLOYEEVIEW?��(�?) ?��?��?��?��?��?��?��.


DESC EMPLOYEEVIEW;
/*
?���?             ?��?       ?��?��           
-------------- -------- ------------ 
EMPLOYEEID     NOT NULL NUMBER       
NAME                    VARCHAR2(30) 
SSN                     CHAR(6)      
BIRTHDAY                VARCHAR2(10) 
LUNAR                   NUMBER(1)    
LUNARNAME               VARCHAR2(6)  
TELEPHONE               VARCHAR2(40) 
DEPARTMENTID            NUMBER       
DEPARTMENTNAME          VARCHAR2(30) 
POSITIONID              NUMBER       
POSITIONNAME            VARCHAR2(30) 
REGIONID                NUMBER       
REGIONNAME              VARCHAR2(30) 
BASICPAY                NUMBER       
EXTRAPAY                NUMBER       
PAY                     NUMBER       
GRADE                   NUMBER(1)    
*/


--?�� 직원 ?��?��?�� ?��?�� 쿼리�? 구성(?��?��?�� ?��?��)
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR
                   , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                   , BASICPAY, EXTRAPAY)
VALUES(EMPLOYEESEQ.NEXTVAL,'박정�?','961031',CRYPTPACK.ENCRYPT('1234567','1234567')
     , TO_DATE('1996-10-31','YYYY-MM-DD'),0,'010-4020-7429',1,1,1
     , 1500000,150000); --백오?���?, ?��?���?
--==>> 1 ?�� ?��(�?) ?��?��?��?��?��?��?��.


--?�� ?��?��
SELECT *
FROM EMPLOYEEVIEW;
--==>>
/*
EMPLOYEEID	NAME	SSN	BIRTHDAY	LUNAR	LUNARNAME	TELEPHONE	DEPARTMENTID	DEPARTMENTNAME	POSITIONID	POSITIONNAME	REGIONID	REGIONNAME	BASICPAY	EXTRAPAY	PAY	GRADE
1	?��?���?	971006	1997-10-06	0	?��?��	010-8755-9495	1	개발�?	1	?��?��	1	?��?��	1500000	150000	1650000	0
2	박정�?	961031	1996-10-31	0	?��?��	010-4020-7429	1	개발�?	1	?��?��	1	?��?��	1500000	150000	1650000	1
*/


--?�� 커밋
COMMIT;


--?�� 로그?�� 쿼리�? 구성
--?�� ?���? ?��?�� 로그?��(ID ?�� EMPLOYEEID, PW ?�� SSN2)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('1234567','1234567');
--==>> 박정�? ?�� 로그?�� ?���?

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567','1234567');
--==>> 박정�? ?�� 로그?�� ?���?

--?�� �? 구성
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=2 AND SSN2 = CRYPTPACK.ENCRYPT('1234567','1234567')
;
--==>> 박정�? ?�� 로그?�� ?���?


--?�� �?리자 로그?�� (ID ?�� EMPLOYEEID, PW ?�� SSN2, GRADE = 0)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567','1234567')
  AND GRADE = 0;
--==>> (조회 결과 ?��?��) ?�� �?리자 로그?�� ?��?��

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('2234567','2234567')
  AND GRADE=0;
--==>> ?��?���? ?�� �?리자 로그?�� ?���?

--?�� �? 구성
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=1 AND SSN2 = CRYPTPACK.ENCRYPT('2234567','2234567') AND GRADE=0
;

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('2234567','2234567');
--==>> ?��?���? ?�� ?���? ?��?�� 로그?�� ?���?


--?�� 직원 ?��?��?�� ?��?�� 쿼리�? 구성
DELETE
FROM EMPLOYEE
WHERE EMPLOYEEID=2;

--?�� �? 구성
DELETE FROM EMPLOYEE WHERE EMPLOYEEID=2
;


DESC EMPLOYEE;
/*
?���?           ?��?       ?��?��           
------------ -------- ------------ 
EMPLOYEEID   NOT NULL NUMBER       
NAME                  VARCHAR2(30) 
BIRTHDAY              DATE         
LUNAR                 NUMBER(1)    
TELEPHONE             VARCHAR2(40) 
DEPARTMENTID          NUMBER       
POSITIONID            NUMBER       
REGIONID              NUMBER       
BASICPAY              NUMBER       
EXTRAPAY              NUMBER       
SSN1                  CHAR(6)      
SSN2                  VARCHAR2(50) 
GRADE                 NUMBER(1)
*/

--?�� 직원 ?��?��?�� ?��?�� 쿼리�? 구성
UPDATE EMPLOYEE
SET NAME='?��?���?'
  , BIRTHDAY=TO_DATE('2001-01-01','YYYY-MM-DD')
  , LUNAR=1
  , TELEPHONE='010-1111-1111'
  , DEPARTMENTID=2
  , POSITIONID=2
  , REGIONID=2
  , BASICPAY=2200000    --?��백이?���?
  , EXTRAPAY=220000     --?��?��?���?
  , SSN1='010101'
  , SSN2=CRYPTPACK.ENCRYPT('4234567','4234567')
  , GRADE=1
WHERE EMPLOYEEID=1;
--==>> 1 ?�� ?��(�?) ?��?��?��?��?��?��?��?��?��.

--?�� �? 구성
UPDATE EMPLOYEE SET NAME='?��?���?', BIRTHDAY=TO_DATE('2001-01-01','YYYY-MM-DD'), LUNAR=1, TELEPHONE='010-1111-1111', DEPARTMENTID=2, POSITIONID=2, REGIONID=2, BASICPAY=2200000, EXTRAPAY=220000, SSN1='010101', SSN2=CRYPTPACK.ENCRYPT('4234567','4234567'), GRADE=1 WHERE EMPLOYEEID=1
;


--?�� 롤백
ROLLBACK;
--==>> 롤백 ?���?.


----------------------------------------------------------------------------------------------------


--?�� �?(EMPLOYEEVIEW) 조회�? ?��?�� 리스?�� 출력 쿼리�? 구성
SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, LUNARNAME, TELEPHONE, DEPARTMENTID, DEPARTMENTNAME, POSITIONID, POSITIONNAME, REGIONID, REGIONNAME, BASICPAY, EXTRAPAY, PAY, GRADE FROM EMPLOYEEVIEW ORDER BY EMPLOYEEID
;


--?�� �?(REGIONVIEW) 조회�? ?��?�� 리스?�� 출력 쿼리�? 구성
SELECT REGIONID, REGIONNAME, DELCHECK FROM REGIONVEIW ORDER BY REGIONID
;


--?�� �?(DEPARTMENTVIEW) 조회�? ?��?�� 리스?�� 출력 쿼리�? 구성
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK FROM DEPARTMENTVIEW ORDER BY DEPARTMENTID
;

--?�� �?(POSITIONID) 조회�? ?��?�� 리스?�� 출력 쿼리�? 구성
SELECT POSITIONID, POSITIONNAME, DELCHECK FROM POSITIONVIEW ORDER BY POSITIONID
;

--?�� 직원 ?��?��?���? ?��?��?�� 직원 �??�� 쿼리�? 구성
SELECT EMPLOYEEID, NAME, SSN1, TO_CHAR(BIRTHDAY,'YYYY-MM-DD') AS BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY FROM EMPLOYEE WHERE EMPLOYEEID=1
;


----------------------------------------------------------------------------------------------------


--?�� �?�??�� ?��?��?�� ?��/?��?��?�� ?��?��?���? �?�?
UPDATE EMPLOYEE SET LUNAR=1 WHERE EMPLOYEEID=3
;
--==>> 1 ?�� ?��(�?) ?��?��?��?��?��?��?��?��?��.


--?�� 커밋
COMMIT;
--==>> 커밋 ?���?.

