
select * from saved_addresses;
select * from  VEHICLE;

select * from CUSTOMER;
select * from DELIVERY_AGENT;



SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE add_vehicle (
    in_vehicle_id NUMBER,
    in_vehicle_number NUMBER,
    in_type VARCHAR,
    in_agent_id NUMBER
) AS
    v_count NUMBER;
    e_unique_id EXCEPTION;
BEGIN
    -- Check if the vehicle with the given ID already exists
    SELECT COUNT(*) INTO v_count FROM VEHICLE WHERE VEHICLE_ID = in_vehicle_id;

    IF v_count = 0 THEN
        -- If the vehicle doesn't exist, insert a new record
        INSERT INTO VEHICLE (VEHICLE_ID, VEHICLE_NUMBER, TYPE, AGENT_ID)
        VALUES (in_vehicle_id, in_vehicle_number, in_type, in_agent_id);
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




EXEC add_vehicle(in_vehicle_id => 10, in_vehicle_number => 1233, in_type => 'Car', in_agent_id => 1);

SELECT * FROM VEHICLE WHERE VEHICLE_ID = 1;





DECLARE
    v_vehicle_id NUMBER := 13; -- Replace with the desired values
    v_vehicle_number NUMBER := 8877; -- Replace with the desired values
    v_type VARCHAR2(50) := 'Car'; -- Replace with the desired values
    v_contact_no NUMBER := 5432109876; -- Replace with a valid contact number from your DELIVERY_AGENT table
BEGIN
    add_vehicle(v_vehicle_id, v_vehicle_number, v_type, v_contact_no);
END;
/





