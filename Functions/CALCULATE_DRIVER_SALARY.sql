CREATE OR REPLACE FUNCTION CALCULATE_DRIVER_EARNING (
    PI_AGENT_ID NUMBER
) RETURN NUMBER
AS
    TOTAL_EARNING NUMBER := 0;
BEGIN
    FOR AGENT_ORDER IN (
        SELECT O.AGENT_ID,
               NVL(SUM(O.TIP_TO_AGENT), 0) + NVL(SUM(0.03 * O.ORDER_ID), 0) AS ORDER_EARNING
          FROM ORDERS O
         WHERE O.AGENT_ID = PI_AGENT_ID
         GROUP BY O.AGENT_ID
    )
    LOOP
        TOTAL_EARNING := AGENT_ORDER.ORDER_EARNING;
    END LOOP;

    RETURN TOTAL_EARNING;
END CALCULATE_DRIVER_EARNING;
/


