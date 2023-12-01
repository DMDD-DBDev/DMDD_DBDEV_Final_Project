SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE add_vehicle (
    IN_VEHICLE_NUMBER NUMBER,
    IN_TYPE VARCHAR2,
    IN_CONTACT_NO NUMBER
) AS
    V_AGENT_ID NUMBER;
    v_count_id NUMBER;
    v_count_number NUMBER;
    e_vehicle_exists EXCEPTION;
    v_seq_val NUMBER;
BEGIN
    SELECT DELIVERY_VEHICLE_SEQ.NEXTVAL INTO v_seq_val FROM DUAL;

    SELECT COUNT(1) INTO v_count_id FROM VEHICLE WHERE VEHICLE_ID = v_seq_val;
    IF v_count_id > 0 THEN
        RAISE e_vehicle_exists;
    END IF;

    SELECT COUNT(1) INTO v_count_number FROM VEHICLE WHERE VEHICLE_NUMBER = IN_VEHICLE_NUMBER;
    IF v_count_number > 0 THEN
        RAISE e_vehicle_exists;
    END IF;

    SELECT AGENT_ID INTO V_AGENT_ID FROM DELIVERY_AGENT WHERE CONTACT_NO = IN_CONTACT_NO;

    INSERT INTO VEHICLE (
        VEHICLE_ID, 
        VEHICLE_NUMBER, 
        TYPE, 
        AGENT_ID
    ) VALUES (
        v_seq_val, 
        IN_VEHICLE_NUMBER, 
        INITCAP(IN_TYPE), 
        V_AGENT_ID
    );

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('VEHICLE ADDED SUCCESSFULLY');
EXCEPTION
    WHEN e_vehicle_exists THEN
        DBMS_OUTPUT.PUT_LINE('VEHICLE ID or NUMBER Already Exists');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Vehicle not found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END add_vehicle;
/