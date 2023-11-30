SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE add_vehicle (
    in_vehicle_id NUMBER,
    in_vehicle_number NUMBER,
    in_type VARCHAR2,
    V_CONTACT_NO NUMBER
) AS
    V_AGENT_ID NUMBER;
    v_count NUMBER;
    e_unique_id EXCEPTION;
BEGIN
    SELECT AGENT_ID
    INTO V_AGENT_ID
    FROM DELIVERY_AGENT
    WHERE CONTACT_NO = V_CONTACT_NO; 

    -- Check if the vehicle with the given ID already exists
    SELECT COUNT(*) INTO v_count FROM VEHICLE WHERE VEHICLE_ID = in_vehicle_id;

    IF v_count = 0 THEN
        -- If the vehicle doesn't exist, insert a new record
        INSERT INTO VEHICLE (VEHICLE_ID, VEHICLE_NUMBER, TYPE, AGENT_ID)
        VALUES (in_vehicle_id, in_vehicle_number, in_type, V_AGENT_ID); 
        DBMS_OUTPUT.PUT_LINE('Vehicle Added');
    ELSE
        -- If the vehicle already exists, raise an exception
        RAISE e_unique_id;
    END IF;

    COMMIT;

EXCEPTION
    WHEN e_unique_id THEN
        DBMS_OUTPUT.PUT_LINE('The vehicle with ID ' || in_vehicle_id || ' already exists');
    WHEN OTHERS THEN
        RAISE;
END add_vehicle;
/
















 
    
    
    
    