/*

���̺��� ������ ��ȸ

1. ������ ���̺� ��� ��, ��� �� ��ȸ
SELECT *
FROM ���̺���;

2. ������ ���̺��� ��� �� ������ �� ��ȸ�ϱ�
SELECT �÷���, �÷���, �÷���*
FROM ���̺���;

3. SELECT������ ��Ģ������ ������ �� �ֵ�
SELECT �÷���*����, �÷���*�÷���,...
FROM ���̺���;
* ��Ģ���꿡 ���Ǵ� �÷��� �ش� �÷��� ���� ���ڰ��̾���Ѵ�

4. �÷��� ��Ī(Alias) �ο��ϱ�
SELECT �÷��� AS ��Ī, �÷��� AS ��Ī, ...
FROM ���̺���;

 SELECT �÷��� ��Ī, �÷��� ��Ī, �÷��� ��Ī...
 FROM ���̺���;
 


*/
-- ���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT *
FROM REGIONS;

-- ���� ���̺��� ��� �� ��� �� ��ȸ�ϱ�
SELECT *
FROM countries;

- �μ� ���̺��� ��� �� ��� �� �����ϱ�
SELECT *
FROM DEPARTMENTS;

- ���� ���̺��� ��� �� ��� �� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEES;

-- ���� ���̺����� ���� ���̵�, �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT JOB_ID, MIN_SALARY, MAX_SALARY
FROM JOBS;

-- ���� ���̺����� �������̵�, �����̸�, �޿� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES;

-- ������ ���̺����� ������ ���̵�, �ּ�, ���ø��� ��ȸ�ϱ�
SELECT LOCATION_ID, STREET_ADDRESS, CITY
FROM LOCATIONS;

-- ���� ���̺����� ���� ���̵�, �����̸�, �޿�, ������ ��ȸ�ϱ�
-- ������ �޿�*12�� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY*12
FROM EMPLOYEES;

-- ���� ���̺����� �������̵�, �����̸�, �޿�, ������ ��ȸ�ϱ�
-- ������ �޿�*12
-- ������ ��Ī�� ANNUAL_SALARY
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY*12 AS ANNUAL_SALARY
FROM EMPLOYEES;

-- ���� ���̺����� ���� ���̵�, �ְ��޿�, �����޿�, �ְ��޿��� �����޿��� ���̸� ��ȸ�ϱ�
-- �ְ��޿��� �����޿��� ���̴� SALARY_GAP ��Ī�� �ο��Ѵ�
SELECT JOB_ID, MAX_SALARY, MIN_SALARY, MAX_SALARY - MIN_SALARY AS SALARY_GAP
FROM JOBS;

/*

    ������ ���͸��ϱ�
    
    1. WHERE ���� ���ǽ��� �ۼ��ؼ� �ش� ���ǽ��� ������Ű�� �ุ ��ȸ�ϱ�
    SELECT �÷���, �÷���, �÷���,...
    FROM ���̺���
    WHERE ���ǽ�;
    
    2. WHERE������ 2�� �̻��� ���ǽ����� �����͸� ���͸��� �� �ִ�
       2�� �̻��� ���ǽ��� �ۼ��� ���� AND, OR, NOT ���� �����ڸ� ����Ѵ�
       
       SELECT �÷���, �÷���, �÷���, ....
       FROM ���̺���
       WHERE ���ǽ�1 AND ���ǽ�2;
       * ���ǽ�1�� ���ǽ�2�� ��� TRUE�� �����Ǵ� �ุ ��ȸ
       
       SELECT �÷���, �÷���, �÷���, ....
       FROM ���̺���
       WHERE ���ǽ�1 OR ���ǽ�2;
       * ���ǽ�1�� ���ǽ�2 �߿��� �ϳ��� TRUE�� �����Ǵ� �ุ ��ȸ�ȴ�
       
       SELECT �÷���, �÷���, �÷���, ....
       FROM ���̺���
       WHERE ���ǽ�1 AND (���ǽ�2 OR ���ǽ�3);
       * AND �����ڿ� OR �����ڸ� ���� ����� ���� OR ������� ��ȣ�� ���´�
*/

-- ���� ���̺����� �ҼӺμ� ���̵� 60���� ������ ���̵�, �̸�, �������̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- ���� ���̺����� �޿��� 10000�޷� �̻� �޴� ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000;

-- ���� ���̺����� �������̵� 'SA_MAN'�� ������ ���̵�, �̸�, �޿�, �ҼӺμ� ���̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'SA_MAN'; 

-- ���� ���̺����� �޿��� 5000 ~ 10000 ������ ���ϴ� ���� ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
-- �޿��� 5000 �̻�, 10000 ���Ϸ� �޴� ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000 AND SALARY <= 10000;

-- ���� ���̺����� 10�� �μ�, 20�� �μ�, 30�� �μ����� �ٹ��ϴ� ���� ���̵�, �̸�, �μ����̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 30;
