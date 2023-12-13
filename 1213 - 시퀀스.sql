/*
    시퀀스
        일련번호를 제공하는 오라클 객체
        
    생성하기
        CREATE SEQUENCE 시퀀스명;
    
    삭제하기
        DROP SEQUENCE 시퀀스명;
    
    수정하기
        ALTER SEQUENCE 시퀀스명
        
     시퀀스 생성 예시   
        CREATE SEQUENCE 시퀀스명
        * 시작값:1, 증가치:1 최소값:1 최대값:999999999999999999999
        * 캐시사이즈: 20
        
       CREATE SEQUENCE 시퀀스명
            START WITH      1000
            INCREMENT BY  100
            NOCACHE;
       * 시작값: 1000, 증가치: 100 최소값: 1 최대값:999999999999999999999
       * 캐시 사용하지 않음
        
*/

-- 새로운 시퀀스 생성하기
CREATE SEQUENCE BOOKS_SEQ;

SELECT BOOKS_SEQ.NEXTVAL
FROM DUAL;

SELECT BOOKS_SEQ.CURRVAL
FROM DUAL;





-- INSERT 구문에서 시퀀스 활용하기
INSERT INTO SAMPLE_BOOKS
(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE)
VALUES
(BOOKS_SEQ.NEXTVAL, '시퀀스활용하기', '홍길동', 10000);

COMMIT;


-- CURRVAL 사용 예)
--INSERT INTO SAMPLE_BOOKS
--(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE, BOOK_IMAGE_NAME)
--VALUES
--(BOOKS_SEQ.NEXTVAL, '시퀀스활용하기', '홍길동', 10000, BOOKS_SEQ.CURRVAL || '.png');


 
