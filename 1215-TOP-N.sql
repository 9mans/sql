/*
TOP-N �м�
    ���ǿ� �´� �ֻ��� ������ N�� Ȥ�� ������ ������ N���� ��ȸ�ϴ� ���̴�.
    
    ����
        SELECT ROWNUM, �÷���, �÷���, �÷���,...
        FROM (SELECT �÷���, �÷���, �÷���, ...
              FROM ���̺���
              [WHERE] ���ǽ�
              ORDER BY �÷���)
        WERE ROWNUM <= N;
        
        * ROWNUM�� ����Ŭ���� �����ϴ� �����÷��̴�.
        * ROWNUM�� SELECT������ ����� ���, �����ϴ� �����Ϳ� 1���� �����ϴ� ������ �ο��ϴ� �뵵�� ���ȴ�.
                   WHERE������ ����� ���, ������ ������ �� �Ϻθ� �������� �뵵�� Ȱ���� �� �ִ�.
        * ROWNUM�� ������ 1���� �ο��ϴ� �����÷��̱� ������ ROWNUM�� ������ 1�� �ƴ� ������ 
          �����Ϸ� �� ��쿡�� �����Ͱ� ��ȸ���� �ʴ´�.
        * ORDER BY���� �����͸� ������ �� ROWNUM���� �� ���� �����͸� �����ؾ� �ϴ� ���, 
          ORDER BY���� ���� ó���ϵ��� �ζ��� �並 �����, �� �並 ���δ� �ٱ��� SQL���� ROWNUM ó���� ����.
*/

-- �������� �޿������� �������� �� �޿��� ���� ���� �޴� ���� 5��(1�� ~ 5��)�� �������̵�, �̸�, �޿�, �������̵�
-- ��ȸ�ϱ�
SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
FROM (SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
      FROM EMPLOYEES
      ORDER BY SALARY DESC)
WHERE ROWNUM <= 5;

-- �Ʒ��ڵ�� TOP-N �м��� �ƴϴ�.
-- �������� �޿������� �������� �� �޿��� ���� ���� �޴� ���� 5��(6�� ~ 10��)�� �������̵�, �̸�, �޿�, �������̵�
-- ��ȸ�ϱ�
SELECT RN, EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
FROM (SELECT ROWNUM AS RN, EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
      FROM (SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
            FROM EMPLOYEES
            ORDER BY SALARY DESC))
WHERE RN >= 6 AND RN <= 10;

/*
����¡ ó���� ��ȸ���� ���ϱ�
    
    ��������ȣ�� 1���������� �����ϰ�, �� �������� 10���� �����͸� ǥ���ϴ� ���
    ������ġ = (��������ȣ - 1)*10 + 1
    ������ġ = ��������ȣ*10
*/

/*
����Ŭ�� �м��Լ�
    ���̺��� �����͸� Ư�� �뵵�� �м��Ͽ� ����� ��ȯ�ϴ� �Լ�
    ���� 
        �����Լ� : RANK, DENSE_RANK, ROW_NUMBER
        �����Լ� : SUM, MIN, MAX, AVG, COUNT
    
    ����
        SELECT �м��Լ�([�÷�]) OVER ([PARTITION BY �÷�] [ORDER BY �÷�])
        FROM ���̺���
*/

/*
RANK �Լ�
    Ư�� �÷��� �������� ������ ���� ������ ���ϴ� �Լ���.
    �ߺ� ���� ������ �ش� �������� ������ŭ ������ ���� ��ȯ�Ѵ�.
*/ 
-- 80�� �μ��� �Ҽӵ� �������� �޿��� �������� ��ŷ�� �ο��ؼ� ��ȸ�ϱ�
SELECT RANK() OVER (ORDER BY SALARY DESC) RANKING, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

-- 80�� �μ��� �Ҽӵ� �������� �޿��� ������� ��Ű�� �ο��ؼ� ��ȸ�ϱ�
-- ��, �������� �����ؼ� ������ �ο��Ѵ�.
SELECT RANK() OVER (PARTITION BY JOB_ID ORDER BY SALARY DESC) RANKING, 
       FIRST_NAME, 
       JOB_ID, 
       SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

/*
DENSE_RANK�Լ�
    �ߺ��� �������࿡ ������� ���������� ������ ��ȯ�Ѵ�.
*/
-- 80�� �μ��� �Ҽӵ� �������� �޿��� �������� ��ŷ�� �ο��ؼ� ��ȸ�ϱ�
SELECT FIRST_NAME, 
       SALARY,
       RANK() OVER (ORDER BY SALARY DESC) AS R1,
       DENSE_RANK() OVER (ORDER BY SALARY DESC) AS R2
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

/*
ROW_NUMBER�Լ�
    RANK�� DENSE_RANK �Լ��� ������ ���� ���ؼ� ������ ������ �ο��ϴ� �ݸ�
    ROW_NUMBER �Լ��� ���� ���̿��� ������ ������ �ο��ȴ�.
    
    ROW_NUMBER �Լ��� Ȱ���ϸ� Ư�� �������� �����͸� ��ȸ�϶� �����ϴ�.
*/
-- 80�� �μ��� �Ҽӵ� �������� �޿��� �������� ������ �ο��ؼ� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY, 
       ROW_NUMBER() OVER (ORDER BY SALARY DESC) RN
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;


-- 80�� �μ��� �Ҽӵ� �������� �޿��� �������� ������ �ο����� ��
-- 1�� ~ 10�� �������� ���������� ��ȸ�ϱ�
SELECT RN, FIRST_NAME, SALARY
FROM (SELECT ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS RN,
             FIRST_NAME,
             SALARY
      FROM EMPLOYEES)
WHERE RN >= 11 AND RN <= 20;


/*
SUM�Լ�
    SUM�Լ��� ��Ƽ�Ǻ� ������ ���� �հ踦 ��ȯ�Ѵ�.
*/
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID,
       SUM(SALARY) OVER (PARTITION BY DEPARTMENT_ID) DEPT_SUM
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;















