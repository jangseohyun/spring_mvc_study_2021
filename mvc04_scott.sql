SELECT USER
FROM DUAL;
--==>> SCOTT


--? ?€?΅ ??΄λΈ? ??±(μ§??­: REGION)
CREATE TABLE REGION
( REGIONID      NUMBER          --μ§??­ ??΄?(PK)
, REGIONNAME    VARCHAR2(30)    --μ§??­ λͺ?
, CONSTRAINT REGION_ID_PK PRIMARY KEY(REGIONID)
);
--==>> Table REGION?΄(κ°?) ??±???΅??€.


--? ????€ ??±(μ§??­: REGIONSEQ)
CREATE SEQUENCE REGIONSEQ
NOCACHE;
--==>> Sequence REGIONSEQ?΄(κ°?) ??±???΅??€.


--? ?°?΄?° ?? ₯(μ§??­ ?°?΄?° ?? ₯)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '??Έ');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, 'κ²½κΈ°');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '?Έμ²?');
--==>> 1 ? ?΄(κ°?) ?½????΅??€. *3


--? ?°?΄?° ?? ₯(μ§??­ ?°?΄?° μΆκ? ?? ₯)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '? μ£?');
--==>> 1 ? ?΄(κ°?) ?½????΅??€.


--? ??Έ
SELECT REGIONID, REGIONNAME FROM REGION
;
/*
REGIONID	REGIONNAME
1	??Έ
2	κ²½κΈ°
3	?Έμ²?
4	? μ£?
*/
 
 
--? μ»€λ°
COMMIT;


--? ?€?΅ ??΄λΈ? ??±(μ§μ: POSITION)
CREATE TABLE POSITION
( POSITIONID    NUMBER          --μ§μ ??΄?(PK)
, POSITIONNAME  VARCHAR2(30)    --μ§μ λͺ?
, MINBASICPAY   NUMBER          --μ΅μ κΈ°λ³ΈκΈ?
, CONSTRAINT POSITION_ID_PK PRIMARY KEY(POSITIONID)
);
--==>> Table POSITION?΄(κ°?) ??±???΅??€.


--? ????€ ??±(μ§μ: POSITIONSEQ)
CREATE SEQUENCE POSITIONSEQ
NOCACHE;
--==>> Sequence POSITIONSEQ?΄(κ°?) ??±???΅??€.


--? ?°?΄?° ?? ₯(μ§μ ?°?΄?° ?? ₯)
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '?¬?', 1000000); --λ°±λ§
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '??λ¦?', 2000000); --?΄λ°±λ§
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, 'λΆ??₯', 3000000); --?Όλ°±λ§
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '?λ¬?', 4000000); --?¬λ°±λ§
--==>> 1 ? ?΄(κ°?) ?½????΅??€. *4


--? ??Έ
SELECT POSITIONID, POSITIONNAME, MINBASICPAY FROM POSITION
;
/*
POSITIONID	POSITIONNAME	MINBASICPAY
1	        ?¬?      	1000000
2	        ??λ¦?	    2000000
3	        λΆ??₯	        3000000
4	        ?λ¬?      	4000000
*/


--? μ»€λ°
COMMIT;


--? ?€?΅ ??΄λΈ? ??±(λΆ??: DEPARTMENT)
CREATE TABLE DEPARTMENT
( DEPARTMENTID      NUMBER          --λΆ?? ??΄?(PK)
, DEPARTMENTNAME    VARCHAR2(30)    --λΆ?? λͺ?
, CONSTRAINT DEPARTMENT_ID_PK PRIMARY KEY(DEPARTMENTID)
);
--==>> Table DEPARTMENT?΄(κ°?) ??±???΅??€.


--? ????€ ??±(λΆ??: DEPARTMENTSEQ)
CREATE SEQUENCE DEPARTMENTSEQ
NOCACHE;
--==>> Sequence DEPARTMENTSEQ?΄(κ°?) ??±???΅??€.


