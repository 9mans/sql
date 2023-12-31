/*
    1. 중복된 행을 제거하고 조회하기
    
    SELECT DISTINCT 컬럼명, 컬럼명, ...
    FROM 테이블명
    * 지정된 컬럼들이 서로 같은 값을 가지는 행은 한번만 조회된다
*/

-- 직원테이블에서 직원들이 종사하는 직종아이디를 조회하기
SELECT DISTINCT JOB_ID -- 컬럼명이 여러개일때는 모든 컬럼명이 중복되어야 서로 같은 값이라 판단한다
FROM EMPLOYEES;

-- 직종변경이력 테이블에서 직종을 한번이라도 변경한 적이 있는 직원의 아이디를 조회하기
SELECT DISTINCT EMPLOYEE_ID
FROM JOB_HISTORY;

/*
    조회결과를 정렬하기
    SELECT 컬럼명, 컬럼명, 컬럼명..
    FROM 테이블명
    [WHERE 조건식]
    [ORDER BY {컬럼명 혹은 표현식} [ASC 혹은BESC (생략가능)]]
    * ORDER BY 절을 사용하면 조회결과를 오름차순 혹은 내림차순으로 정렬할 수 있다
    * ORDER BY 절에 컬럼명이 오면 해당 컬럼의 값을 기준으로 행들을 오름차순 혹은 내림차순으로 정렬한다
    * 정렬방향 ASC 혹은 DESC로 결정한다 ASC -> 오름차순 / DESC -> 내림차순 생략하면 ASC다
    
    ORDER BY절에 컬럼명을 여러개 적어 조회하기
    SELECT 컬럼명, 컬럼명, 컬럼명..
    FROM 테이블명
    [WHERE 조건식]
    [ORDER BY {컬럼명 혹은 표현식} [ASC 혹은BESC (생략가능)], {컬럼명 혹은 표현식} [ASC 혹은BESC (생략가능)]]
    * 컬럼 정렬방식 컬럼 정렬방식의 방법으로 적는다
*/

-- 직원테이블에서 직원아이디, 이름, 급여를 조회하고, 급여순으로 내림차순 정렬해서 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;

-- 직원 테이블에서 60번 부서에 소속된 직원들의 아이디, 이름, 급여를 조회하고, 급여순으로 오름차순 정렬해서 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY SALARY ASC;

-- 직원 테이블에서 50번 부서에 소속된 직원들의 직원아이디, 이름, 입사일, 급여를 조회하고 입사일을 기준으로 오름차순 정렬해서 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
ORDER BY SALARY ASC;

-- 직원 테이블에 소속된 직원들의 직원 아이디, 이름, 급여, 부서아이디를 조회하고 부서아이디를 기준으로 오름차순 정렬하고 동일한 직원은 급여를 기준으로 내림차순 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC;

/*
    WHERE 절의 조건식에서 다양한 연산자 사용하기
    
    1. 비교 연산자
        =, !=, >, <, >=, <=
        * 오라클에서는 <> 는 not equal을 나타내는 연산자 != 와 <> 을 사용할 수 있다
    2. 논리연산자
        AND, OR, NOT
    3. 기타연산자
        BETWEEN 값1, AND 값2
        
        SELECT 컬럼명, 컬럼명...
        FROM 테이블명
        WHERE 컬럼명 BETWEEN 값1 AND 값2;
        * WHERE 절에 지정된 컬럼의 값이 값1 이상, 값2 이하인 것을 조회한다(비교값을 초과하는경우 사용할 수 없다)
        * 값1 <= 컬럼명 <= 값2 와 같다
        
        IN {값1, 값2, 값3 ...}
        SELECT 컬럼명, 컬럼명, 컬럼명...
        FROM 테이블명
        WHERE 컬럼명 IN {값1, 값2, 값3 ...};
        * WHERE 절에서 지정된 컬럼의 값이 값1, 값2, 값3 중 하나와 일치하면 조회한다
        * OR 연산자와 같은 기능을 제공하지만 컬럼명 = 값1 OR 컬럼명 = 값2 와 같이 비교 연산자가 = 일때만 사용가능하다 (OR 연산을 AND와 사용할때는 ()를 꼭 넣어줘야한다)
        
        IS NULL 과 IS NOT NULL
        SELECT 컬럼명, 컬럼명, 컬럼명...
        FROM 테이블명
        WHERE 컬럼명 IS NULL 혹은 컬럼명 IS NOT NULL;
        WHERE 절에서 지정된 컬럼의 값이 NULL 인 행을 조회하는 IS NULL과
        컬럼의 값이 NULL이 아닌 행을 조회하는 IS NOT NULL 이 있다
    
        LIKE '패턴'
        패턴문자
            '%' : 0개 이상의 임의의 문자를 나타낸다
            '_' : 임의의 문자 하나를 나타낸다
            
            제목이 '자바'로 시작하는 도서를 조회하기
                WHERE BOOK_TITLE LIKE '자바%'
                * '자바', '자바000', '자바000000' 는 전부 위의 패턴과 일치한다
            제목이 '자바'로 끝나는 도서 조회하기
                WHERE BOOK_TITLE LIKE '%자바'
                * '자바', '00자바', '00000자바'
            제목에 '자바'가 포함되어 있는 도서를 조회하기
                WHERE BOOK_TITLE LIKE '%자바%' (%가 앞으로 오면 실행속도를 크게 낮춘다)
                * '자바', '자바000', '0000자바', '000자바000'
                
            성씨가 '김' 씨인 고객을 조회하기
                WHERE NAME LIKE '김_%' ( 언더바가 들어갔기때문에 '김' 은 해당되지 않는다)
                * '김구', '김유신', '김이박최' 는 전부 위의 패턴과 일치한다
                * '김' 씨고 이름이 외자인 고객 조회하기
                    WHERE NAME LIKE '김_'
                * '김' 씨고 이름이 두 글자인 고객 조회하기
                    WHERE NAME LIKE '김__' ( 언더바는 문자 하나)
*/

-- 직원테이블에서 급여가 3000이상 5000이하인 직원의 아이디, 이름, 직종아이디, 급여를 조회하고 급여순으로 오름차순 정렬하기
SELECT  EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 5000
ORDER BY SALARY ASC;

-- 직원테이블에서 2005년도에 입사한 직원의 아이디, 이름, 입사일을 조회하고 입사일순으로 오름차순 정렬하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '2005/01/01' AND '2005/12/31'
ORDER BY HIRE_DATE;

-- 직원테이블에서 소속부서가 10번 이거나 20번 이거나 30번이고 급여를 3000이하로 받는 직원의 아이디, 이름, 급여, 소속부서 아이디를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10, 20, 30) 
AND SALARY <= 3000;

-- 부서테이블에서 관리자가 지정되어 있지 않은 부서아이디와 부서이름 조회하기
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID
FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL;

-- 부서테이블에서 관리자가 지정되어 있는 부서아이디와 부서이름 조회하기
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID
FROM DEPARTMENTS
WHERE MANAGER_ID IS NOT NULL;

-- 직원 테이블에서 소속부서가 결정되지 않은 직원의 아이디, 이름, 직종을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM employees
WHERE DEPARTMENT_ID IS NULL;

-- 직원테이블에서 직종아이디가 'SA' 로 시작하는 직원의 아이디, 이름, 직종아이디를 조회하기 
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE 'SA%';
