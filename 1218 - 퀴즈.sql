--employees ���̺��� ������� ��� �������̵� ��ȸ�ϱ�
SELECT JOB_ID
FROM EMPLOYEES;

--�޿��� 12,000�޷� �̻� �޴� ����� �̸��� �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 12000;

--�����ȣ�� 176�� ����� ���̵�� �̸� ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 176;

--�޿��� 12,000�޷� �̻� 15,000�޷� ���� �޴� ������� ��� ���̵�� �̸��� �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 12000 AND SALARY <= 15000;


--2005�� 1�� 1�Ϻ��� 2000�� 6�� 30�� ���̿� �Ի��� ����� ���̵�, �̸�, �������̵�, �Ի����� ��ȸ�ϱ�



--�޿��� 5,000�޷��� 12,000�޷� �����̰�, �μ���ȣ�� 20 �Ǵ� 50�� ����� �̸��� �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE (SALARY >= 5000 AND SALARY <= 12000) AND (SELECT FIRST_NAME, SALARY
                                                                                     FROM EMPLOYEES
                                                                                     WHERE DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 50);


--�����ڰ� ���� ����� �̸��� �������̵� ��ȸ�ϱ�
SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

--Ŀ�̼��� �޴� ��� ����� �̸��� �޿�, Ŀ�̼��� �޿� �� Ŀ�̼��� ������������ �����ؼ� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY, COMMISSION_PCT AS COM_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY ASC;


--�̸��� 2��° ���ڰ� e�� ��� ����� �̸��� ��ȸ�ϱ�

--�������̵� ST_CLERK �Ǵ� SA_REP�̰� �޿��� 2,500�޷�, 3,500�޷�, 7,000�޷� �޴� ��� ����� �̸��� �������̵�, �޿��� ��ȸ�ϱ�

--��� ����� �̸��� �Ի���, �ٹ� ���� ���� ����Ͽ� ��ȸ�ϱ�, �ٹ����� ���� ������ �ݿø��ϰ�, �ٹ��������� �������� ������������ �����ϱ�

--����� �̸��� Ŀ�̼��� ��ȸ�ϱ�, Ŀ�̼��� ���� �ʴ� ����� '����'���� ǥ���ϱ�
SELECT FIRST_NAME, COMMISSION_PCT
FROM EMPLOYEES;


--��� ����� �̸�, �μ���ȣ, �μ��̸��� ��ȸ�ϱ�




--80���μ��� �Ҽӵ� ����� �̸��� �������̵�, ��������, �μ��̸��� ��ȸ�ϱ�
SELECT E.FIRST_NAME, E.EMPLOYEE_ID, J.JOB_ID, J.JOB_TITLE 
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID
AND DEPARTMENT_ID = 80;
--Ŀ�̼��� �޴� ��� ����� �̸��� �������̵�, ��������, �μ��̸�, �μ������� ���ø��� ��ȸ�ϱ�

--������ �������� �ΰ� �ִ� ��� �μ����̵�� �μ��̸��� ��ȸ�ϱ�
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE R.REGION_ID = 1
AND D.LOCATION_ID = L.LOCATION_ID
AND L.COUNTRY_ID = C.COUNTRY_ID
AND C.REGION_ID = R.REGION_ID;




--����� �̸��� �ҼӺμ���, �޿�, �޿� ����� ��ȸ�ϱ�
SELECT E.FIRST_NAME, E.DEPARTMENT_ID, E.SALARY, G.GRADE
FROM EMPLOYEES E, SALARY_GRADES G
WHERE E.SALARY > G.MIN_SALARY AND E.SALARY < G.MAX_SALARY;

--����� �̸��� �ҼӺμ���, �ҼӺμ��� �����ڸ��� ��ȸ�ϱ�, �ҼӺμ��� ���� ����� �ҼӺμ��� '����, �����ڸ� '����'���� ǥ���ϱ�

--��� ����� �޿� �ְ��, �޿� ������, �޿� �Ѿ�, �޿� ��վ��� ��ȸ�ϱ�
SELECT MAX(SALARY), MIN(SALARY), SUM(SALARY), TRUNC(AVG(SALARY))
FROM EMPLOYEES;
--������ �޿� �ְ��, �޿� ������, �޿� �Ѿ�, �޿� ��վ��� ��ȸ�ϱ�

--�� ������ ������� ��ȸ�ؼ� ���� ������� ���� ���� 3���� ��ȸ�ϱ�, �������̵�� ����� ǥ���ϱ�

--�����ں� ������� ��ȸ�ϱ�, ������ �̸��� �� �����ڰ� �����ϴ� ����� ǥ���ϱ�

--�� �μ��� ���� �μ��̸�, ������ �̸�, �Ҽӻ�� ��, �Ҽӻ������ ��� �޿��� ��ȸ�ϱ�

--Steven King�� ���� �μ��� ���� ����� �̸��� �Ի����� ��ȸ�ϱ�

--�Ҽ� �μ��� ��ձ޿����� ���� �޿��� �޴� ����� ���̵�� ����̸�, �޿�, �� �μ��� ��� �޿��� ��ȸ�ϱ�

--Kochhar�� ������ �޿� ��� ����� �̸��� �Ի��� �޿��� ��ȸ�ϱ�, ����� Kochhar�� ���Խ�Ű�� �ʱ�

--�Ҽ� �μ��� �Ի����� ������, �� ���� �޿��� �޴� ����� �̸��� �ҼӺμ���, �޿��� ��ȸ�ϱ�

--������ ���̵�, �����ڸ�, �� �����ڰ� �����ϴ� �����, �� �����ڰ� �Ҽӵ� �μ��� ��ȸ�ϱ�








