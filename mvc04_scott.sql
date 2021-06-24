SELECT USER
FROM DUAL;
--==>> SCOTT


--?—‹ ?‹¤?Šµ ?…Œ?´ë¸? ?ƒ?„±(ì§??—­: REGION)
CREATE TABLE REGION
( REGIONID      NUMBER          --ì§??—­ ?•„?´?””(PK)
, REGIONNAME    VARCHAR2(30)    --ì§??—­ ëª?
, CONSTRAINT REGION_ID_PK PRIMARY KEY(REGIONID)
);
--==>> Table REGION?´(ê°?) ?ƒ?„±?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ?‹œ???Š¤ ?ƒ?„±(ì§??—­: REGIONSEQ)
CREATE SEQUENCE REGIONSEQ
NOCACHE;
--==>> Sequence REGIONSEQ?´(ê°?) ?ƒ?„±?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ?°?´?„° ?ž…? ¥(ì§??—­ ?°?´?„° ?ž…? ¥)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '?„œ?š¸');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, 'ê²½ê¸°');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '?¸ì²?');
--==>> 1 ?–‰ ?´(ê°?) ?‚½?ž…?˜?—ˆ?Šµ?‹ˆ?‹¤. *3


--?—‹ ?°?´?„° ?ž…? ¥(ì§??—­ ?°?´?„° ì¶”ê? ?ž…? ¥)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '? œì£?');
--==>> 1 ?–‰ ?´(ê°?) ?‚½?ž…?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ?™•?¸
SELECT REGIONID, REGIONNAME FROM REGION
;
/*
REGIONID	REGIONNAME
1	?„œ?š¸
2	ê²½ê¸°
3	?¸ì²?
4	? œì£?
*/
 
 
--?—‹ ì»¤ë°‹
COMMIT;


--?—‹ ?‹¤?Šµ ?…Œ?´ë¸? ?ƒ?„±(ì§ìœ„: POSITION)
CREATE TABLE POSITION
( POSITIONID    NUMBER          --ì§ìœ„ ?•„?´?””(PK)
, POSITIONNAME  VARCHAR2(30)    --ì§ìœ„ ëª?
, MINBASICPAY   NUMBER          --ìµœì†Œ ê¸°ë³¸ê¸?
, CONSTRAINT POSITION_ID_PK PRIMARY KEY(POSITIONID)
);
--==>> Table POSITION?´(ê°?) ?ƒ?„±?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ?‹œ???Š¤ ?ƒ?„±(ì§ìœ„: POSITIONSEQ)
CREATE SEQUENCE POSITIONSEQ
NOCACHE;
--==>> Sequence POSITIONSEQ?´(ê°?) ?ƒ?„±?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ?°?´?„° ?ž…? ¥(ì§ìœ„ ?°?´?„° ?ž…? ¥)
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '?‚¬?›', 1000000); --ë°±ë§Œ
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '??ë¦?', 2000000); --?´ë°±ë§Œ
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, 'ë¶??ž¥', 3000000); --?‚¼ë°±ë§Œ
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '?ƒë¬?', 4000000); --?‚¬ë°±ë§Œ
--==>> 1 ?–‰ ?´(ê°?) ?‚½?ž…?˜?—ˆ?Šµ?‹ˆ?‹¤. *4


--?—‹ ?™•?¸
SELECT POSITIONID, POSITIONNAME, MINBASICPAY FROM POSITION
;
/*
POSITIONID	POSITIONNAME	MINBASICPAY
1	        ?‚¬?›      	1000000
2	        ??ë¦?	    2000000
3	        ë¶??ž¥	        3000000
4	        ?ƒë¬?      	4000000
*/


--?—‹ ì»¤ë°‹
COMMIT;


