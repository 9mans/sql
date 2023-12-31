/*
    테이블 생성하기
    
    CREATE TABLE 테이블명 (
        컬럼명 데이터 타입,
        컬럼명 데이터 타입,
        컬럼명 데이터 타입(사이즈),
        컬럼명 데이터 타입 DEFAULT 기본값
    );
    
*/

/*
    CREATE TABLE
        테이블을 생성시키는 SQL 명령어
    SAMPLE_BOOKS 
        새로 생성한 테이블 이름
    BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE, BOOK_STOCK, BOOK_REG_DATE
        새로 생성한 테이블의 컬럼명
    NUMBER
        해당 컬럼의 데이터타입을 숫자형으로 지정한다
    VARCHAR2
        해당 컬럼의 데이터타입을 가변길이문자형으로 지정한다
    DATE
        해당 컬럼의 데이터타입을 날짜형으로 지정한다
    PRIMARY KEY
        해당 컬럼은 테이블에서 행을 식별하기 위한 값을 가지는 기본키 컬럼으로 지정한다
        해당 컬럼은 NULL을 허용하지 않으며 값은 테이블 전체에서 고유하다
    NOT NULL
        해당 컬럼은 NULL인 상태를 가질 수 없다
    DEFAULT 10 
        새로운 행을 추가할 때 해당 컬럼에 값을 지정하지 않으면 10이 기본값으로 저장된다
    DEFAULT SYSDATE
        새로운 행을 추가할 때 해당 컬럼에 값을 지정하지 않으면 시스템의 현재 날짜가 저장된다
*/
CREATE TABLE SAMPLE_BOOKS (
    BOOK_NO         NUMBER(6) PRIMARY KEY,
    BOOK_TITLE      VARCHAR2(255) NOT NULL,
    BOOK_WRITER     VARCHAR2(255),
    BOOK_PRICE      NUMBER(7, 0) NOT NULL,
    BOOK_STOCK      NUMBER(3, 0) DEFAULT 10,
    BOOK_REG_DATE   DATE         DEFAULT SYSDATE
);

/*
    테이블에 신규 행 추가하기
    
    INSERT INTO 테이블명 (컬럼명, 컬럼명, 컬럼명)
    VALUES              (값, 값, 값);
    * 신규 행을 추가할 때 값이 저장될 컬럼을 직접 나열하는 방식이다
    * 생략된 컬럼에는 NULL 값이 저장되거나, DEFUALT 값이 저장된다
    * 테이블의 컬럼 순서와 상관없이 지정된 컬럼과 같은 순서로 값을 저장한다
    * 실제 개발환경에서는 이 방식을 사용한다
    
    INSERT INTO 테이블명
    VALUES(값, 값, 값, 값, 값, 값);
    * 신규 행을 추가할 때 컬럼명을 생략하는 방식
    * 추가하고자 하는 행의 모든 값을 지정해야 한다
      (저장할 값이 없으면 NULL을 명시해야한다)
    * 테이블의 컬럼 순서와 동일한 순서로 값을 지정해야 한다
    
    
    
    
*/

-- 신규 책 정보 추가하기
INSERT INTO SAMPLE_BOOKS
(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE)
VALUES
(10, '자바의 정석', '남궁성', 32000);

INSERT INTO SAMPLE_BOOKS
(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE, BOOK_STOCK)
VALUES
(12, '이것이 자바다', '신용균', 35000, 25);

INSERT INTO SAMPLE_BOOKS
VALUES
(14, '이펙티브 자바', '심재철', 18000, 10, SYSDATE);

INSERT INTO SAMPLE_BOOKS
VALUES
(16, '점프 투 자바', '박응용', 25000, 12, SYSDATE);

-- INSERT 구문의 실행결과를 데이터 베이스에 영구적으로 저장시킨다 

commit;

/* 데이터 수정하기
    UPDATE 테이블명
    SET 
        컬럼명 = 변경값;
        컬럼명 = 변경값;
        ..
    {WHERE 조건식}
    * 테이블에서 지정된 컬럼의 값을 변경값으로 변경시킨다
    * WHERE 절을 생략하면 테이블의 모든 행에 대해서 지정된 컬럼의 값이 변경  
    * WHERE 절이 있는 경우 조건식을 만족하는 행에 대해서만 지정된 컬럼의 값이 변경된다
  */
  
  -- 도서 테이블에서 책번호가 10인 책의 재고수량을 9권으로 변경하기
UPDATE SAMPLE_BOOKS
SET
    BOOK_STOCK = 9
WHERE BOOK_NO = 10;

-- 도서 테이블에서 책번호가 12번인 책의 가격을 10% 할인하고, 재고수량을 1감소시킨다
UPDATE SAMPLE_BOOKS
SET
    BOOK_PRICE = BOOK_PRICE*0.9, 
    BOOK_STOCK = BOOK_STOCK -1
WHERE BOOK_NO = 12;
    
COMMIT;

/*
    테이블의 행 삭제하기
    DELETE FROM 테이블명
    [WHERE 조건식]
    
    * WHERE 절을 생략하면 테이블의 모든 행이 삭제된다
    * WHERE 절이 있으면 조건식을 만족하는만큼 행만 삭제된다
    * WHERE 절의 조건식은 언제나 특정 행 하나만 삭제되도록 조건식을 작성해야함
        ( 특정 행 하나만 삭제되도록 하기 위해서는 조건식은 해당 테이블에서
          기본키 제약조건이 적용된 컬럼이 검색조건으로 사용되어야한다)
    
    테이블 절단하기
    * 테이블의 데이터를 전부 삭제하고 사용하고 있던 공간을 반납한다
    * 테이블 생성 시점으로 되돌아간다 (되살릴 수 없음)
    TRUNCATE TALBE 테이블명
*/

-- 도서 테이블에서 책번호가 10번인 책정보를 삭제하기
DELETE FROM SAMPLE_BOOKS
WHERE BOOK_NO = 10;

-- 도서 테이블 절단하기
TRUNCATE TABLE SAMPLE_BOOKS;

COMMIT;

