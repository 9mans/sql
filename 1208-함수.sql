
-- ROWID = �������� ���� ������ġ ������ġ �����ġ ����ġ
SELECT ROWID, DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS;

/*
    ���� �Լ�
        
        lower(�÷� Ȥ�� ǥ����) : �ҹ��ڷ� ��ȯ�� ���� ��ȯ
        upper(�÷� Ȥ�� ǥ����) : �빮�ڷ� ��ȯ�� ���� ��ȯ
        
        CONCAT(�÷� Ȥ�� ǥ����, �÷� Ȥ�� ǥ����) : �� ���ڿ��� �����ؼ� ��ȯ�Ѵ�
        
        LENGTH(�÷� Ȥ�� ǥ����) : ���ڿ��� ���̸� ��ȯ
        
        SUBSTR(�÷� Ȥ�� ǥ����, ������ġ, ����) : ���ڿ��� ������ġ���� ���̸�ŭ �߶� ��ȯ�Ѵ�
                                               ������ġ�� 1���� (�ڹٴ� 0)
                                               
        INSTR(�÷� Ȥ�� ǥ����, ���ڿ�) : ������ ���ڿ��� ������ġ�� ��ȯ�Ѵ�   
        
        TRIM(�÷� Ȥ�� ǥ����) : ���ʿ��� �¿� ������ ���ŵ� ���ڿ��� ��ȯ�Ѵ�
        
        LPAD(�÷� Ȥ�� ǥ����, ����, ����) : �÷� Ȥ�� ǥ������ ���̰� ������ ���̺���
                                          ª���� ������ ���̸�ŭ ���ʿ� ������ ���ڰ�
                                          ä���� ���ڿ��� ��ȯ�ȴ�
        
        
*/

-- 60�� ���μ��� �Ҽӵ� �������� �̸��� �ҹ���, �빮�ڷ� ��ȸ�ϱ�
SELECT FIRST_NAME, LOWER(FIRST_NAME), UPPER(FIRST_NAME)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 60�� �μ��� �Ҽӵ� �������� FIRST_NAME�� LAST_NAME�� �����ؼ� ��ȸ�ϱ�
SELECT CONCAT(FIRST_NAME, LAST_NAME)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 60�� �μ��� �Ҽӵ� �������� FIRST_NAME�� LAST_NAME�� �����ؼ� ��ȸ�ϱ�(�ڹ��� +���Ұ� �����)
SELECT FIRST_NAME || LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 60�� �μ��� �Ҽӵ� �������� �̸��� �̸��� ���̸� ��ȸ�ϱ�
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- �̸��� 6���� �̻��� ��� �������� ���� ���̵�� �̸��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) >= 6;

-- SAMPLE_BOOKS���� �����̸��� ��ȸ�ϰ�, �̸��� ù��° ���ڵ� ��ȸ�ϱ�
SELECT BOOK_WRITER, SUBSTR(BOOK_WRITER, 1, 1)
FROM SAMPLE_BOOKS;

-- ��ȭ��ȣ���� ������ ��ȸ�ϱ�
    SELECT SUBSTR('031) 1234- 5678', 1, INSTR('031) 1234- 5678', ')') -1)
    FROM DUAL;

-- DUAL�� ����Ŭ���� �����ϴ� DUMMY ���̺��̴�
-- DUAL�� 1�� 1��¥�� ���̺��̴�
-- ���� ���̺� ��ȸ���� ������ ������ ������ �� ����Ѵ�
SELECT *
FROM DUAL;

-- ���ʿ��� �¿� ���� ���ŵ� ���ڿ� ��ȸ�ϱ�
SELECT TRIM ('                   HELLO WORLD!                   ')
FROM DUAL;

-- ������ ���̸�ŭ ���ڿ��� ���ʿ� '0'�� ä���� ��ȸ�ϱ�
SELECT LPAD('100', 10, '0')
FROM DUAL;

/*
    ���� �Լ�
    
    ROUND(�÷� Ȥ�� ǥ����, �ڸ���) : ������ �ڸ������� �ݿø��Ѵ�
    
    TRUNC(�÷� Ȥ�� ǥ����, �ڸ���) : ������ �ڸ������� ����� ���� ������
    
    MOD(����1, ����2) : ������ ���� ��ȯ�Ѵ�
    
    ABS(�÷� Ȥ�� ǥ����) : ���밪�� ��ȯ�Ѵ�
    
    CEIL(�÷� Ȥ�� ǥ����) : ������ ������ ũ�ų� ���� ���� �߿��� ���� ���� ������ ��ȯ�Ѵ� 
    FLOOR(�÷� Ȥ�� ǥ����) : ������ ������ ũ�ų� ���� ���� �߿��� ���� ū ������ ��ȯ�Ѵ�
    
    
    
    
*/
-- ROUND
SELECT ROUND(1234.4567),
       ROUND(1234.4567, 3),
       ROUND(1234.4567, 2),
       ROUND(1234.4567, 1),
       ROUND(1234.4567, 0),
       ROUND(1234.4567, -1),
       ROUND(1234.4567, -2),
       ROUND(1234.4567, -3)
FROM DUAL;       
       