--? ?°?΄?° ?? ₯(λΆ?? ?°?΄?° ?? ₯)
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, 'κ°λ°λΆ?');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, 'λ§μ??λΆ?');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '??λΆ?');
--==>> 1 ? ?΄(κ°?) ?½????΅??€. *3


--? ??Έ
SELECT DEPARTMENTID, DEPARTMENTNAME FROM DEPARTMENT
;
/*
DEPARTMENTID	DEPARTMENTNAME
1	        κ°λ°λΆ?
2	        λ§μ??λΆ?
3	        ??λΆ?
*/


--? μ»€λ°
COMMIT;
--==>> μ»€λ° ?λ£?.


--? ?€?΅ ??΄λΈ? ??±(μ§μ: EMPLOYEE)
-- ?¬?λ²νΈ, ?¬?λͺ?, μ£Όλ?Όλ²?Έ, ????Ό, ??? ₯
--, ? ?λ²νΈ, λΆ??, μ§μ, μ§??­, κΈ°λ³ΈκΈ?, ??Ή
CREATE TABLE EMPLOYEE
( EMPLOYEEID    NUMBER                  --?¬?λ²νΈ(PK)
, NAME          VARCHAR2(30)            --?¬? λͺ?
, SSN           VARCHAR2(20)            --μ£Όλ?? λ²νΈ(??Έ? κΈ°λ₯ ? ?©!)
, BIRTHDAY      DATE                    --????Ό
, LUNAR         NUMBER(1) DEFAULT 0     --??? ₯(?? ₯ 0, ?? ₯ 1)
, TELEPHONE     VARCHAR2(40)            --? ? λ²νΈ
, DEPARTMENTID  NUMBER                  --λΆ?? ??΄?
, POSITIONID    NUMBER                  --μ§μ ??΄?
, REGIONID      NUMBER                  --μ§??­ ??΄?
, BASICPAY      NUMBER                  --κΈ°λ³ΈκΈ?
, EXTRAPAY      NUMBER                  --??Ή
, CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY(EMPLOYEEID)
, CONSTRAINT EMPLOYEE_DEPARTEMENTID_FK FOREIGN KEY(DEPARTMENTID)
             REFERENCES DEPARTMENT(DEPARTMENTID)
, CONSTRAINT EMPLOYEE_POSITIONID_FK FOREIGN KEY(POSITIONID)
             REFERENCES POSITION(POSITIONID)
, CONSTRAINT EMPLOYEE_REGIONID_FK FOREIGN KEY(REGIONID)
             REFERENCES REGION(REGIONID)
, CONSTRAINT EMPLOYEE_LUNAR_CK CHECK(LUNAR=0 OR LUNAR=1)
);
--==>> Table EMPLOYEE?΄(κ°?) ??±???΅??€.


--? ????€ ??±(μ§μ: EMPLOYEESEQ)
CREATE SEQUENCE EMPLOYEESEQ
NOCACHE;
--==>> Sequence EMPLOYEESEQ?΄(κ°?) ??±???΅??€.


--? ?°?΄?° ?? ₯(μ§μ ?°?΄?° ?? ₯)
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR
                   , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                   , BASICPAY, EXTRAPAY)
VALUES(EMPLOYEESEQ.NEXTVAL, '??λ¦?', CRYPTPACK.ENCRYPT('9710062234567','9710062234567')
     , TO_DATE('1997-10-06','YYYY-MM-DD'), 0, '010-8755-9495', 1, 1, 1, 1500000, 1500000);
--==>> 1 ? ?΄(κ°?) ?½????΅??€.


--?? ?Έ? ?€?  λ³?κ²?
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session?΄(κ°?) λ³?κ²½λ??΅??€.


--? ??Έ
SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY FROM EMPLOYEE
;
/*
EMPLOYEEID	NAME    	SSN	        BIRTHDAY	    LUNAR	TELEPHONE	    DEPARTMENTID	    POSITIONID	REGIONID	    BASICPAY	    EXTRAPAY
1	        ??λ¦?	"?h????"	1997-10-06	0	    010-8755-9495	1	            1	        1	        1500000	    1500000
*/


