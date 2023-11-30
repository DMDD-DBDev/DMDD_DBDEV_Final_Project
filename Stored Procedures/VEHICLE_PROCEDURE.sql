

SET SERVEROUTPUT ON;


    CREATE OR REPLACE PROCEDURE add_vehicle (
        IN_VEHICLE_NUMBER NUMBER,
        IN_TYPE VARCHAR2,
        IN_CONTACT_NO NUMBER
    ) AS
        V_AGENT_ID NUMBER;
        v_count NUMBER;
        e_unique_id EXCEPTION;
    
    BEGIN
        -- Attempt to fetch the VEHICLE_ID from DELIVERY_AGENT table
        SELECT AGENT_ID INTO V_AGENT_ID FROM DELIVERY_AGENT WHERE CONTACT_NO = IN_CONTACT_NO;
    
        -- Insert data into the VEHICLE table using a sequence for VEHICLE_ID
        INSERT INTO VEHICLE (VEHICLE_ID, VEHICLE_NUMBER, TYPE, AGENT_ID)
        VALUES (DELIVERY_VEHICLE_SEQ.NEXTVAL, 
        IN_VEHICLE_NUMBER, 
        INITCAP(IN_TYPE), 
        V_AGENT_ID);
    
        -- Commit the transaction
        COMMIT;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- Handle exception if no data is found
            DBMS_OUTPUT.PUT_LINE('Vehicle not found');
        WHEN OTHERS THEN
            -- Handle other exceptions and print the error message
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
    END add_vehicle;
    /
    
    
  
  
  -- Execute add_vehicle procedure with dummy data
BEGIN
    add_vehicle(122, 'Compact', 9876543210);
    add_vehicle(222, 'SUV', 8765432109);
END;
/  




