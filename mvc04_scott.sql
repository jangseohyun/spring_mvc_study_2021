SELECT USER
FROM DUAL;
--==>> SCOTT


--�� �ǽ� ���̺� ����(����: REGION)
CREATE TABLE REGION
( REGIONID      NUMBER          --���� ���̵�(PK)
, REGIONNAME    VARCHAR2(30)    --���� ��
, CONSTRAINT REGION_ID_PK PRIMARY KEY(REGIONID)
);
--==>> Table REGION��(��) �����Ǿ����ϴ�.


--�� ������ ����(����: REGIONSEQ)
CREATE SEQUENCE REGIONSEQ
NOCACHE;
--==>> Sequence REGIONSEQ��(��) �����Ǿ����ϴ�.


--�� ������ �Է�(���� ������ �Է�)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '���');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '��õ');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *3


--�� ������ �Է�(���� ������ �߰� �Է�)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT REGIONID, REGIONNAME FROM REGION
;
/*
REGIONID	REGIONNAME
1	����
2	���
3	��õ
4	����
*/
 
 
--�� Ŀ��
COMMIT;


--�� �ǽ� ���̺� ����(����: POSITION)
CREATE TABLE POSITION
( POSITIONID    NUMBER          --���� ���̵�(PK)
, POSITIONNAME  VARCHAR2(30)    --���� ��
, MINBASICPAY   NUMBER          --�ּ� �⺻��
, CONSTRAINT POSITION_ID_PK PRIMARY KEY(POSITIONID)
);
--==>> Table POSITION��(��) �����Ǿ����ϴ�.


--�� ������ ����(����: POSITIONSEQ)
CREATE SEQUENCE POSITIONSEQ
NOCACHE;
--==>> Sequence POSITIONSEQ��(��) �����Ǿ����ϴ�.


--�� ������ �Է�(���� ������ �Է�)
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '���', 1000000); --�鸸
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '�븮', 2000000); --�̹鸸
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '����', 3000000); --��鸸
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '��', 4000000); --��鸸
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *4


--�� Ȯ��
SELECT POSITIONID, POSITIONNAME, MINBASICPAY FROM POSITION
;
/*
POSITIONID	POSITIONNAME	MINBASICPAY
1	        ���      	1000000
2	        �븮	    2000000
3	        ����	        3000000
4	        ��      	4000000
*/


--�� Ŀ��
COMMIT;


--�� �ǽ� ���̺� ����(�μ�: DEPARTMENT)
CREATE TABLE DEPARTMENT
( DEPARTMENTID      NUMBER          --�μ� ���̵�(PK)
, DEPARTMENTNAME    VARCHAR2(30)    --�μ� ��
, CONSTRAINT DEPARTMENT_ID_PK PRIMARY KEY(DEPARTMENTID)
);
--==>> Table DEPARTMENT��(��) �����Ǿ����ϴ�.


--�� ������ ����(�μ�: DEPARTMENTSEQ)
CREATE SEQUENCE DEPARTMENTSEQ
NOCACHE;
--==>> Sequence DEPARTMENTSEQ��(��) �����Ǿ����ϴ�.


--�� ������ �Է�(�μ� ������ �Է�)
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '���ߺ�');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '�����ú�');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '������');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *3