--? μ»€λ°
COMMIT;
--==>> μ»€λ° ?λ£?.


--? μ§μ ? λ³? μ‘°ν μΏΌλ¦¬λ¬? κ΅¬μ±
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '?? ₯', 1, '?? ₯') AS LUNARNAME
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


--? λ·? ??±(EMPLOYEEVIEW)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '?? ₯', 1, '?? ₯') AS LUNARNAME
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
--==>> View EMPLOYEEVIEW?΄(κ°?) ??±???΅??€.


--? μ§??­ ?°?΄?° μ‘°ν μΏΌλ¦¬λ¬? κ΅¬μ±(μ§??­ ?°?΄?° ?­?  κ°??₯?¬λΆ? ??Έ)
SELECT R.REGIONID, R.REGIONNAME
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE REGIONID = R.REGIONID ) AS DELCHECK
FROM REGION R;
/*
REGIONID	REGIONNAME	DELCHECK
1	    ??Έ      	1
2	    κ²½κΈ°	    0
3	    ?Έμ²?  	    0
4	    ? μ£?	    0
*/
--==>> ?μ?Έ?μ μ§??­ ?°?΄?°? ?­? κ°? λΆκ??₯? ??©?΄λ©?,
--     ?κ²½κΈ°γ??, ?μΈμ²γ??, ?μ μ£Όγ?μ μ§??­ ?°?΄?°? ?­? κ°? κ°??₯? ??©??
--     ?λ³ν  ? ?? μΏΌλ¦¬λ¬?


--? λ·? ??±(REGIONVEIW)
CREATE OR REPLACE VIEW REGIONVEIW
AS
SELECT R.REGIONID, R.REGIONNAME
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE REGIONID = R.REGIONID ) AS DELCHECK
FROM REGION R;
--==>> View REGIONVEIW?΄(κ°?) ??±???΅??€.


--? μ§μ ?°?΄?° μ‘°ν μΏΌλ¦¬λ¬? κ΅¬μ±(μ§μ ?°?΄?° ?­?  κ°??₯?¬λΆ? ??Έ)
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE POSITIONID = P.POSITIONID ) AS DELCHECK
FROM POSITION P;
/*
POSITIONID	POSITIONNAME	MINBASICPAY	DELCHECK
1	        ?¬?	        1000000	    1
2	        ??λ¦?	    2000000	    0
3	        λΆ??₯      	3000000	    0
4	        ?λ¬?	        4000000	    0
*/


--? λ·? ??±(POSITIONVIEW)
CREATE OR REPLACE VIEW POSITIONVIEW
AS
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE POSITIONID = P.POSITIONID ) AS DELCHECK
FROM POSITION P;
--==>> View POSITIONVIEW?΄(κ°?) ??±???΅??€.


--? λΆ?? ?°?΄?° μ‘°ν μΏΌλ¦¬λ¬? κ΅¬μ±(λΆ?? ?°?΄?° ?­?  κ°??₯?¬λΆ? ??Έ)
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
    , ( SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID = D.DEPARTMENTID ) AS DELCHECK
FROM DEPARTMENT D;
/*
DEPARTMENTID    	DEPARTMENTNAME	DELCHECK
1	            κ°λ°λΆ?	        1
2	            λ§μ??λΆ?	        0
3	            ??λΆ?	        0
*/


--? λ·? ??±(DEPARTMENTVIEW)
CREATE OR REPLACE VIEW DEPARTMENTVIEW
AS
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
    , ( SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID = D.DEPARTMENTID ) AS DELCHECK
FROM DEPARTMENT D;
--==>> View DEPARTMENTVIEW?΄(κ°?) ??±???΅??€.


--? μ§μλ³? μ΅μ κΈ°λ³ΈκΈ? κ²?? μΏΌλ¦¬λ¬? κ΅¬μ±
SELECT MINBASICPAY
FROM POSITION
WHERE POSITIONID=1;     --?¬?

--? μ€? κ΅¬μ±
SELECT MINBASICPAY FROM POSITION WHERE POSITIONID=1
;
--==>> 1000000


