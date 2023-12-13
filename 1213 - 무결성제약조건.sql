/*
   
    무결성 제약조건
    
        NOT NULL 제약조건
            - 컬럼 단위로 제약조건을 지정한다
            - 해당 컬럼은 NULL 값을 가질 수 없다
            - 입력 폼에 필수입력값에 해당되는 항목은 NOT NULL 제약조건이 적용된 항목이다
            * 회원가입시 아이디, 비밀번호, 이름은 NULL값을 허용하지 않는다
    
    
        UNIQUE 제약조건
            - 컬럼단위 혹은 1개 이상의 컬럼을 합쳐서 제약조건을 지정할 수 있다
            - 해당 컬럼은 테이블 전체에 대해서 고유한 값을 가져야 한다
            - NOT NULL 제약조건이 지정되지 않았다면 NULL 값을 가지는 것은 상관없다
            - 입력폼에서 중복검사를 하는 항목은 UNIQUE 제약조건이 적용된 항목이다
        CREATE TABLE USERS (     
            USER_NO
            USER_ID			VARCHAR2(255) UNIQUE,
            USER_PASSWORD		VARCHAR2(255)	    ,
            USER_NAME		VARCHAR2(255)       ,
            USER_EMAIL		VARCHAR2(255) UNIQUE,
        )
            *회원가입시 중복검사를 한다
        
        CREATE TABLE 수강신청현황 (
            신청번호		NUMBER(8)	,
            신청년도		NUMBER(4)	,
            학기구분		CHAR(1)		,<-- 1:1학기, 2:2학기, S:여름계절학기, W:겨울계절학기
            과정번호		CHAR(4)		,
            학생번호		NUMBER(6)	,
            UNIQUE( 신청년도, 학기구분, 과정번호, 학생번호)
        )
            * 신청년도, 학기구분, 과정번호, 학생번호가 모두 동일한 값을 가지는 다른 행은 저장할 수 없다
        
        
        
        PRIMARY KEY 제약조건
            - 컬럼단위 혹은 1개 이상의 컬럼을 합쳐서 제약조건을 지정할 수 있다
            - 테이블당 하나만 지정할 수 있다
            - PRIMARY KEY 제약조건이 적용된 컬럼은 NULL값을 허용하지 않고 고유한 값을 가져야한다
            - 테이블에서 행을 대표하는 컬럼에 적용하는 제약조건이다
            - PRIMARY KEY 제약조건이 적용된 컬럼은 시퀀스에서 획득한 일련번호를 사용하는 것이 보통이다
        
        CREATE TABLE USERS (
            USER_NO			NUMBER(10)	PRIMARY KEY,
            USER_ID			VARCHAR2(255),
            USER_PASSWORD		VARCHAR2(255),	    
            USER_NAME		VARCHAR2(255),       
            USER_EMAIL		VARCHAR2(255),
        )
        
        FOREIGN KEY 제약조건
            - 컬럼단위로 제약조건을 지정한다
            - FOREIGN KEY 제약조건이 적용된 컬럼의 값은 다른 테이블 혹은 같은 테이블의 특정 컬럼의 값 중에 하나
        CREATE TABLE DEPARTMENTS (
            DEPT_NO		NUMBER(4)	PRIMARY KEY,
            DEPT_NAME	VARCHAR2(255)	NOT NULL,
            ...
        )
        
        CREATE TABLE EMPLOYEES (
            EMP_NO
            EMP_NAME
            DEPT_NO		NUMBER(4)	REFERENCES DEPARTMENTS(DEPT_NO) -- 직원의 소속 부서 번호
        )
        * EMPLOYEES의 DEPT_NO 컬럼은 DEPARTMENTS의 DEPT_NO 컬럼의 값을 참조하는 컬럼이다
        * EMPLOYEES의 DEPT_NO 컬럼에는 참조하고 있는 컬럼이 가지고 있는 값만 허용된다
        * EMPLOYEES의 DEPT_NO 컬럼에 NOT NULL 제약조건이 적용되어 있지 않은 경우 NULL값을 저장하는 것은 상관없다
        * FOREIGN KEY 제약조건으로 참조되는 컬럼은 반드시 PRIMARY KEY 제약조건 혹은 UNIQUE 제약조건이 적용되어 있어야 한다
        
        
        CHECK 제약조건
            - 컬럼단위로 제약조건을 지정한다
            - 제시된 조건식을 만족하는 값만 컬럼에 저장가능하게 한다
        
        CREATE TABLE USERS (
             USER_ID
             USER_NAME
            USER_GENDER     CHAR(1)         CHECK (USER_GENDER IN ('F', 'M')), --성별은 F와 M 둘 중에ㅐ 하나만 가능하다
            USER_AGE            NUMBER(3)    CHECK (USER_AGE >= 1 AND USER_AGE < 150)   
        
        )
        
---------------------------------------------------------------------------------------------------------------------

    제약조건 지정하기
         
*/

/*
    고객정보를 저장하는 테이블 정의하기
    
    컬럼구성
        고객번호                 PRIMARY KEY
        고객아이디              NOT NULL, UNIQUE
        고객이름                 NOT NULL
        고객비밀번호           NOT NULL
        고객이메일              UNIQUE
        고객연락처              NOT NULL
        고객성별                 CHECK
        우편번호
        주소1
        주소2
        탈퇴여부                 CHECK
        등록일
        최종수정일
*/

CREATE TABLE SAMPLE_CUSTOMERS (
        NO                    NUMBER(4),
        ID                      VARCHAR2(100)             CONSTRAINT CUST_ID_NN NOT NULL,
        NAME                VARCHAR2(100)             CONSTRAINT CUST_NAME_NN NOT NULL,
        PASSWORD       VARCHAR2(100)             CONSTRAINT CUST_PWD_NN NOT NULL,
        EMAIL                VARCHAR2(255),
        TEL                    VARCHAR2(100)             CONSTRAINT CUST_TEL_NN NOT NULL,
        GENDER            CHAR(1), 
        POSTAL_CODE  VARCHAR2(20),
        ADDRESS1        VARCHAR2(255),
        ADDRESS2        VARCHAR2(255),
        DELETED           CHAR(1)                         DEFAULT 'N',
        REG_DATE         DATE                              DEFAULT SYSDATE,
        UPDATE_DATE   DATE                              DEFAULT SYSDATE,
        
        CONSTRAINT CUST_NO_PK PRIMARY KEY (NO),
        CONSTRAINT CUST_ID_UK UNIQUE (ID),

        CONSTRAINT CUST_EMAIL_UK UNIQUE (EMAIL),
        CONSTRAINT CUST_GENDER_CK CHECK (GENDER IN ('F', 'M')),
        CONSTRAINT CUST_DELETED_CK CHECK (DELETED IN ('Y', 'N'))
);

CREATE SEQUENCE CUSTOMERS_SEQ
    START WITH 1000
    NOCACHE;


INSERT INTO SAMPLE_CUSTOMERS
(NO, ID, NAME, PASSWORD, TEL, GENDER)
VALUES
(CUSTOMERS_SEQ.NEXTVAL, 'HONG', '홍길동', 'zxcv1234', '010-1111-1111', 'M');






