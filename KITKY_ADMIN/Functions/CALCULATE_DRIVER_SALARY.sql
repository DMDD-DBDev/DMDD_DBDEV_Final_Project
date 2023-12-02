-- function to CALCULATE_DRIVER_SALARY


CREATE OR REPLACE FUNCTION CALCULATE_DRIVER_EARNING (
    PI_AGENT_ID NUMBER
) RETURN NUMBER
AS
    TOTAL_EARNING NUMBER := 0;
BEGIN
    SELECT NVL(SUM(O.TIP_TO_AGENT), 0) + NVL(SUM(0.03 * O.ORDER_AMOUNT), 0) AS ORDER_EARNING INTO TOTAL_EARNING
    FROM ORDERS O 
    INNER JOIN
    ORDER_TRACKING OT
    ON O.ORDER_ID = OT.ORDER_ID
    WHERE O.AGENT_ID = PI_AGENT_ID AND OT.ORDER_STATUS = 'DELIVERED'
    GROUP BY O.AGENT_ID;

    RETURN TOTAL_EARNING;
END CALCULATE_DRIVER_EARNING;
/