--------------------------------------------------------------------------------


--? ? ?  λ‘κ·Έ?Έ / λ‘κ·Έ?? κ³Όμ  μΆκ?(λ³?κ²?) ? ? ? --

--ID?? PW μ»¬λΌ ?°?΄?°λ₯? ?΄κ³? ?? ??΄λΈμ΄ λ³λλ‘? μ‘΄μ¬?μ§? ?? ??©?΄?€.
--?΄?? κ΄?? ¨??¬ EMPLOYEEID(?¬? ??΄?)?? SSN(μ£Όλ?Όλ²?Έ) ?·?λ¦?
--7?λ¦? ?«?λ₯? ?΄?©?  ? ??λ‘? κ΅¬μ±??€.

--?? κΈ°μ‘΄ ??΄λΈ? κ΅¬μ‘° λ³?κ²?
--? 
--EMPLOYEE(μ§μ ??΄λΈ?)? SSN(μ£Όλ?Όλ²?Έ) μ»¬λΌ? λΆλ¦¬??€.
--SSN -> SSN1, SSN2
--SSN1: μ£Όλ?Όλ²?Έ ? 6?λ¦?
--SSN2: μ£Όλ?Όλ²?Έ ?· 7?λ¦? ? ??Έ? ? ?©

--?‘
--EMPLOYEE(μ§μ ??΄λΈ?)? GRADE(?±κΈ?) μ»¬λΌ? μΆκ???€.
--GRADE ? κ΄?λ¦¬μ 0, ?Όλ°μ¬? 1


--? μ»¬λΌ λΆν  SSN ? SSN1, SSN2

--μ»¬λΌ μΆκ?
ALTER TABLE EMPLOYEE
ADD(SSN1 CHAR(6), SSN2 VARCHAR2(50));
--==>> Table EMPLOYEE?΄(κ°?) λ³?κ²½λ??΅??€.


SELECT *
FROM EMPLOYEE;


UPDATE EMPLOYEE
SET SSN1=SUBSTR(CRYPTPACK.DECRYPT(SSN,'9710062234567'),1,6)
  , SSN2=CRYPTPACK.ENCRYPT(SUBSTR(CRYPTPACK.DECRYPT(SSN,'9710062234567'),7,7)
                        , SUBSTR(CRYPTPACK.DECRYPT(SSN,'9710062234567'),7,7));
--==>> 1 ? ?΄(κ°?) ??°?΄?Έ???΅??€.


--κΈ°μ‘΄ μ£Όλ?Όλ²?Έ μ»¬λΌ(SSN) ? κ±?
ALTER TABLE EMPLOYEE
DROP COLUMN SSN;
--==>> Table EMPLOYEE?΄(κ°?) λ³?κ²½λ??΅??€.


