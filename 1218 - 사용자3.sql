-- HTA ����ڿ��� ��ü ���� �ο��ϱ�
GRANT SELECT 
ON EMPLOYEES
TO HTA;

-- HTA ����ڿ��� �ο��� ��ü ���� ȸ���ϱ�
REVOKE SELECT
ON EMPLOYEES
FROM HTA;


-- TO : ����ڿ��� ���� ���� ��ü ������ �ο��ϱ�
GRANT SELECT, INSERT, UPDATE, DELETE
ON EMPLOYEES
TO HTA;

-- TO ����ڿ��� ��� ��ü ������ �ο��ϱ�
GRANT ALL PRIVILEGES
ON EMPLOYEES
TO HTA;

-- ��� ����ڿ��� ��ü�� ���� ��ü������ �ο��ϱ�
GRANT SELECT 
ON EMPLOYEES
TO PUBLIC;

-- WITH GRANT OPTION�� ����ϸ� SELECT ������ �ο����� �ٸ� HTA�� �ٸ� ����ڿ��� SELECT ������ �ο��� �� �ִ�
GRANT SELECT
ON EMPLOYEES
TO HTA
WITH GRANT OPTION;