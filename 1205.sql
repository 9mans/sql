/*
    1. �ߺ��� ���� �����ϰ� ��ȸ�ϱ�
    
    SELECT DISTINCT �÷���, �÷���, ...
    FROM ���̺��
    * ������ �÷����� ���� ���� ���� ������ ���� �ѹ��� ��ȸ�ȴ�
*/

-- �������̺��� �������� �����ϴ� �������̵� ��ȸ�ϱ�
SELECT DISTINCT JOB_ID -- �÷����� �������϶��� ��� �÷����� �ߺ��Ǿ�� ���� ���� ���̶� �Ǵ��Ѵ�
FROM EMPLOYEES;

-- ���������̷� ���̺��� ������ �ѹ��̶� ������ ���� �ִ� ������ ���̵� ��ȸ�ϱ�
SELECT DISTINCT EMPLOYEE_ID
FROM JOB_HISTORY;

/*
    ��ȸ����� �����ϱ�
    SELECT �÷���, �÷���, �÷���..
    FROM ���̺��
    [WHERE ���ǽ�]
    [ORDER BY {�÷��� Ȥ�� ǥ����} [ASC Ȥ��BESC (��������)]]
    * ORDER BY ���� ����ϸ� ��ȸ����� �������� Ȥ�� ������������ ������ �� �ִ�
    * ORDER BY ���� �÷����� ���� �ش� �÷��� ���� �������� ����� �������� Ȥ�� ������������ �����Ѵ�
    * ���Ĺ��� ASC Ȥ�� DESC�� �����Ѵ� ASC -> �������� / DESC -> �������� �����ϸ� ASC��
    
    ORDER BY���� �÷����� ������ ���� ��ȸ�ϱ�
    SELECT �÷���, �÷���, �÷���..
    FROM ���̺��
    [WHERE ���ǽ�]
    [ORDER BY {�÷��� Ȥ�� ǥ����} [ASC Ȥ��BESC (��������)], {�÷��� Ȥ�� ǥ����} [ASC Ȥ��BESC (��������)]]
    * �÷� ���Ĺ�� �÷� ���Ĺ���� ������� ���´�
*/

-- �������̺��� �������̵�, �̸�, �޿��� ��ȸ�ϰ�, �޿������� �������� �����ؼ� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;

-- ���� ���̺��� 60�� �μ��� �Ҽӵ� �������� ���̵�, �̸�, �޿��� ��ȸ�ϰ�, �޿������� �������� �����ؼ� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY SALARY ASC;

-- ���� ���̺��� 50�� �μ��� �Ҽӵ� �������� �������̵�, �̸�, �Ի���, �޿��� ��ȸ�ϰ� �Ի����� �������� �������� �����ؼ� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
ORDER BY SALARY ASC;

-- ���� ���̺� �Ҽӵ� �������� ���� ���̵�, �̸�, �޿�, �μ����̵� ��ȸ�ϰ� �μ����̵� �������� �������� �����ϰ� ������ ������ �޿��� �������� �������� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC;