--? ??Έ
SELECT *
FROM EMPLOYEE;
--==>> 1	??λ¦?	1997-10-06	0	010-8755-9495	1	1	1	1500000	1500000	971006	Y{?7?


--? μ»¬λΌ μΆκ? ? GRADE - κΈ°λ³Έκ°μ 1(?Όλ°? μ§μ)λ‘? κ΅¬μ±
ALTER TABLE EMPLOYEE
ADD GRADE NUMBER(1) DEFAULT 1;
--==>> Table EMPLOYEE?΄(κ°?) λ³?κ²½λ??΅??€.


--? ??Έ
SELECT *
FROM EMPLOYEE;
--==>> 1	??λ¦?	1997-10-06	0	010-8755-9495	1	1	1	1500000	1500000	971006	Y{?7?	1


--? ??λ¦? ?¬?? κ΄?λ¦¬μλ‘? ?λͺ?
UPDATE EMPLOYEE
SET GRADE=0
WHERE EMPLOYEEID=1;
--==>> 1 ? ?΄(κ°?) ??°?΄?Έ???΅??€.


--? ??Έ
SELECT *
FROM EMPLOYEE;
--==>> 1	??λ¦?	1997-10-06	0	010-8755-9495	1	1	1	1500000	1500000	971006	Y{?7?	0


--? μ»€λ°
COMMIT;


--?? ??΄λΈμ κ΅¬μ‘°λ₯? λ³?κ²½νκΈ? ?λ¬Έμ
--   ?΄?? κ΄?? ¨? λ·?(VIEW)? ?΄?©? ?λ‘? ??±(?? )
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID AS EMPLOYEEID
     , E.NAME AS NAME
     , E.SSN1 AS SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR AS LUNAR
     , DECODE(E.LUNAR, 0, '?? ₯', 1, '?? ₯') AS LUNARNAME
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
--==>> View EMPLOYEEVIEW?΄(κ°?) ??±???΅??€.


DESC EMPLOYEEVIEW;
/*
?΄λ¦?             ??       ? ?           
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


--? μ§μ ?°?΄?° ?? ₯ μΏΌλ¦¬λ¬? κ΅¬μ±(?? ? ?΄?©)
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR
                   , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                   , BASICPAY, EXTRAPAY)
VALUES(EMPLOYEESEQ.NEXTVAL,'λ°μ μ€?','961031',CRYPTPACK.ENCRYPT('1234567','1234567')
     , TO_DATE('1996-10-31','YYYY-MM-DD'),0,'010-4020-7429',1,1,1
     , 1500000,150000); --λ°±μ€?­λ§?, ?­?€λ§?
--==>> 1 ? ?΄(κ°?) ?½????΅??€.


--? ??Έ
SELECT *
FROM EMPLOYEEVIEW;
--==>>
/*
EMPLOYEEID	NAME	SSN	BIRTHDAY	LUNAR	LUNARNAME	TELEPHONE	DEPARTMENTID	DEPARTMENTNAME	POSITIONID	POSITIONNAME	REGIONID	REGIONNAME	BASICPAY	EXTRAPAY	PAY	GRADE
1	??λ¦?	971006	1997-10-06	0	?? ₯	010-8755-9495	1	κ°λ°λΆ?	1	?¬?	1	??Έ	1500000	150000	1650000	0
2	λ°μ μ€?	961031	1996-10-31	0	?? ₯	010-4020-7429	1	κ°λ°λΆ?	1	?¬?	1	??Έ	1500000	150000	1650000	1
*/


--? μ»€λ°
COMMIT;


--? λ‘κ·Έ?Έ μΏΌλ¦¬λ¬? κ΅¬μ±
--?  ?Όλ°? ?¬? λ‘κ·Έ?Έ(ID ? EMPLOYEEID, PW ? SSN2)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('1234567','1234567');
--==>> λ°μ μ€? ? λ‘κ·Έ?Έ ?±κ³?

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567','1234567');
--==>> λ°μ μ€? ? λ‘κ·Έ?Έ ?±κ³?

--? μ€? κ΅¬μ±
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=2 AND SSN2 = CRYPTPACK.ENCRYPT('1234567','1234567')
;
--==>> λ°μ μ€? ? λ‘κ·Έ?Έ ?±κ³?


--?‘ κ΄?λ¦¬μ λ‘κ·Έ?Έ (ID ? EMPLOYEEID, PW ? SSN2, GRADE = 0)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567','1234567')
  AND GRADE = 0;
--==>> (μ‘°ν κ²°κ³Ό ??) ? κ΄?λ¦¬μ λ‘κ·Έ?Έ ?€?¨

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('2234567','2234567')
  AND GRADE=0;
--==>> ??λ¦? ? κ΄?λ¦¬μ λ‘κ·Έ?Έ ?±κ³?

--? μ€? κ΅¬μ±
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=1 AND SSN2 = CRYPTPACK.ENCRYPT('2234567','2234567') AND GRADE=0
;

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('2234567','2234567');
--==>> ??λ¦? ? ?Όλ°? ?¬? λ‘κ·Έ?Έ ?±κ³?


--? μ§μ ?°?΄?° ?­?  μΏΌλ¦¬λ¬? κ΅¬μ±
DELETE
FROM EMPLOYEE
WHERE EMPLOYEEID=2;

--? μ€? κ΅¬μ±
DELETE FROM EMPLOYEE WHERE EMPLOYEEID=2
;


DESC EMPLOYEE;
/*
?΄λ¦?           ??       ? ?           
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

--? μ§μ ?°?΄?° ??  μΏΌλ¦¬λ¬? κ΅¬μ±
UPDATE EMPLOYEE
SET NAME='??λ¦?'
  , BIRTHDAY=TO_DATE('2001-01-01','YYYY-MM-DD')
  , LUNAR=1
  , TELEPHONE='010-1111-1111'
  , DEPARTMENTID=2
  , POSITIONID=2
  , REGIONID=2
  , BASICPAY=2200000    --?΄λ°±μ΄?­λ§?
  , EXTRAPAY=220000     --?΄?­?΄λ§?
  , SSN1='010101'
  , SSN2=CRYPTPACK.ENCRYPT('4234567','4234567')
  , GRADE=1
WHERE EMPLOYEEID=1;
--==>> 1 ? ?΄(κ°?) ??°?΄?Έ???΅??€.

--? μ€? κ΅¬μ±
UPDATE EMPLOYEE SET NAME='??λ¦?', BIRTHDAY=TO_DATE('2001-01-01','YYYY-MM-DD'), LUNAR=1, TELEPHONE='010-1111-1111', DEPARTMENTID=2, POSITIONID=2, REGIONID=2, BASICPAY=2200000, EXTRAPAY=220000, SSN1='010101', SSN2=CRYPTPACK.ENCRYPT('4234567','4234567'), GRADE=1 WHERE EMPLOYEEID=1
;


--? λ‘€λ°±
ROLLBACK;
--==>> λ‘€λ°± ?λ£?.


----------------------------------------------------------------------------------------------------


--? λ·?(EMPLOYEEVIEW) μ‘°νλ₯? ?΅? λ¦¬μ€?Έ μΆλ ₯ μΏΌλ¦¬λ¬? κ΅¬μ±
SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, LUNARNAME, TELEPHONE, DEPARTMENTID, DEPARTMENTNAME, POSITIONID, POSITIONNAME, REGIONID, REGIONNAME, BASICPAY, EXTRAPAY, PAY, GRADE FROM EMPLOYEEVIEW ORDER BY EMPLOYEEID
;


--? λ·?(REGIONVIEW) μ‘°νλ₯? ?΅? λ¦¬μ€?Έ μΆλ ₯ μΏΌλ¦¬λ¬? κ΅¬μ±
SELECT REGIONID, REGIONNAME, DELCHECK FROM REGIONVEIW ORDER BY REGIONID
;


--? λ·?(DEPARTMENTVIEW) μ‘°νλ₯? ?΅? λ¦¬μ€?Έ μΆλ ₯ μΏΌλ¦¬λ¬? κ΅¬μ±
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK FROM DEPARTMENTVIEW ORDER BY DEPARTMENTID
;

--? λ·?(POSITIONID) μ‘°νλ₯? ?΅? λ¦¬μ€?Έ μΆλ ₯ μΏΌλ¦¬λ¬? κ΅¬μ±
SELECT POSITIONID, POSITIONNAME, DELCHECK FROM POSITIONVIEW ORDER BY POSITIONID
;

--? μ§μ ??΄?λ₯? ??©? μ§μ κ²?? μΏΌλ¦¬λ¬? κ΅¬μ±
SELECT EMPLOYEEID, NAME, SSN1, TO_CHAR(BIRTHDAY,'YYYY-MM-DD') AS BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY FROM EMPLOYEE WHERE EMPLOYEEID=1
;


----------------------------------------------------------------------------------------------------


--? κΉ?κ°?? ?¬?? ?/?? ₯? ?? ₯?Όλ‘? λ³?κ²?
UPDATE EMPLOYEE SET LUNAR=1 WHERE EMPLOYEEID=3
;
--==>> 1 ? ?΄(κ°?) ??°?΄?Έ???΅??€.


--? μ»€λ°
COMMIT;
--==>> μ»€λ° ?λ£?.