--�� Ȯ��
SELECT DEPARTMENTID, DEPARTMENTNAME FROM DEPARTMENT
;
/*
DEPARTMENTID	DEPARTMENTNAME
1	        ���ߺ�
2	        �����ú�
3	        ������
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �ǽ� ���̺� ����(����: EMPLOYEE)
-- �����ȣ, �����, �ֹι�ȣ, �������, ������
--, ��ȭ��ȣ, �μ�, ����, ����, �⺻��, ����
CREATE TABLE EMPLOYEE
( EMPLOYEEID    NUMBER                  --�����ȣ(PK)
, NAME          VARCHAR2(30)            --��� ��
, SSN           VARCHAR2(20)            --�ֹ� ��ȣ(��ȣȭ ��� ����!)
, BIRTHDAY      DATE                    --�������
, LUNAR         NUMBER(1) DEFAULT 0     --������(��� 0, ���� 1)
, TELEPHONE     VARCHAR2(40)            --��ȭ ��ȣ
, DEPARTMENTID  NUMBER                  --�μ� ���̵�
, POSITIONID    NUMBER                  --���� ���̵�
, REGIONID      NUMBER                  --���� ���̵�
, BASICPAY      NUMBER                  --�⺻��
, EXTRAPAY      NUMBER                  --����
, CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY(EMPLOYEEID)
, CONSTRAINT EMPLOYEE_DEPARTEMENTID_FK FOREIGN KEY(DEPARTMENTID)
             REFERENCES DEPARTMENT(DEPARTMENTID)
, CONSTRAINT EMPLOYEE_POSITIONID_FK FOREIGN KEY(POSITIONID)
             REFERENCES POSITION(POSITIONID)
, CONSTRAINT EMPLOYEE_REGIONID_FK FOREIGN KEY(REGIONID)
             REFERENCES REGION(REGIONID)
, CONSTRAINT EMPLOYEE_LUNAR_CK CHECK(LUNAR=0 OR LUNAR=1)
);
--==>> Table EMPLOYEE��(��) �����Ǿ����ϴ�.


--�� ������ ����(����: EMPLOYEESEQ)
CREATE SEQUENCE EMPLOYEESEQ
NOCACHE;
--==>> Sequence EMPLOYEESEQ��(��) �����Ǿ����ϴ�.


--�� ������ �Է�(���� ������ �Է�)
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR
                   , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                   , BASICPAY, EXTRAPAY)
VALUES(EMPLOYEESEQ.NEXTVAL, '������', CRYPTPACK.ENCRYPT('9710062234567','9710062234567')
     , TO_DATE('1997-10-06','YYYY-MM-DD'), 0, '010-8755-9495', 1, 1, 1, 1500000, 1500000);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� Ȯ��
SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY FROM EMPLOYEE
;
/*
EMPLOYEEID	NAME    	SSN	        BIRTHDAY	    LUNAR	TELEPHONE	    DEPARTMENTID	    POSITIONID	REGIONID	    BASICPAY	    EXTRAPAY
1	        ������	"?h????"	1997-10-06	0	    010-8755-9495	1	            1	        1	        1500000	    1500000
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� ���� ���� ��ȸ ������ ����
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '���', 1, '����') AS LUNARNAME
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


--�� �� ����(EMPLOYEEVIEW)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '���', 1, '����') AS LUNARNAME
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
--==>> View EMPLOYEEVIEW��(��) �����Ǿ����ϴ�.


--�� ���� ������ ��ȸ ������ ����(���� ������ ���� ���ɿ��� Ȯ��)
SELECT R.REGIONID, R.REGIONNAME
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE REGIONID = R.REGIONID ) AS DELCHECK
FROM REGION R;
/*
REGIONID	REGIONNAME	DELCHECK
1	    ����      	1
2	    ���	    0
3	    ��õ  	    0
4	    ����	    0
*/
--==>> ������� ���� �����ʹ� ������ �Ұ����� ��Ȳ�̸�,
--     ����⡻, ����õ��, �����֡��� ���� �����ʹ� ������ ������ ��Ȳ����
--     �Ǻ��� �� �ִ� ������


--�� �� ����(REGIONVEIW)
CREATE OR REPLACE VIEW REGIONVEIW
AS
SELECT R.REGIONID, R.REGIONNAME
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE REGIONID = R.REGIONID ) AS DELCHECK
FROM REGION R;
--==>> View REGIONVEIW��(��) �����Ǿ����ϴ�.


--�� ���� ������ ��ȸ ������ ����(���� ������ ���� ���ɿ��� Ȯ��)
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE POSITIONID = P.POSITIONID ) AS DELCHECK
FROM POSITION P;
/*
POSITIONID	POSITIONNAME	MINBASICPAY	DELCHECK
1	        ���	        1000000	    1
2	        �븮	    2000000	    0
3	        ����      	3000000	    0
4	        ��	        4000000	    0
*/


--�� �� ����(POSITIONVIEW)
CREATE OR REPLACE VIEW POSITIONVIEW
AS
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , ( SELECT COUNT(*)
         FROM EMPLOYEE
         WHERE POSITIONID = P.POSITIONID ) AS DELCHECK
FROM POSITION P;
--==>> View POSITIONVIEW��(��) �����Ǿ����ϴ�.


--�� �μ� ������ ��ȸ ������ ����(�μ� ������ ���� ���ɿ��� Ȯ��)
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
    , ( SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID = D.DEPARTMENTID ) AS DELCHECK
FROM DEPARTMENT D;
/*
DEPARTMENTID    	DEPARTMENTNAME	DELCHECK
1	            ���ߺ�	        1
2	            �����ú�	        0
3	            ������	        0
*/


--�� �� ����(DEPARTMENTVIEW)
CREATE OR REPLACE VIEW DEPARTMENTVIEW
AS
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
    , ( SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID = D.DEPARTMENTID ) AS DELCHECK
