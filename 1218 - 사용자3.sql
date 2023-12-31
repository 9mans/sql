-- HTA 사용자에게 객체 권한 부여하기
GRANT SELECT 
ON EMPLOYEES
TO HTA;

-- HTA 사용자에게 부여된 객체 권한 회수하기
REVOKE SELECT
ON EMPLOYEES
FROM HTA;


-- TO : 사용자에게 여러 개의 객체 권한을 부여하기
GRANT SELECT, INSERT, UPDATE, DELETE
ON EMPLOYEES
TO HTA;

-- TO 사용자에게 모든 객체 권한을 부여하기
GRANT ALL PRIVILEGES
ON EMPLOYEES
TO HTA;

-- 모든 사용자에게 객체에 대한 객체권한을 부여하기
GRANT SELECT 
ON EMPLOYEES
TO PUBLIC;

-- WITH GRANT OPTION을 사용하면 SELECT 권한을 부여받은 다른 HTA가 다른 사용자에게 SELECT 권한을 부여할 수 있다
GRANT SELECT
ON EMPLOYEES
TO HTA
WITH GRANT OPTION;