/*
    WHERE ���� ���ǽĿ��� �پ��� ������ ����ϱ�
    
    1. �� ������
        =, !=, >, <, >=, <=
        * ����Ŭ������ <> �� not equal�� ��Ÿ���� ������ != �� <> �� ����� �� �ִ�
    2. ��������
        AND, OR, NOT
    3. ��Ÿ������
        BETWEEN ��1, AND ��2
        
        SELECT �÷���, �÷���...
        FROM ���̺��
        WHERE �÷��� BETWEEN ��1 AND ��2;
        * WHERE ���� ������ �÷��� ���� ��1 �̻�, ��2 ������ ���� ��ȸ�Ѵ�(�񱳰��� �ʰ��ϴ°�� ����� �� ����)
        * ��1 <= �÷��� <= ��2 �� ����
        
        IN {��1, ��2, ��3 ...}
        SELECT �÷���, �÷���, �÷���...
        FROM ���̺��
        WHERE �÷��� IN {��1, ��2, ��3 ...};
        * WHERE ������ ������ �÷��� ���� ��1, ��2, ��3 �� �ϳ��� ��ġ�ϸ� ��ȸ�Ѵ�
        * OR �����ڿ� ���� ����� ���������� �÷��� = ��1 OR �÷��� = ��2 �� ���� �� �����ڰ� = �϶��� ��밡���ϴ� (OR ������ AND�� ����Ҷ��� ()�� �� �־�����Ѵ�)
        
        IS NULL �� IS NOT NULL
        SELECT �÷���, �÷���, �÷���...
        FROM ���̺��
        WHERE �÷��� IS NULL Ȥ�� �÷��� IS NOT NULL;
        WHERE ������ ������ �÷��� ���� NULL �� ���� ��ȸ�ϴ� IS NULL��
        �÷��� ���� NULL�� �ƴ� ���� ��ȸ�ϴ� IS NOT NULL �� �ִ�
    
        LIKE '����'
        ���Ϲ���
            '%' : 0�� �̻��� ������ ���ڸ� ��Ÿ����
            '_' : ������ ���� �ϳ��� ��Ÿ����
            
            ������ '�ڹ�'�� �����ϴ� ������ ��ȸ�ϱ�
                WHERE BOOK_TITLE LIKE '�ڹ�%'
                * '�ڹ�', '�ڹ�000', '�ڹ�000000' �� ���� ���� ���ϰ� ��ġ�Ѵ�
            ������ '�ڹ�'�� ������ ���� ��ȸ�ϱ�
                WHERE BOOK_TITLE LIKE '%�ڹ�'
                * '�ڹ�', '00�ڹ�', '00000�ڹ�'
            ���� '�ڹ�'�� ���ԵǾ� �ִ� ������ ��ȸ�ϱ�
                WHERE BOOK_TITLE LIKE '%�ڹ�%' (%�� ������ ���� ����ӵ��� ũ�� �����)
                * '�ڹ�', '�ڹ�000', '0000�ڹ�', '000�ڹ�000'
                
            ������ '��' ���� ���� ��ȸ�ϱ�
                WHERE NAME LIKE '��_%' ( ����ٰ� ���⶧���� '��' �� �ش���� �ʴ´�)
                * '�豸', '������', '���̹���' �� ���� ���� ���ϰ� ��ġ�Ѵ�
                * '��' ���� �̸��� ������ �� ��ȸ�ϱ�
                    WHERE NAME LIKE '��_'
                * '��' ���� �̸��� �� ������ �� ��ȸ�ϱ�
                    WHERE NAME LIKE '��__' ( ����ٴ� ���� �ϳ�)
*/

-- �������̺��� �޿��� 3000�̻� 5000������ ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϰ� �޿������� �������� �����ϱ�
SELECT  EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 5000
ORDER BY SALARY ASC;

-- �������̺��� 2005�⵵�� �Ի��� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϰ� �Ի��ϼ����� �������� �����ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '2005/01/01' AND '2005/12/31'
ORDER BY HIRE_DATE;

-- �������̺��� �ҼӺμ��� 10�� �̰ų� 20�� �̰ų� 30���̰� �޿��� 3000���Ϸ� �޴� ������ ���̵�, �̸�, �޿�, �ҼӺμ� ���̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10, 20, 30) 
AND SALARY <= 3000;

-- �μ����̺��� �����ڰ� �����Ǿ� ���� ���� �μ����̵�� �μ��̸� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID
FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL;

-- �μ����̺��� �����ڰ� �����Ǿ� �ִ� �μ����̵�� �μ��̸� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID
FROM DEPARTMENTS
WHERE MANAGER_ID IS NOT NULL;

-- ���� ���̺��� �ҼӺμ��� �������� ���� ������ ���̵�, �̸�, ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM employees
WHERE DEPARTMENT_ID IS NULL;

-- �������̺��� �������̵� 'SA' �� �����ϴ� ������ ���̵�, �̸�, �������̵� ��ȸ�ϱ� 
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE 'SA%';