FROM DEPARTMENT D;
--==>> View DEPARTMENTVIEW��(��) �����Ǿ����ϴ�.


--�� ������ �ּ� �⺻�� �˻� ������ ����
SELECT MINBASICPAY
FROM POSITION
WHERE POSITIONID=1;     --���

--�� �� ����
SELECT MINBASICPAY FROM POSITION WHERE POSITIONID=1
;
--==>> 1000000


--------------------------------------------------------------------------------


--���� �α��� / �α׾ƿ� ���� �߰�(����) ����--

--ID�� PW �÷� �����͸� ��� �ִ� ���̺��� ������ �������� �ʴ� ��Ȳ�̴�.
--�̿� �����Ͽ� EMPLOYEEID(��� ���̵�)�� SSN(�ֹι�ȣ) ���ڸ�
--7�ڸ� ���ڸ� �̿��� �� �ֵ��� �����Ѵ�.

--�� ���� ���̺� ���� ����
--��
--EMPLOYEE(���� ���̺�)�� SSN(�ֹι�ȣ) �÷��� �и��Ѵ�.
--SSN -> SSN1, SSN2
--SSN1: �ֹι�ȣ �� 6�ڸ�
--SSN2: �ֹι�ȣ �� 7�ڸ� �� ��ȣȭ ����

--��
--EMPLOYEE(���� ���̺�)�� GRADE(���) �÷��� �߰��Ѵ�.
--GRADE �� ������ 0, �Ϲݻ�� 1


--�� �÷� ���� SSN �� SSN1, SSN2

--�÷� �߰�
ALTER TABLE EMPLOYEE
ADD(SSN1 CHAR(6), SSN2 VARCHAR2(50));
--==>> Table EMPLOYEE��(��) ����Ǿ����ϴ�.


SELECT *
FROM EMPLOYEE;


UPDATE EMPLOYEE
SET SSN1=SUBSTR(CRYPTPACK.DECRYPT(SSN,'9710062234567'),1,6)
  , SSN2=CRYPTPACK.ENCRYPT(SUBSTR(CRYPTPACK.DECRYPT(SSN,'9710062234567'),7,7)
                        , SUBSTR(CRYPTPACK.DECRYPT(SSN,'9710062234567'),7,7));
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.


--���� �ֹι�ȣ �÷�(SSN) ����
ALTER TABLE EMPLOYEE
DROP COLUMN SSN;
--==>> Table EMPLOYEE��(��) ����Ǿ����ϴ�.