--?—‹ ?‹¤?Šµ ?…Œ?´ë¸? ?ƒ?„±(ë¶??„œ: DEPARTMENT)
CREATE TABLE DEPARTMENT
( DEPARTMENTID      NUMBER          --ë¶??„œ ?•„?´?””(PK)
, DEPARTMENTNAME    VARCHAR2(30)    --ë¶??„œ ëª?
, CONSTRAINT DEPARTMENT_ID_PK PRIMARY KEY(DEPARTMENTID)
);
--==>> Table DEPARTMENT?´(ê°?) ?ƒ?„±?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ?‹œ???Š¤ ?ƒ?„±(ë¶??„œ: DEPARTMENTSEQ)
CREATE SEQUENCE DEPARTMENTSEQ
NOCACHE;
--==>> Sequence DEPARTMENTSEQ?´(ê°?) ?ƒ?„±?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ?°?´?„° ?ž…? ¥(ë¶??„œ ?°?´?„° ?ž…? ¥)
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, 'ê°œë°œë¶?');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, 'ë§ˆì??Œ…ë¶?');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '?˜?—…ë¶?');
--==>> 1 ?–‰ ?´(ê°?) ?‚½?ž…?˜?—ˆ?Šµ?‹ˆ?‹¤. *3


--?—‹ ?™•?¸
SELECT DEPARTMENTID, DEPARTMENTNAME FROM DEPARTMENT
;
/*
DEPARTMENTID	DEPARTMENTNAME
1	        ê°œë°œë¶?
2	        ë§ˆì??Œ…ë¶?
3	        ?˜?—…ë¶?
*/


--?—‹ ì»¤ë°‹
COMMIT;
--==>> ì»¤ë°‹ ?™„ë£?.


--?—‹ ?‹¤?Šµ ?…Œ?´ë¸? ?ƒ?„±(ì§ì›: EMPLOYEE)
-- ?‚¬?›ë²ˆí˜¸, ?‚¬?›ëª?, ì£¼ë?¼ë²ˆ?˜¸, ?ƒ?…„?›”?¼, ?–‘?Œ? ¥
--, ? „?™”ë²ˆí˜¸, ë¶??„œ, ì§ìœ„, ì§??—­, ê¸°ë³¸ê¸?, ?ˆ˜?‹¹
CREATE TABLE EMPLOYEE
( EMPLOYEEID    NUMBER                  --?‚¬?›ë²ˆí˜¸(PK)
, NAME          VARCHAR2(30)            --?‚¬?› ëª?
, SSN           VARCHAR2(20)            --ì£¼ë?? ë²ˆí˜¸(?•”?˜¸?™” ê¸°ëŠ¥ ? ?š©!)
, BIRTHDAY      DATE                    --?ƒ?…„?›”?¼
, LUNAR         NUMBER(1) DEFAULT 0     --?–‘?Œ? ¥(?–‘? ¥ 0, ?Œ? ¥ 1)
, TELEPHONE     VARCHAR2(40)            --? „?™” ë²ˆí˜¸
, DEPARTMENTID  NUMBER                  --ë¶??„œ ?•„?´?””
, POSITIONID    NUMBER                  --ì§ìœ„ ?•„?´?””
, REGIONID      NUMBER                  --ì§??—­ ?•„?´?””
, BASICPAY      NUMBER                  --ê¸°ë³¸ê¸?
, EXTRAPAY      NUMBER                  --?ˆ˜?‹¹
, CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY(EMPLOYEEID)
, CONSTRAINT EMPLOYEE_DEPARTEMENTID_FK FOREIGN KEY(DEPARTMENTID)
             REFERENCES DEPARTMENT(DEPARTMENTID)
, CONSTRAINT EMPLOYEE_POSITIONID_FK FOREIGN KEY(POSITIONID)
             REFERENCES POSITION(POSITIONID)
, CONSTRAINT EMPLOYEE_REGIONID_FK FOREIGN KEY(REGIONID)
             REFERENCES REGION(REGIONID)
, CONSTRAINT EMPLOYEE_LUNAR_CK CHECK(LUNAR=0 OR LUNAR=1)
);
--==>> Table EMPLOYEE?´(ê°?) ?ƒ?„±?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ?‹œ???Š¤ ?ƒ?„±(ì§ì›: EMPLOYEESEQ)
CREATE SEQUENCE EMPLOYEESEQ
NOCACHE;
--==>> Sequence EMPLOYEESEQ?´(ê°?) ?ƒ?„±?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ?°?´?„° ?ž…? ¥(ì§ì› ?°?´?„° ?ž…? ¥)
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR
                   , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                   , BASICPAY, EXTRAPAY)
