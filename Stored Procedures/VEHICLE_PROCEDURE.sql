

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
    v_seq_val NUMBER; -- Variable to store the current sequence value
BEGIN
    -- Store the current sequence value in a variable
    SELECT DELIVERY_VEHICLE_SEQ.NEXTVAL INTO v_seq_val FROM DUAL;

    -- Check if the VEHICLE_ID already exists
    SELECT COUNT(1) INTO v_count_id FROM VEHICLE WHERE VEHICLE_ID = v_seq_val;

    IF v_count_id > 0 THEN
        -- If the vehicle ID already exists, raise an exception
        RAISE e_vehicle_exists;
    END IF;

    -- Check if the VEHICLE_NUMBER already exists
    SELECT COUNT(1) INTO v_count_number FROM VEHICLE WHERE VEHICLE_NUMBER = IN_VEHICLE_NUMBER;

    IF v_count_number > 0 THEN
        -- If the vehicle number already exists, raise an exception
        RAISE e_vehicle_exists;
    END IF;

    -- Attempt to fetch the AGENT_ID from DELIVERY_AGENT table
    SELECT AGENT_ID INTO V_AGENT_ID FROM DELIVERY_AGENT WHERE CONTACT_NO = IN_CONTACT_NO;

    -- Insert data into the VEHICLE table using the stored sequence value for VEHICLE_ID
    INSERT INTO VEHICLE (VEHICLE_ID, VEHICLE_NUMBER, TYPE, AGENT_ID)
    VALUES (v_seq_val, IN_VEHICLE_NUMBER, INITCAP(IN_TYPE), V_AGENT_ID);

    -- Commit the transaction
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('VEHICLE ADDED SUCCESSFULLY');

EXCEPTION
    WHEN e_vehicle_exists THEN
        DBMS_OUTPUT.PUT_LINE('VEHICLE ID or NUMBER Already Exists');
    WHEN NO_DATA_FOUND THEN
        -- Handle exception if no data is found
        DBMS_OUTPUT.PUT_LINE('Vehicle not found');
    WHEN OTHERS THEN
        -- Handle other exceptions and print the error message
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END add_vehicle;
/
    
    
  
  
-- Execute add_vehicle procedure with dummy data

EXEC add_vehicle(122221, 'Compact', 9876543210);
  



   