--�� Ȯ��
SELECT *
FROM EMPLOYEE;
--==>> 1	������	1997-10-06	0	010-8755-9495	1	1	1	1500000	1500000	971006	Y{?7?


--�� �÷� �߰� �� GRADE - �⺻���� 1(�Ϲ� ����)�� ����
ALTER TABLE EMPLOYEE
ADD GRADE NUMBER(1) DEFAULT 1;
--==>> Table EMPLOYEE��(��) ����Ǿ����ϴ�.


--�� Ȯ��
SELECT *
FROM EMPLOYEE;
--==>> 1	������	1997-10-06	0	010-8755-9495	1	1	1	1500000	1500000	971006	Y{?7?	1


--�� ������ ����� �����ڷ� �Ӹ�
UPDATE EMPLOYEE
SET GRADE=0
WHERE EMPLOYEEID=1;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.


--�� Ȯ��
SELECT *
FROM EMPLOYEE;
--==>> 1	������	1997-10-06	0	010-8755-9495	1	1	1	1500000	1500000	971006	Y{?7?	0


--�� Ŀ��
COMMIT;


--�� ���̺��� ������ �����߱� ������
--   �̿� ������ ��(VIEW)�� ������ ���� �ۼ�(����)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID AS EMPLOYEEID
     , E.NAME AS NAME
     , E.SSN1 AS SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR AS LUNAR
     , DECODE(E.LUNAR, 0, '���', 1, '����') AS LUNARNAME
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
--==>> View EMPLOYEEVIEW��(��) �����Ǿ����ϴ�.


DESC EMPLOYEEVIEW;
/*
�̸�             ��?       ����           
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


--�� ���� ������ �Է� ������ ����(������ ����)
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR
                   , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                   , BASICPAY, EXTRAPAY)
VALUES(EMPLOYEESEQ.NEXTVAL,'������','961031',CRYPTPACK.ENCRYPT('1234567','1234567')
     , TO_DATE('1996-10-31','YYYY-MM-DD'),0,'010-4020-7429',1,1,1
     , 1500000,150000); --����ʸ�, �ʿ���
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT *
FROM EMPLOYEEVIEW;
--==>>
/*
EMPLOYEEID	NAME	SSN	BIRTHDAY	LUNAR	LUNARNAME	TELEPHONE	DEPARTMENTID	DEPARTMENTNAME	POSITIONID	POSITIONNAME	REGIONID	REGIONNAME	BASICPAY	EXTRAPAY	PAY	GRADE
1	������	971006	1997-10-06	0	���	010-8755-9495	1	���ߺ�	1	���	1	����	1500000	150000	1650000	0
2	������	961031	1996-10-31	0	���	010-4020-7429	1	���ߺ�	1	���	1	����	1500000	150000	1650000	1
*/


--�� Ŀ��
COMMIT;


--�� �α��� ������ ����
--�� �Ϲ� ��� �α���(ID �� EMPLOYEEID, PW �� SSN2)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('1234567','1234567');
--==>> ������ �� �α��� ����

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567','1234567');
--==>> ������ �� �α��� ����

--�� �� ����
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=2 AND SSN2 = CRYPTPACK.ENCRYPT('1234567','1234567')
;
--==>> ������ �� �α��� ����


--�� ������ �α��� (ID �� EMPLOYEEID, PW �� SSN2, GRADE = 0)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567','1234567')
  AND GRADE = 0;
--==>> (��ȸ ��� ����) �� ������ �α��� ����

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('2234567','2234567')
  AND GRADE=0;
--==>> ������ �� ������ �α��� ����

--�� �� ����
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=1 AND SSN2 = CRYPTPACK.ENCRYPT('2234567','2234567') AND GRADE=0
;

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('2234567','2234567');
--==>> ������ �� �Ϲ� ��� �α��� ����


--�� ���� ������ ���� ������ ����
DELETE
FROM EMPLOYEE
WHERE EMPLOYEEID=2;

--�� �� ����
DELETE FROM EMPLOYEE WHERE EMPLOYEEID=2
;


DESC EMPLOYEE;
/*
�̸�           ��?       ����           
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

--�� ���� ������ ���� ������ ����
UPDATE EMPLOYEE
SET NAME='������'
  , BIRTHDAY=TO_DATE('2001-01-01','YYYY-MM-DD')
  , LUNAR=1
  , TELEPHONE='010-1111-1111'
  , DEPARTMENTID=2
  , POSITIONID=2
  , REGIONID=2
  , BASICPAY=2200000    --�̹��̽ʸ�
  , EXTRAPAY=220000     --�̽��̸�
  , SSN1='010101'
  , SSN2=CRYPTPACK.ENCRYPT('4234567','4234567')
  , GRADE=1
WHERE EMPLOYEEID=1;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

--�� �� ����
UPDATE EMPLOYEE SET NAME='������', BIRTHDAY=TO_DATE('2001-01-01','YYYY-MM-DD'), LUNAR=1, TELEPHONE='010-1111-1111', DEPARTMENTID=2, POSITIONID=2, REGIONID=2, BASICPAY=2200000, EXTRAPAY=220000, SSN1='010101', SSN2=CRYPTPACK.ENCRYPT('4234567','4234567'), GRADE=1 WHERE EMPLOYEEID=1
;


--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


----------------------------------------------------------------------------------------------------


--�� ��(EMPLOYEEVIEW) ��ȸ�� ���� ����Ʈ ��� ������ ����
SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, LUNARNAME, TELEPHONE, DEPARTMENTID, DEPARTMENTNAME, POSITIONID, POSITIONNAME, REGIONID, REGIONNAME, BASICPAY, EXTRAPAY, PAY, GRADE FROM EMPLOYEEVIEW ORDER BY EMPLOYEEID
;


--�� ��(REGIONVIEW) ��ȸ�� ���� ����Ʈ ��� ������ ����
SELECT REGIONID, REGIONNAME, DELCHECK FROM REGIONVEIW ORDER BY REGIONID
;


--�� ��(DEPARTMENTVIEW) ��ȸ�� ���� ����Ʈ ��� ������ ����
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK FROM DEPARTMENTVIEW ORDER BY DEPARTMENTID
;

--�� ��(POSITIONID) ��ȸ�� ���� ����Ʈ ��� ������ ����
SELECT POSITIONID, POSITIONNAME, DELCHECK FROM POSITIONVIEW ORDER BY POSITIONID
;

--�� ���� ���̵� Ȱ���� ���� �˻� ������ ����
SELECT EMPLOYEEID, NAME, SSN1, TO_CHAR(BIRTHDAY,'YYYY-MM-DD') AS BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY FROM EMPLOYEE WHERE EMPLOYEEID=1
;