VALUES(EMPLOYEESEQ.NEXTVAL, '?•œ?˜œë¦?', CRYPTPACK.ENCRYPT('9710062234567','9710062234567')
     , TO_DATE('1997-10-06','YYYY-MM-DD'), 0, '010-8755-9495', 1, 1, 1, 1500000, 1500000);
--==>> 1 ?–‰ ?´(ê°?) ?‚½?ž…?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?? ?„¸?…˜ ?„¤? • ë³?ê²?
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session?´(ê°?) ë³?ê²½ë˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ?™•?¸
SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY FROM EMPLOYEE
;
/*
EMPLOYEEID	NAME    	SSN	        BIRTHDAY	    LUNAR	TELEPHONE	    DEPARTMENTID	    POSITIONID	REGIONID	    BASICPAY	    EXTRAPAY
1	        ?•œ?˜œë¦?	"?h????"	1997-10-06	0	    010-8755-9495	1	            1	        1	        1500000	    1500000
*/


--?—‹ ì»¤ë°‹
COMMIT;
--==>> ì»¤ë°‹ ?™„ë£?.


--?—‹ ì§ì› ? •ë³? ì¡°íšŒ ì¿¼ë¦¬ë¬? êµ¬ì„±
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '?–‘? ¥', 1, '?Œ? ¥') AS LUNARNAME
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


--?—‹ ë·? ?ƒ?„±(EMPLOYEEVIEW)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '?–‘? ¥', 1, '?Œ? ¥') AS LUNARNAME
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
--==>> View EMPLOYEEVIEW?´(ê°?) ?ƒ?„±?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ì§??—­ ?°?´?„° ì¡°íšŒ ì¿¼ë¦¬ë¬? êµ¬ì„±(ì§??—­ ?°?´?„° ?‚­? œ ê°??Š¥?—¬ë¶? ?™•?¸)
SELECT R.REGIONID, R.REGIONNAME
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE REGIONID = R.REGIONID ) AS DELCHECK
FROM REGION R;
/*
REGIONID	REGIONNAME	DELCHECK
1	    ?„œ?š¸      	1
2	    ê²½ê¸°	    0
3	    ?¸ì²?  	    0
4	    ? œì£?	    0
*/
--==>> ?Žì„œ?š¸?ì˜ ì§??—­ ?°?´?„°?Š” ?‚­? œê°? ë¶ˆê??Š¥?•œ ?ƒ?™©?´ë©?,
--     ?Žê²½ê¸°ã??, ?Žì¸ì²œã??, ?Žì œì£¼ã?ì˜ ì§??—­ ?°?´?„°?Š” ?‚­? œê°? ê°??Š¥?•œ ?ƒ?™©?ž„?„
--     ?Œë³„í•  ?ˆ˜ ?žˆ?Š” ì¿¼ë¦¬ë¬?


--?—‹ ë·? ?ƒ?„±(REGIONVEIW)
CREATE OR REPLACE VIEW REGIONVEIW
AS
SELECT R.REGIONID, R.REGIONNAME
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE REGIONID = R.REGIONID ) AS DELCHECK
FROM REGION R;
--==>> View REGIONVEIW?´(ê°?) ?ƒ?„±?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ì§ìœ„ ?°?´?„° ì¡°íšŒ ì¿¼ë¦¬ë¬? êµ¬ì„±(ì§ìœ„ ?°?´?„° ?‚­? œ ê°??Š¥?—¬ë¶? ?™•?¸)
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE POSITIONID = P.POSITIONID ) AS DELCHECK
FROM POSITION P;
/*
POSITIONID	POSITIONNAME	MINBASICPAY	DELCHECK
1	        ?‚¬?›	        1000000	    1
2	        ??ë¦?	    2000000	    0
3	        ë¶??ž¥      	3000000	    0
4	        ?ƒë¬?	        4000000	    0
*/


