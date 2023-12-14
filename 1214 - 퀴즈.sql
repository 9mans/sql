-- ��� ������ ���̵�, �̸�, �μ���ȣ, �μ����� ��ȸ�ϱ�(�����)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID  = D.DEPARTMENT_ID;

-- Ŀ�̼��� �޴� ������ ���̵�, �̸�, �������̵�, �޿�, Ŀ�̼��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- Ŀ�̼��� �޴� ������ ���̵�, �̸�, �޿�, Ŀ�̼�, �޿������ ��ȸ�ϱ�(������)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, E.COMMISSION_PCT, G.GRADE
FROM EMPLOYEES E, SALARY_GRADES G
WHERE COMMISSION_PCT IS NOT NULL
AND E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY;

-- 80�� �μ��� �Ҽӵ� �������� ��ձ޿�, �����޿�, �ְ�޿��� ��ȸ�ϱ�(�׷��Լ�)
SELECT TRUNC(AVG(SALARY)), MIN(SALARY), MAX(SALARY) 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;


-- 80�� �μ��� �Ҽӵ� �������� �������̵�, �̸�, ��������, �޿�, �ְ�޿��� �޿����� ���̸� ��ȸ�ϱ�(�����)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, J.JOB_TITLE, E.SALARY, J.MAX_SALARY - J.MIN_SALARY AS �޿�����
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID
AND DEPARTMENT_iD = 80;


-- �� �μ��� �ְ�޿�, �����޿�, �ְ�޿��� �����޿��� ���̸� ��ȸ�ϱ�(GROUP BY)
SELECT DEPARTMENT_ID, MAX(SALARY), MIN(SALARY), MAX(SALARY) - MIN(SALARY) �޿�����
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


-- 'Executive' �μ��� ��� �������̵�, �̸�, �������̵� ��ȸ�ϱ�(�������� Ȥ�� ����)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.DEPARTMENT_NAME = 'Executive'
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID;



-- ��ü ������ ��ձ޿����� �޿��� ���� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�(��������)
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY)
                                FROM EMPLOYEES);

-- 'Ismael'�� ���� �ؿ� �Ի��߰�, ���� �μ��� �ٹ��ϰ� �ִ� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϱ�(��������)
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') IN (SELECT DISTINCT TO_CHAR(HIRE_DATE, 'YYYY')
                                                                 FROM EMPLOYEES
                                                                WHERE FIRST_NAME = 'Ismael');

-- �μ��� �ְ�޿��� ��ȸ���� �� �ְ�޿��� 15000�� �Ѵ� �μ��� ���̵�� �ְ�޿��� ��ȸ�ϱ�(GROUP BY, HAVING)
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) > 15000;


-- 'Neena'���� �޿��� ���� �޴� ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�(��������)
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY 
                            FROM EMPLOYEES
                            WHERE FIRST_NAME = 'Neena');
-- �޿���޺��� �������� ��ȸ�ϱ�(������, GROUP BY)

-- �μ��� ��ձ޿��� ������� �� �μ��� ��ձ޿����� �޿��� ���� �޴� ������ ���̵�, �̸�, �޿�, �μ����� ��ȸ�ϱ�(�ζ��κ�, ����)

-- 'Ismael' ������ �ٹ��ϴ� �μ��� ���̵�� �̸��� ��ȸ�ϱ�(��������)

-- 'Neena'���� �����ϴ� ������ ���̵�� �̸��� ��ȸ�ϱ�(��������)

-- �μ��� ��ձ޿��� ������� �� 'Ismael'�� �ٹ��ϴ� �μ��� ��ձ޿����� �޿��� ���� �޴� �μ��� ���̵�� ��ձ޿��� ��ȸ�ϱ�(GROUP BY, �ζ��κ�, ��������)
