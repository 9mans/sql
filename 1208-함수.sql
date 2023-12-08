
-- ROWID = 데이터의 실제 저장위치 파일위치 블록위치 행위치
SELECT ROWID, DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS;

/*
    문자 함수
        
        lower(컬럼 혹은 표현식) : 소문자로 변환된 값을 반환
        upper(컬럼 혹은 표현식) : 대문자로 변환된 값을 반환
        
        CONCAT(컬럼 혹은 표현식, 컬럼 혹은 표현식) : 두 문자열을 연결해서 반환한다
        
        LENGTH(컬럼 혹은 표현식) : 문자열의 길이를 반환
        
        SUBSTR(컬럼 혹은 표현식, 시작위치, 길이) : 문자열을 시작위치부터 길이만큼 잘라서 반환한다
                                               시작위치는 1부터 (자바는 0)
                                               
        INSTR(컬럼 혹은 표현식, 문자열) : 지정된 문자열의 등장위치를 반환한다   
        
        TRIM(컬럼 혹은 표현식) : 불필요한 좌우 공백을 제거된 문자열을 반환한다
        
        LPAD(컬럼 혹은 표현식, 길이, 문자) : 컬럼 혹은 표현식의 길이가 지정된 길이보다
                                          짧으면 부족한 길이만큼 왼쪽에 지정된 문자가
                                          채워진 문자열이 반환된다
        
        
*/

-- 60번 ㅂ부서에 소속된 직원들의 이름을 소문자, 대문자로 조회하기
SELECT FIRST_NAME, LOWER(FIRST_NAME), UPPER(FIRST_NAME)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 60번 부서에 소속된 직원들의 FIRST_NAME과 LAST_NAME을 연결해서 조회하기
SELECT CONCAT(FIRST_NAME, LAST_NAME)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 60번 부서에 소속된 직원들의 FIRST_NAME과 LAST_NAME을 연결해서 조회하기(자바의 +역할과 비슷함)
SELECT FIRST_NAME || LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 60번 부서에 소속된 직원들의 이름과 이름의 길이를 조회하기
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 이름이 6글자 이상인 모든 직원들의 직원 아이디와 이름을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) >= 6;

-- SAMPLE_BOOKS에서 저자이름을 조회하고, 이름의 첫번째 글자도 조회하기
SELECT BOOK_WRITER, SUBSTR(BOOK_WRITER, 1, 1)
FROM SAMPLE_BOOKS;

-- 전화번호에서 국번만 조회하기
    SELECT SUBSTR('031) 1234- 5678', 1, INSTR('031) 1234- 5678', ')') -1)
    FROM DUAL;

-- DUAL은 오라클에서 제공하는 DUMMY 테이블이다
-- DUAL은 1행 1열짜리 테이블이다
-- 실제 테이블 조회없이 간단한 연산을 수행할 때 사용한다
SELECT *
FROM DUAL;

-- 불필요한 좌우 공백 제거된 문자열 조회하기
SELECT TRIM ('                   HELLO WORLD!                   ')
FROM DUAL;

-- 지정된 길이만큼 문자열의 왼쪽에 '0'을 채워서 조회하기
SELECT LPAD('100', 10, '0')
FROM DUAL;