--?—‹ ë·? ?ƒ?„±(POSITIONVIEW)
CREATE OR REPLACE VIEW POSITIONVIEW
AS
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE POSITIONID = P.POSITIONID ) AS DELCHECK
FROM POSITION P;
--==>> View POSITIONVIEW?´(ê°?) ?ƒ?„±?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ë¶??„œ ?°?´?„° ì¡°íšŒ ì¿¼ë¦¬ë¬? êµ¬ì„±(ë¶??„œ ?°?´?„° ?‚­? œ ê°??Š¥?—¬ë¶? ?™•?¸)
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
    , ( SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID = D.DEPARTMENTID ) AS DELCHECK
FROM DEPARTMENT D;
/*
DEPARTMENTID    	DEPARTMENTNAME	DELCHECK
1	            ê°œë°œë¶?	        1
2	            ë§ˆì??Œ…ë¶?	        0
3	            ?˜?—…ë¶?	        0
*/


--?—‹ ë·? ?ƒ?„±(DEPARTMENTVIEW)
CREATE OR REPLACE VIEW DEPARTMENTVIEW
AS
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
    , ( SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID = D.DEPARTMENTID ) AS DELCHECK
FROM DEPARTMENT D;
--==>> View DEPARTMENTVIEW?´(ê°?) ?ƒ?„±?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ì§ìœ„ë³? ìµœì†Œ ê¸°ë³¸ê¸? ê²??ƒ‰ ì¿¼ë¦¬ë¬? êµ¬ì„±
SELECT MINBASICPAY
FROM POSITION
WHERE POSITIONID=1;     --?‚¬?›

--?•œ ì¤? êµ¬ì„±
SELECT MINBASICPAY FROM POSITION WHERE POSITIONID=1
;
--==>> 1000000


--------------------------------------------------------------------------------


--?– ?– ?–  ë¡œê·¸?¸ / ë¡œê·¸?•„?›ƒ ê³¼ì • ì¶”ê?(ë³?ê²?) ?– ?– ?– --

--ID?? PW ì»¬ëŸ¼ ?°?´?„°ë¥? ?‹´ê³? ?žˆ?Š” ?…Œ?´ë¸”ì´ ë³„ë„ë¡? ì¡´ìž¬?•˜ì§? ?•Š?Š” ?ƒ?™©?´?‹¤.
--?´?? ê´?? ¨?•˜?—¬ EMPLOYEEID(?‚¬?› ?•„?´?””)?? SSN(ì£¼ë?¼ë²ˆ?˜¸) ?’·?žë¦?
--7?žë¦? ?ˆ«?žë¥? ?´?š©?•  ?ˆ˜ ?žˆ?„ë¡? êµ¬ì„±?•œ?‹¤.

--?? ê¸°ì¡´ ?…Œ?´ë¸? êµ¬ì¡° ë³?ê²?
--?‘ 
--EMPLOYEE(ì§ì› ?…Œ?´ë¸?)?˜ SSN(ì£¼ë?¼ë²ˆ?˜¸) ì»¬ëŸ¼?„ ë¶„ë¦¬?•œ?‹¤.
--SSN -> SSN1, SSN2
--SSN1: ì£¼ë?¼ë²ˆ?˜¸ ?•ž 6?žë¦?
--SSN2: ì£¼ë?¼ë²ˆ?˜¸ ?’· 7?žë¦? ?†’ ?•”?˜¸?™” ? ?š©

--?‘¡
--EMPLOYEE(ì§ì› ?…Œ?´ë¸?)?— GRADE(?“±ê¸?) ì»¬ëŸ¼?„ ì¶”ê??•œ?‹¤.
--GRADE ?†’ ê´?ë¦¬ìž 0, ?¼ë°˜ì‚¬?› 1


--?—‹ ì»¬ëŸ¼ ë¶„í•  SSN ?†’ SSN1, SSN2

