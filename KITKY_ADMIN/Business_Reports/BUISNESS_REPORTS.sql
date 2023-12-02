

--Total salary earned by the Driver. This is derived by calculating the sum of the tips received and 30% of each order amount. 


CREATE OR REPLACE VIEW V_DRIVER_EARNING AS
SELECT
    D.AGENT_ID,
    D.FIRST_NAME || ' ' || D.LAST_NAME AS NAME,
    TRUNC(CALCULATE_DRIVER_EARNING(D.AGENT_ID), 3) AS TOTAL_EARNING
FROM
    DELIVERY_AGENT D
LEFT JOIN
    ORDERS O ON D.AGENT_ID = O.AGENT_ID
ORDER BY
    TOTAL_EARNING;



--TOTAL NUMBER OF ORDERS CANCELLED AND FEEDBACK FOR THOSE CANCELLED ORDERS
CREATE OR REPLACE VIEW V_CANCELLED_ORDERS
AS
SELECT OT.ORDER_ID, TRUNC(DATE_TIME) ORDER_DT, OT.ORDER_STATUS, O.FEEDBACK
FROM ORDER_TRACKING OT JOIN ORDERS O ON OT.ORDER_ID = O.ORDER_ID
WHERE OT.ORDER_STATUS = 'CANCELLED';

--TOTAL ORDERS PLACED PER DAY
CREATE OR REPLACE VIEW V_ORDERS_PLACED_PERDAY
AS
SELECT TRUNC(DATE_TIME) ORDER_DT, COUNT(DISTINCT(ORDER_ID)) TOTAL_ORDERS  FROM ORDER_TRACKING
GROUP BY TRUNC(DATE_TIME)
ORDER BY TRUNC(DATE_TIME);

--TOTAL NUMBER OF DRIVERS AND CUSTOMERS CURRENTLY
CREATE OR REPLACE VIEW V_TOTAL_CUST_AGENT
AS
SELECT COUNT(D.AGENT_ID) TOTAL_DRIVERS, COUNT(C.CUST_ID) TOTAL_CUSTOMERS
FROM CUSTOMER C JOIN ORDERS O ON C.CUST_ID = O.CUST_ID JOIN DELIVERY_AGENT D ON O.AGENT_ID = D.AGENT_ID;

---View to Display Driver Feedback Summary for all orders: 
CREATE OR REPLACE VIEW V_driver_feedback_summary 
AS 
SELECT 
  a.agent_id, 
  a.first_name || ' ' || a.last_name AS NAME,
  AVG(o.rating) AS average_rating, 
  COUNT(o.feedback) AS feedback_count 
FROM delivery_agent a 
LEFT JOIN orders o ON a.agent_id = o.agent_id 
GROUP BY a.agent_id, a.first_name, a.last_name order by agent_id; 

--Agent Vehicle Assignments -This view specifically focuses on the vehicle assignments for delivery agents, providing a clear mapping between agents and their assigned vehicles. 

CREATE OR REPLACE VIEW V_agent_vehicle_assignments 
AS 
SELECT 
  a.agent_id,
  a.first_name || ' ' || a.last_name as name,
  v.vehicle_id, 
  v.vehicle_number, 
  v.type 
FROM DELIVERY_AGENT a 
JOIN VEHICLE v ON a.agent_id = v.agent_id; 


--views for all tables

CREATE OR REPLACE VIEW V_ITEM
AS
select * from  item;

CREATE OR REPLACE VIEW V_ORDER_TRACKING
AS
select * from  ORDER_TRACKING;

CREATE OR REPLACE VIEW V_ORDERS
AS
select * from  orders;

CREATE OR REPLACE VIEW V_VEHICLE
AS
select * from  VEHICLE;

CREATE OR REPLACE VIEW V_SAVED_ADDRESSES
AS
select * from  saved_addresses;

CREATE OR REPLACE VIEW V_CUSTOMER
AS
select * from  customer;

CREATE OR REPLACE VIEW V_DELIVERY_AGENT
AS
select * from  delivery_agent;



--VIEWING ALL VIEWS
--select * from v_driver_earning;
--SELECT * FROM V_CANCELLED_ORDERS;
--SELECT * FROM V_ORDERS_PLACED_PERDAY;
--SELECT * FROM V_TOTAL_CUST_AGENT;
--select * from V_driver_feedback_summary; 
--select * from V_agent_vehicle_assignments; 
--select * from V_ITEM;
--SELECT * FROM V_ORDER_TRACKING;
--select * from V_ORDERS;
--select * from V_VEHICLE;
--select * from V_SAVED_ADDRESSES;
--select * from V_CUSTOMER;
--select * from V_DELIVERY_AGENT;