/*
    숫자 함수
    
    ROUND(컬럼 혹은 표현식, 자리수) : 지정된 자리수까지 반올림한다
    
    TRUNC(컬럼 혹은 표현식, 자리수) : 지정된 자리수까지 남기고 전부 버린다
    
    MOD(숫자1, 숫자2) : 나머지 값을 반환한다
    
    ABS(컬럼 혹은 표현식) : 절대값을 반환한다
    
    CEIL(컬럼 혹은 표현식) : 지정된 값보다 크거나 같은 정수 중에서 가장 작은 정수를 반환한다 
    FLOOR(컬럼 혹은 표현식) : 지정된 값보다 크거나 같은 정수 중에서 가장 큰 정수를 반환한다
    
    
    
    
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

-- 80번 부서에 소속된 직원의 아이디, 이름, 급여에 대한 #을 출력하기
-- # 하나는 1000달러를 나타낸다
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, LPAD('#', TRUNC(SALARY/1000), '#')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

-- 나머지연산
SELECT MOD(10, 4)
FROM DUAL;

SELECT CEIL(1), CEIL(1.1), CEIL(1.5), CEIL(1.9), CEIL(2)
FROM DUAL;

/*
 날짜 함수
 SYSDATE : 시스템의 현재 일자와 시간을 DATE타입으로 변환한다
 SYSTIMESTAMP : 시스템의 현재 일자와 시간을 TMESTAMPP타입으로 반환한다
 ADDMONTHS(날짜, 숫자) : 날짜에 지정된 숫자만큼의 월을 더한 날짜를 반환한다
ECXACT(포맷 FROM 날짜)

    날짜함수 찾아보기
    
*/

-- 시스템의 현재 일자와 시간을 DATE, SYSTIMESTAMP 형으로 조회하기
SECLECT SYSDATE, TIMESTAMP 
FROM DUAL;
       

/*

    변환함수
    
    묵시적 변환
        변환함수를 사용하지 않아도 데이터의 타입이 자동으로 변하는 것이다
        '문자' -> 날짜: '문자'가 유효한 날짜 형식의 문자인 경우 날짜로 변경된다
        '문자' -> 숫자: '문자'가 숫자로만 구성되어 있으면 숫자로 변경된다
        
        SELECT *
        FROM EMPLOYEES
        WHERE HIRE_DATE >= '2005/01/01' AND HIRE_DATE < '2005/07/01';
        * 위의 SQL에서 HIRE_DATE가 DATE 타입의 컬럼이기 때문에 '2005/01/01' 문자가 DATE 타입의 값으로 자동으로 변환된다
        * '2005/01/01' 이나 '2005-01-01'의 형식인 경우만 자동으로 변환된다        
        
        SELECT *
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID = '10';   
        * 위의 SQL문에서 DEPARTMENT_ID가 NUMBER타입이기 때문에 '10'문자가 NUMBER타입으로 자동으로 변환된다
        
        
    명시적 변환
        변환함수를 사용해서 '문자' <--> 날짜, '문자' <--> 숫자 간의 데이터변환을 하는 것이다
        
        TO_DATE('날짜형식의 문자열', '패턴')
        예) TO_DATE('2023/01/01')
            * 문자열이 날짜형식의 텍스트이기 때문에 패턴을 지정하지 않아도 DATE타입으로 변환된다
            TO_DATE('20230101', 'YYYYMMDD')
            * 문자열이 일반적이나 날짜 형식이아닌 경우에는 패턴을 지정해야한다
            
    TO_CHAR(날짜, '포맷')
        날짜를 지정된 포맷형식으로 텍스트를 변환
        날짜 변환 형식
            AM              '오전'
            PM              '오후'
            YYYY, YY        '2022'
            MM              월
            D               1~7 (1:일요일, 7:토요일)
            DAY             요일
            DD              1~31
            HH              12시간제 시간
            HH24            24시간제 시간
            MI              분
            SS              초
        * 날짜 변환 형식은 대소문자를 구분하지 않는다
    
*/

-- 문자를 날짜로 변환하기
SELECT TO_DATE('2023/01/01')
FROM DUAL;

-- 날짜를 문자로 변환하기
SELECT TO_CHAR(SYSDATE, 'YYYY'),
       TO_CHAR(SYSDATE, 'MM'),
       TO_CHAR(SYSDATE, 'DD'),
       TO_CHAR(SYSDATE, 'DAY'),
       TO_CHAR(SYSDATE, 'AM'),
       TO_CHAR(SYSDATE, 'HH')
FROM DUAL;


-- 직원테이블에서 2005년도에 입사한 직원의 아이디, 이름, 입사일자를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2005';

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE --이 구문을 사용하는 것이 더 적합하다
FROM EMPLOYEES
WHERE HIRE_DATE >= '2005/01/01' AND HIRE_DATE < '2006/01/01';

