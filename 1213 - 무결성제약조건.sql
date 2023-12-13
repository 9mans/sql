/*
   
    ���Ἲ ��������
    
        NOT NULL ��������
            - �÷� ������ ���������� �����Ѵ�
            - �ش� �÷��� NULL ���� ���� �� ����
            - �Է� ���� �ʼ��Է°��� �ش�Ǵ� �׸��� NOT NULL ���������� ����� �׸��̴�
            * ȸ�����Խ� ���̵�, ��й�ȣ, �̸��� NULL���� ������� �ʴ´�
    
    
        UNIQUE ��������
            - �÷����� Ȥ�� 1�� �̻��� �÷��� ���ļ� ���������� ������ �� �ִ�
            - �ش� �÷��� ���̺� ��ü�� ���ؼ� ������ ���� ������ �Ѵ�
            - NOT NULL ���������� �������� �ʾҴٸ� NULL ���� ������ ���� �������
            - �Է������� �ߺ��˻縦 �ϴ� �׸��� UNIQUE ���������� ����� �׸��̴�
        CREATE TABLE USERS (     
            USER_NO
            USER_ID			VARCHAR2(255) UNIQUE,
            USER_PASSWORD		VARCHAR2(255)	    ,
            USER_NAME		VARCHAR2(255)       ,
            USER_EMAIL		VARCHAR2(255) UNIQUE,
        )
            *ȸ�����Խ� �ߺ��˻縦 �Ѵ�
        
        CREATE TABLE ������û��Ȳ (
            ��û��ȣ		NUMBER(8)	,
            ��û�⵵		NUMBER(4)	,
            �бⱸ��		CHAR(1)		,<-- 1:1�б�, 2:2�б�, S:���������б�, W:�ܿ�����б�
            ������ȣ		CHAR(4)		,
            �л���ȣ		NUMBER(6)	,
            UNIQUE( ��û�⵵, �бⱸ��, ������ȣ, �л���ȣ)
        )
            * ��û�⵵, �бⱸ��, ������ȣ, �л���ȣ�� ��� ������ ���� ������ �ٸ� ���� ������ �� ����
        
        
        
        PRIMARY KEY ��������
            - �÷����� Ȥ�� 1�� �̻��� �÷��� ���ļ� ���������� ������ �� �ִ�
            - ���̺�� �ϳ��� ������ �� �ִ�
            - PRIMARY KEY ���������� ����� �÷��� NULL���� ������� �ʰ� ������ ���� �������Ѵ�
            - ���̺��� ���� ��ǥ�ϴ� �÷��� �����ϴ� ���������̴�
            - PRIMARY KEY ���������� ����� �÷��� ���������� ȹ���� �Ϸù�ȣ�� ����ϴ� ���� �����̴�
        
        CREATE TABLE USERS (
            USER_NO			NUMBER(10)	PRIMARY KEY,
            USER_ID			VARCHAR2(255),
            USER_PASSWORD		VARCHAR2(255),	    
            USER_NAME		VARCHAR2(255),       
            USER_EMAIL		VARCHAR2(255),
        )
        
        FOREIGN KEY ��������
            - �÷������� ���������� �����Ѵ�
            - FOREIGN KEY ���������� ����� �÷��� ���� �ٸ� ���̺� Ȥ�� ���� ���̺��� Ư�� �÷��� �� �߿� �ϳ�
        CREATE TABLE DEPARTMENTS (
            DEPT_NO		NUMBER(4)	PRIMARY KEY,
            DEPT_NAME	VARCHAR2(255)	NOT NULL,
            ...
        )
        
        CREATE TABLE EMPLOYEES (
            EMP_NO
            EMP_NAME
            DEPT_NO		NUMBER(4)	REFERENCES DEPARTMENTS(DEPT_NO) -- ������ �Ҽ� �μ� ��ȣ
        )
        * EMPLOYEES�� DEPT_NO �÷��� DEPARTMENTS�� DEPT_NO �÷��� ���� �����ϴ� �÷��̴�
        * EMPLOYEES�� DEPT_NO �÷����� �����ϰ� �ִ� �÷��� ������ �ִ� ���� ���ȴ�
        * EMPLOYEES�� DEPT_NO �÷��� NOT NULL ���������� ����Ǿ� ���� ���� ��� NULL���� �����ϴ� ���� �������
        * FOREIGN KEY ������������ �����Ǵ� �÷��� �ݵ�� PRIMARY KEY �������� Ȥ�� UNIQUE ���������� ����Ǿ� �־�� �Ѵ�
        
        
        CHECK ��������
            - �÷������� ���������� �����Ѵ�
            - ���õ� ���ǽ��� �����ϴ� ���� �÷��� ���尡���ϰ� �Ѵ�
        
        CREATE TABLE USERS (
             USER_ID
             USER_NAME
            USER_GENDER     CHAR(1)         CHECK (USER_GENDER IN ('F', 'M')), --������ F�� M �� �߿��� �ϳ��� �����ϴ�
            USER_AGE            NUMBER(3)    CHECK (USER_AGE >= 1 AND USER_AGE < 150)   
        
        )
        
---------------------------------------------------------------------------------------------------------------------

    �������� �����ϱ�
         
*/

/*
    �������� �����ϴ� ���̺� �����ϱ�
    
    �÷�����
        ����ȣ                 PRIMARY KEY
        �����̵�              NOT NULL, UNIQUE
        ���̸�                 NOT NULL
        ����й�ȣ           NOT NULL
        ���̸���              UNIQUE
        ������ó              NOT NULL
        ������                 CHECK
        �����ȣ
        �ּ�1
        �ּ�2
        Ż�𿩺�                 CHECK
        �����
        ����������
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
(CUSTOMERS_SEQ.NEXTVAL, 'HONG', 'ȫ�浿', 'zxcv1234', '010-1111-1111', 'M');






