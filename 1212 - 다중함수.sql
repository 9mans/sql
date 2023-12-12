/*
    다중행 함수(그룹 함수)
    
        조회된 행들의 집합그룹에 적용되어 그룹당 하나의 결과를 생성하는 함수
        
        * 집합그룹: 테이블전체 
                   그룹화된 테이블의 행들(GROUP BY를 사용하면 테이블의 행을 그룹화할 수 있다)

    COUNT(*)
        조회된 모든 행의 개수를 반환
    COUNT(컬럼명)
        조회된 행에서 지정된 컬럼의 값이 NULL이 아닌 행의 개수를 반환
    SUM(컬럼명)
        조회된 행에서 지정된 컬럼 값의 합계 반환(NULL무시)
    AVG(컬럼명)
        조회된 행에서 지정된 컬럼 값의 평균을 반환(NULL무시)
    MIN(컬럼명)
        조회된 행에서 지정된 컬럼의 최소값을 반환(NULL무시)
    MAX(컬럼명)
        조회된 행에서 지정된 컬럼의 최대값을 반환(NULL무시)
        
    다중행 함수 작성시 주의사항
        - 다중행 함수는 WHERE절에 사용할 수 없다
            SELECT *
            FROM EPLOYEES
            WHERE COUNT(*) > 10  <-- 오류
        
        - 다중행 함수와 일반 컬럼명을 SELECT절에 같이 적을 수 없다
          GROUP BY절에 사용한 컬럼명은 SELECT절에 적을 수 있다
        - 다중행 함수의 중첩은 한 번만 허용된다
*/

-- 집합그룹이 테이블 전체다
SELECT COUNT(*)
FROM EMPLOYEES;

-- 집합그룹이 여러개다 직원 테이블에서 부서아이디가 같은 것 끼리 그룹화 시켰다 
SELECT MAX(COUNT(*))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 커미션을 받는 직원의 수를 조회하기
SELECT COUNT(*)
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES;

-- 60번 부서에 소속된 직원의 평균급여 조회하기
SELECT AVG(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 80번 부서에 소속된 직원의 급여 총합계, 평균 급여, 최소급여, 최대급여 조회
SELECT SUM(SALARY), TRUNC(AVG(SALARY)), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

-- 직원들이 종사하고 있는 직종아이디를 중복없이 조회하기
SELECT COUNT(DISTINCT JOB_ID)
FROM EMPLOYEES;


/*
    그롭화하기
        GROUP BY 절을 사용해서 테이블의 행을 지정된 컬럼의 값이 같은 값을 가지는 행끼리 그룹화 할 수 있다
        
        SELECT 컬럼명, 그룹함수(), 그룹함수()
        FROM 테이블명
        WHERE 조건식
        GROUPBY 컬럼명
        ORDER BY 컬럼명
        * GROUP BY절에는 테이블의 행을 그룹화할 때 기준이 되는 컬럼을 지칭한다
        * GROUP BY절에는 컬럼을 하나이상 지정할 수 있다
        * SELECT 절의 컬럼명은 GROUP BY절에서 사용한 컬럼명과 동일한 컬럼명만 사용가능
        * GROUP BY 절을 사용하면 테이블의 행을 그룹화하고 그룹화된 각 그룹에 다중행 함수를 적용해서 실행시키고 실행결과를 반환할 수 있다
*/

-- 직종별 사원수를 조회하기
SELECT JOB_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID;

--부서별 사원수를 조회하기
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 근무지별 사원수를 조회하기
SELECT L.CITY, COUNT(*)
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID
GROUP BY L.CITY;

-- 입사년도별 사원수를 조회하기
SELECT TO_CHAR(HIRE_DATE, 'YYYY'), COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY 1;

-- 부서별, 입사년도별 사원수를 조회하기
SELECT DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY'), COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY 1 ASC, 2 ASC;

/*
그룹함수 실행결과를 필터링하기

    SELECT 컬럼명, 그룹함수() 
    FROM 테이블명
    WHERE 조건식
    GROUP BY 컬럼명
    HAVING 조건식
    ORDER BY 컬럼명
    * HAVING절은 GROUP BY절과 함께 사용된다
    * WHERE절의 조건식에는 그룹함수를 사용할 수 없지만, HAVING절의 조건식에는 그룹함수를 사용할 수 있다
*/

-- 부서별 직원수를 조회했을 때 직원수가 10명 이상인 부서의 아이디와 직원수를 조회하기
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 20;

-- 2005년 이전에 입사한 직원들을 부서별로 직원수를 조회하기

SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE < '2005/01/01'
GROUP BY DEPARTMENT_ID;

-- 2005년 이전에 입사한 직원들을 부서별로 직원수를 조회했을 때 직원수가 5명 이상인 부서아이디와 직원수를 조회하기

SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE < '2005/01/01'
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 5; 






