--TRUNC
SELECT TRUNC(1234.4567),
       TRUNC(1234.4567, 3),
       TRUNC(1234.4567, 2),
       TRUNC(1234.4567, 1),
       TRUNC(1234.4567, 0),
       TRUNC(1234.4567, -1),
       TRUNC(1234.4567, -2),
       TRUNC(1234.4567, -3)
FROM DUAL;       

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, TRUNC(SALARY, -3)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

-- 80�� �μ��� �Ҽӵ� ������ ���̵�, �̸�, �޿��� ���� #�� ����ϱ�
-- # �ϳ��� 1000�޷��� ��Ÿ����
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, LPAD('#', TRUNC(SALARY/1000), '#')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

-- ����������
SELECT MOD(10, 4)
FROM DUAL;

SELECT CEIL(1), CEIL(1.1), CEIL(1.5), CEIL(1.9), CEIL(2)
FROM DUAL;

/*
 ��¥ �Լ�
 SYSDATE : �ý����� ���� ���ڿ� �ð��� DATEŸ������ ��ȯ�Ѵ�
 SYSTIMESTAMP : �ý����� ���� ���ڿ� �ð��� TMESTAMPPŸ������ ��ȯ�Ѵ�
 ADDMONTHS(��¥, ����) : ��¥�� ������ ���ڸ�ŭ�� ���� ���� ��¥�� ��ȯ�Ѵ�
ECXACT(���� FROM ��¥)

    ��¥�Լ� ã�ƺ���
    
*/

-- �ý����� ���� ���ڿ� �ð��� DATE, SYSTIMESTAMP ������ ��ȸ�ϱ�
SECLECT SYSDATE, TIMESTAMP 
FROM DUAL;
       

/*

    ��ȯ�Լ�
    
    ������ ��ȯ
        ��ȯ�Լ��� ������� �ʾƵ� �������� Ÿ���� �ڵ����� ���ϴ� ���̴�
        '����' -> ��¥: '����'�� ��ȿ�� ��¥ ������ ������ ��� ��¥�� ����ȴ�
        '����' -> ����: '����'�� ���ڷθ� �����Ǿ� ������ ���ڷ� ����ȴ�
        
        SELECT *
        FROM EMPLOYEES
        WHERE HIRE_DATE >= '2005/01/01' AND HIRE_DATE < '2005/07/01';
        * ���� SQL���� HIRE_DATE�� DATE Ÿ���� �÷��̱� ������ '2005/01/01' ���ڰ� DATE Ÿ���� ������ �ڵ����� ��ȯ�ȴ�
        * '2005/01/01' �̳� '2005-01-01'�� ������ ��츸 �ڵ����� ��ȯ�ȴ�        
        
        SELECT *
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID = '10';   
        * ���� SQL������ DEPARTMENT_ID�� NUMBERŸ���̱� ������ '10'���ڰ� NUMBERŸ������ �ڵ����� ��ȯ�ȴ�
        
        
    ����� ��ȯ
        ��ȯ�Լ��� ����ؼ� '����' <--> ��¥, '����' <--> ���� ���� �����ͺ�ȯ�� �ϴ� ���̴�
        
        TO_DATE('��¥������ ���ڿ�', '����')
        ��) TO_DATE('2023/01/01')
            * ���ڿ��� ��¥������ �ؽ�Ʈ�̱� ������ ������ �������� �ʾƵ� DATEŸ������ ��ȯ�ȴ�
            TO_DATE('20230101', 'YYYYMMDD')
            * ���ڿ��� �Ϲ����̳� ��¥ �����̾ƴ� ��쿡�� ������ �����ؾ��Ѵ�
            
    TO_CHAR(��¥, '����')
        ��¥�� ������ ������������ �ؽ�Ʈ�� ��ȯ
        ��¥ ��ȯ ����
            AM              '����'
            PM              '����'
            YYYY, YY        '2022'
            MM              ��
            D               1~7 (1:�Ͽ���, 7:�����)
            DAY             ����
            DD              1~31
            HH              12�ð��� �ð�
            HH24            24�ð��� �ð�
            MI              ��
            SS              ��
        * ��¥ ��ȯ ������ ��ҹ��ڸ� �������� �ʴ´�
    
*/

-- ���ڸ� ��¥�� ��ȯ�ϱ�
SELECT TO_DATE('2023/01/01')
FROM DUAL;

-- ��¥�� ���ڷ� ��ȯ�ϱ�
SELECT TO_CHAR(SYSDATE, 'YYYY'),
       TO_CHAR(SYSDATE, 'MM'),
       TO_CHAR(SYSDATE, 'DD'),
       TO_CHAR(SYSDATE, 'DAY'),
       TO_CHAR(SYSDATE, 'AM'),
       TO_CHAR(SYSDATE, 'HH')
FROM DUAL;


-- �������̺��� 2005�⵵�� �Ի��� ������ ���̵�, �̸�, �Ի����ڸ� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2005';

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE --�� ������ ����ϴ� ���� �� �����ϴ�
FROM EMPLOYEES
WHERE HIRE_DATE >= '2005/01/01' AND HIRE_DATE < '2006/01/01';