--ì»¬ëŸ¼ ì¶”ê?
ALTER TABLE EMPLOYEE
ADD(SSN1 CHAR(6), SSN2 VARCHAR2(50));
--==>> Table EMPLOYEE?´(ê°?) ë³?ê²½ë˜?—ˆ?Šµ?‹ˆ?‹¤.


SELECT *
FROM EMPLOYEE;


UPDATE EMPLOYEE
SET SSN1=SUBSTR(CRYPTPACK.DECRYPT(SSN,'9710062234567'),1,6)
  , SSN2=CRYPTPACK.ENCRYPT(SUBSTR(CRYPTPACK.DECRYPT(SSN,'9710062234567'),7,7)
                        , SUBSTR(CRYPTPACK.DECRYPT(SSN,'9710062234567'),7,7));
--==>> 1 ?–‰ ?´(ê°?) ?—…?°?´?Š¸?˜?—ˆ?Šµ?‹ˆ?‹¤.


--ê¸°ì¡´ ì£¼ë?¼ë²ˆ?˜¸ ì»¬ëŸ¼(SSN) ? œê±?
ALTER TABLE EMPLOYEE
DROP COLUMN SSN;
--==>> Table EMPLOYEE?´(ê°?) ë³?ê²½ë˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ?™•?¸
SELECT *
FROM EMPLOYEE;
--==>> 1	?•œ?˜œë¦?	1997-10-06	0	010-8755-9495	1	1	1	1500000	1500000	971006	Y{?7?


--?—‹ ì»¬ëŸ¼ ì¶”ê? ?†’ GRADE - ê¸°ë³¸ê°’ì„ 1(?¼ë°? ì§ì›)ë¡? êµ¬ì„±
ALTER TABLE EMPLOYEE
ADD GRADE NUMBER(1) DEFAULT 1;
--==>> Table EMPLOYEE?´(ê°?) ë³?ê²½ë˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ?™•?¸
SELECT *
FROM EMPLOYEE;
--==>> 1	?•œ?˜œë¦?	1997-10-06	0	010-8755-9495	1	1	1	1500000	1500000	971006	Y{?7?	1


--?—‹ ?•œ?˜œë¦? ?‚¬?›?„ ê´?ë¦¬ìžë¡? ?ž„ëª?
UPDATE EMPLOYEE
SET GRADE=0
WHERE EMPLOYEEID=1;
--==>> 1 ?–‰ ?´(ê°?) ?—…?°?´?Š¸?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ?™•?¸
SELECT *
FROM EMPLOYEE;
--==>> 1	?•œ?˜œë¦?	1997-10-06	0	010-8755-9495	1	1	1	1500000	1500000	971006	Y{?7?	0


--?—‹ ì»¤ë°‹
COMMIT;


--?? ?…Œ?´ë¸”ì˜ êµ¬ì¡°ë¥? ë³?ê²½í–ˆê¸? ?•Œë¬¸ì—
--   ?´?? ê´?? ¨?•œ ë·?(VIEW)?˜ ?‚´?š©?„ ?ƒˆë¡? ?ž‘?„±(?ˆ˜? •)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID AS EMPLOYEEID
     , E.NAME AS NAME
     , E.SSN1 AS SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR AS LUNAR
     , DECODE(E.LUNAR, 0, '?–‘? ¥', 1, '?Œ? ¥') AS LUNARNAME
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
--==>> View EMPLOYEEVIEW?´(ê°?) ?ƒ?„±?˜?—ˆ?Šµ?‹ˆ?‹¤.


DESC EMPLOYEEVIEW;
/*
?´ë¦?             ?„?       ?œ ?˜•           
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


--?—‹ ì§ì› ?°?´?„° ?ž…? ¥ ì¿¼ë¦¬ë¬? êµ¬ì„±(?ˆ˜? •?œ ?‚´?š©)
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR
                   , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                   , BASICPAY, EXTRAPAY)
VALUES(EMPLOYEESEQ.NEXTVAL,'ë°•ì •ì¤?','961031',CRYPTPACK.ENCRYPT('1234567','1234567')
     , TO_DATE('1996-10-31','YYYY-MM-DD'),0,'010-4020-7429',1,1,1
     , 1500000,150000); --ë°±ì˜¤?‹­ë§?, ?‹­?˜¤ë§?
--==>> 1 ?–‰ ?´(ê°?) ?‚½?ž…?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ?™•?¸
SELECT *
FROM EMPLOYEEVIEW;
--==>>
/*
EMPLOYEEID	NAME	SSN	BIRTHDAY	LUNAR	LUNARNAME	TELEPHONE	DEPARTMENTID	DEPARTMENTNAME	POSITIONID	POSITIONNAME	REGIONID	REGIONNAME	BASICPAY	EXTRAPAY	PAY	GRADE
1	?•œ?˜œë¦?	971006	1997-10-06	0	?–‘? ¥	010-8755-9495	1	ê°œë°œë¶?	1	?‚¬?›	1	?„œ?š¸	1500000	150000	1650000	0
2	ë°•ì •ì¤?	961031	1996-10-31	0	?–‘? ¥	010-4020-7429	1	ê°œë°œë¶?	1	?‚¬?›	1	?„œ?š¸	1500000	150000	1650000	1
*/


--?—‹ ì»¤ë°‹
COMMIT;


--?—‹ ë¡œê·¸?¸ ì¿¼ë¦¬ë¬? êµ¬ì„±
--?‘  ?¼ë°? ?‚¬?› ë¡œê·¸?¸(ID ?†’ EMPLOYEEID, PW ?†’ SSN2)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('1234567','1234567');
--==>> ë°•ì •ì¤? ?†’ ë¡œê·¸?¸ ?„±ê³?

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567','1234567');
--==>> ë°•ì •ì¤? ?†’ ë¡œê·¸?¸ ?„±ê³?

--?•œ ì¤? êµ¬ì„±
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=2 AND SSN2 = CRYPTPACK.ENCRYPT('1234567','1234567')
;
--==>> ë°•ì •ì¤? ?†’ ë¡œê·¸?¸ ?„±ê³?


--?‘¡ ê´?ë¦¬ìž ë¡œê·¸?¸ (ID ?†’ EMPLOYEEID, PW ?†’ SSN2, GRADE = 0)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567','1234567')
  AND GRADE = 0;
--==>> (ì¡°íšŒ ê²°ê³¼ ?—†?Œ) ?†’ ê´?ë¦¬ìž ë¡œê·¸?¸ ?‹¤?Œ¨

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('2234567','2234567')
  AND GRADE=0;
--==>> ?•œ?˜œë¦? ?†’ ê´?ë¦¬ìž ë¡œê·¸?¸ ?„±ê³?

--?•œ ì¤? êµ¬ì„±
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=1 AND SSN2 = CRYPTPACK.ENCRYPT('2234567','2234567') AND GRADE=0
;

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('2234567','2234567');
--==>> ?•œ?˜œë¦? ?†’ ?¼ë°? ?‚¬?› ë¡œê·¸?¸ ?„±ê³?


--?—‹ ì§ì› ?°?´?„° ?‚­? œ ì¿¼ë¦¬ë¬? êµ¬ì„±
DELETE
FROM EMPLOYEE
WHERE EMPLOYEEID=2;

--?•œ ì¤? êµ¬ì„±
DELETE FROM EMPLOYEE WHERE EMPLOYEEID=2
;


DESC EMPLOYEE;
/*
?´ë¦?           ?„?       ?œ ?˜•           
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

--?—‹ ì§ì› ?°?´?„° ?ˆ˜? • ì¿¼ë¦¬ë¬? êµ¬ì„±
UPDATE EMPLOYEE
SET NAME='?‘?˜œë¦?'
  , BIRTHDAY=TO_DATE('2001-01-01','YYYY-MM-DD')
  , LUNAR=1
  , TELEPHONE='010-1111-1111'
  , DEPARTMENTID=2
  , POSITIONID=2
  , REGIONID=2
  , BASICPAY=2200000    --?´ë°±ì´?‹­ë§?
  , EXTRAPAY=220000     --?´?‹­?´ë§?
  , SSN1='010101'
  , SSN2=CRYPTPACK.ENCRYPT('4234567','4234567')
  , GRADE=1
WHERE EMPLOYEEID=1;
--==>> 1 ?–‰ ?´(ê°?) ?—…?°?´?Š¸?˜?—ˆ?Šµ?‹ˆ?‹¤.

--?•œ ì¤? êµ¬ì„±
UPDATE EMPLOYEE SET NAME='?‘?˜œë¦?', BIRTHDAY=TO_DATE('2001-01-01','YYYY-MM-DD'), LUNAR=1, TELEPHONE='010-1111-1111', DEPARTMENTID=2, POSITIONID=2, REGIONID=2, BASICPAY=2200000, EXTRAPAY=220000, SSN1='010101', SSN2=CRYPTPACK.ENCRYPT('4234567','4234567'), GRADE=1 WHERE EMPLOYEEID=1
;


--?—‹ ë¡¤ë°±
ROLLBACK;
--==>> ë¡¤ë°± ?™„ë£?.


----------------------------------------------------------------------------------------------------


--?—‹ ë·?(EMPLOYEEVIEW) ì¡°íšŒë¥? ?†µ?•œ ë¦¬ìŠ¤?Š¸ ì¶œë ¥ ì¿¼ë¦¬ë¬? êµ¬ì„±
SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, LUNARNAME, TELEPHONE, DEPARTMENTID, DEPARTMENTNAME, POSITIONID, POSITIONNAME, REGIONID, REGIONNAME, BASICPAY, EXTRAPAY, PAY, GRADE FROM EMPLOYEEVIEW ORDER BY EMPLOYEEID
;


--?—‹ ë·?(REGIONVIEW) ì¡°íšŒë¥? ?†µ?•œ ë¦¬ìŠ¤?Š¸ ì¶œë ¥ ì¿¼ë¦¬ë¬? êµ¬ì„±
SELECT REGIONID, REGIONNAME, DELCHECK FROM REGIONVEIW ORDER BY REGIONID
;


--?—‹ ë·?(DEPARTMENTVIEW) ì¡°íšŒë¥? ?†µ?•œ ë¦¬ìŠ¤?Š¸ ì¶œë ¥ ì¿¼ë¦¬ë¬? êµ¬ì„±
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK FROM DEPARTMENTVIEW ORDER BY DEPARTMENTID
;

--?—‹ ë·?(POSITIONID) ì¡°íšŒë¥? ?†µ?•œ ë¦¬ìŠ¤?Š¸ ì¶œë ¥ ì¿¼ë¦¬ë¬? êµ¬ì„±
SELECT POSITIONID, POSITIONNAME, DELCHECK FROM POSITIONVIEW ORDER BY POSITIONID
;

--?—‹ ì§ì› ?•„?´?””ë¥? ?™œ?š©?•œ ì§ì› ê²??ƒ‰ ì¿¼ë¦¬ë¬? êµ¬ì„±
SELECT EMPLOYEEID, NAME, SSN1, TO_CHAR(BIRTHDAY,'YYYY-MM-DD') AS BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY FROM EMPLOYEE WHERE EMPLOYEEID=1
;


----------------------------------------------------------------------------------------------------


--?—‹ ê¹?ê°??˜ ?‚¬?›?˜ ?–‘/?Œ? ¥?„ ?Œ? ¥?œ¼ë¡? ë³?ê²?
UPDATE EMPLOYEE SET LUNAR=1 WHERE EMPLOYEEID=3
;
--==>> 1 ?–‰ ?´(ê°?) ?—…?°?´?Š¸?˜?—ˆ?Šµ?‹ˆ?‹¤.


--?—‹ ì»¤ë°‹
COMMIT;
--==>> ì»¤ë°‹ ?™„ë£?.

