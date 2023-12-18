/*
    PL/SQL
            Procedural language extension to SQL�� ���ڴ�
            
            * Procedural language�� ������ ���α׷��� ���
              ������ ���α׷��� ���� ��������, ����ó��(IF), �ݺ�ó��(LOOP, WHILE, FOR) ���� �����Ѵ�
            * SQL�� ������ ���α׷����� Ȯ���Ų ���̴�
            
    Ư¡
            * DBMS ���ο��� ����Ǵ� ������ ���α׷��̴�
            * BEGIN/END�� ��ϱ����� ���α׷��� ���ȭ�Ѵ�
            * ���ǹ� �ݺ����� ����ؼ� �������� SQL �۾��� ������ �� �ִ�
    ����
            ���ν���(Procedure)
                    * Ư�� �۾��� �����ϴ� �̸��� �ִ� PL/SQL ����̴�
                    * �Ű������� ���� �� �ְ� ������ �� �ִ� PL/SQL ���
                    * ���Ӽ��� ������ �۾� Ȥ�� ���� �ܰ谡 ������ SQL�۾��� ������ �� �ִ�
            �Լ�(Function)
                    * ���ν����� �����ϰ� PL/SQL�� �̿��ؼ� �Ϸ��� SQL �۾��� ó���ϰ� �� ó������� 
                       ���ϰ����� ��ȯ�ϴ� PL/SQL ���α׷�
            Ʈ����(Trigger)
                    * Ư�� ���̺� �������� �߰�/����/���� ���� �����ͺ��� �̺�Ʈ�� �߻��ϸ�
                      DBMS���� �ڵ����� ����ǵ��� PL/SQL�� ������ ���α׷�
*/


/*
    ���ν���
    
    ���� 
    
            CREATE OR REPLACE PROCEDURE ���ν�����
            (������ IN ������Ÿ��,
             ������ IN ������Ÿ��,
             ������ OUT ������Ÿ��, ...)
            IS
                    -- ���� ����
                    ������ ������Ÿ��;
                    ������ ������Ÿ��; = ��;
            BEGIN
                    SQL ���� Ȥ�� PL/SOL �����
                    ...
                    END;
*/


/*
    ���� ���̵� ���޹޾Ƽ� ������ �޿��� �λ��Ű�� ���ν��� �ۼ��ϱ�
    �λ����� �޿��� ���� �ٸ���
            20000�̻� 10%
            10000 �̻� 15%
            �� �ܴ� 20%                                                                                                                                                                                                           

*/

 create or replace NONEDITIONABLE PROCEDURE UPDATE_SALARY
    -- �Ű����� �����ϱ�
    (I_EMP_ID IN NUMBER)
IS
    -- ���� �����ϱ�
    V_EMP_SALARY        EMPLOYEES.SALARY%TYPE;    -- EMPLOYEES���̺��� SALARY�÷��� Ÿ�԰� ������ Ÿ��
    V_INCREASE_RATE     NUMBER(3,2);
BEGIN
    -- �Ű������� ���޹��� �������̵�� ������ �޿��� ��ȸ�ϰ�, ������ �����ϱ�
    SELECT SALARY
    INTO V_EMP_SALARY
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = I_EMP_ID;
    

    -- ������ �޿��� ���� �λ�� �����ϰ� ������ �����ϱ�
    IF V_EMP_SALARY >= 20000    THEN V_INCREASE_RATE := 0.1;
    ELSIF V_EMP_SALARY >= 10000  THEN V_INCREASE_RATE := 0.15;
    ELSE V_INCREASE_RATE := 0.2;
    END IF;
    DBMS_OUTPUT.PUT_LINE('�λ��' ||  V_INCREASE_RATE);

    -- �޿��� �λ��Ű��
    UPDATE EMPLOYEES
    SET
        SALARY = SALARY + TRUNC(SALARY*V_INCREASE_RATE)
    WHERE
        EMPLOYEE_ID = I_EMP_ID;

    -- �����ͺ��̽��� ���������� �ݿ���Ű��
    COMMIT;

END;

EXECUTE UPDATE_SALARY(101);