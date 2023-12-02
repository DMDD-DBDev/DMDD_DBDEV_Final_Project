truncate table item;
truncate table ORDER_TRACKING;
truncate table orders;
truncate table VEHICLE;
truncate table saved_addresses;
truncate table customer;
truncate table delivery_agent;
truncate table order_history;

-- adding customers with stored procedures.

EXEC ADD_CUSTOMER(1234567890, 'John', 'Doe', 'password123', 'john.doe@example.com');
EXEC ADD_CUSTOMER(9876543210, 'Alice', 'Smith', 'securepass', 'alice.smith@example.com');
EXEC ADD_CUSTOMER(5555555555, 'Bob', 'Johnson', 'pass123456', 'bob.johnson@example.com');
EXEC ADD_CUSTOMER(1112223333, 'Emily', 'Williams', 'emily_pass', 'emily.williams@example.com');
EXEC ADD_CUSTOMER(4445556666, 'Michael', 'Jones', 'michael123', 'michael.jones@example.com');



--ADDING SAVED ADDRESSES WITH STORED PROCS

EXEC ADD_SAVED_ADDRESSES('Home', '123 Main St', 'Boston', 'Massachusetts', 12345,1234567890);
EXEC ADD_SAVED_ADDRESSES('Work', '39 west walnut', 'Boston', 'Massachusetts', 02115,1234567890);
EXEC ADD_SAVED_ADDRESSES('Work', '456 Business Ave', 'Chicago', 'Illinois', 54321,9876543210);
EXEC ADD_SAVED_ADDRESSES('Vacation Home', '789 Beach Blvd', 'New York', 'New York', 98765,5555555555);
EXEC ADD_SAVED_ADDRESSES('Home', '101 Dimock street', 'Boston', 'Massachusetts', 11111,1112223333);
EXEC ADD_SAVED_ADDRESSES('Office', '101 Corporate Lane', 'Boston', 'Massachusetts', 11111,1112223333);
EXEC ADD_SAVED_ADDRESSES('Friends Place', '321 Friendship St', 'Nashville', 'Florida', 01234,1234567890);

--ADDING DELIVERY AGENT USING SP

EXEC ADD_DELIVERY_AGENT('John', 'Doe', 'agentpass1', 'john.doe@delivery.com', 9876543210, '456 Delivery St', 'Boston', 'Massachusetts', 54321);
EXEC ADD_DELIVERY_AGENT('Alice', 'Smith', 'agentpass2', 'alice.smith@delivery.com', 8765432109, '789 Express Ave', 'Boston', 'Massachusetts', 98765);
EXEC ADD_DELIVERY_AGENT('Bob', 'Johnson', 'agentpass3', 'bob.johnson@delivery.com', 7654321098, '101 Speedy Lane', 'Chicago', 'Illinois', 12345);
EXEC ADD_DELIVERY_AGENT('Emily', 'Williams', 'agentpass4', 'emily.williams@delivery.com', 6543210987, '321 Swift St', 'New York', 'New York', 67890);
EXEC ADD_DELIVERY_AGENT('Michael', 'Jones', 'agentpass5', 'michael.jones@delivery.com', 5432109876, '555 Quick Blvd', 'Nashville', 'Florida', 23456);

--ADDING VEHICLE FROM SP

EXEC ADD_VEHICLE(111222, 'Car', 9876543210);
EXEC ADD_VEHICLE(413222, 'Motorcycle', 9876543210);
EXEC ADD_VEHICLE(333444, 'Car', 8765432109);
EXEC ADD_VEHICLE(555666, 'Motorcycle', 7654321098);
EXEC ADD_VEHICLE(777888, 'Scooter', 6543210987);
EXEC ADD_VEHICLE(999000, 'Van', 5432109876);


-- ORDER 1
EXEC ADD_ORDER(5555555555, '123 Collection St', 54321, 'New York', 'New York', 98765, '789 Beach Blvd', 'Ken', 8765432109, 'Bob', 'Handle with care', 3);
EXEC ADD_ITEM(1, 'Laptop', 'MEDIUM');
EXEC ADD_ITEM(1, 'Camera', 'SMALL');
EXEC ADD_ORDER_AMOUNT(1);
EXEC ADD_ORDER_TRACKING(1,'MATCHING_DRIVER');
EXEC MATCH_DRIVER(1,1);
EXEC ADD_ORDER_TRACKING(1,'DRIVER_MATCHED');
EXEC UPDATE_PAYMENT_STATUS(1,'FAILED')
EXEC ADD_ORDER_TRACKING(1,'CANCELLED');
EXEC ADD_FEEDBACK(1,'Payment is not user friendly', 4, 5 );


--ORDER 2
EXEC ADD_ORDER(1112223333, '101 Corporate Lane', 11111, 'Massachusetts', 'Boston', 11111, '101 Dimock street', 'king', 4445556666, 'Emily', 'Fragile items',4);
EXEC ADD_ITEM(2, 'Printer', 'LARGE');
EXEC ADD_ITEM(2, 'Headphones', 'SMALL');
EXEC ADD_ORDER_AMOUNT(2);
EXEC ADD_ORDER_TRACKING(2,'MATCHING_DRIVER');
EXEC MATCH_DRIVER(2,2);
EXEC ADD_ORDER_TRACKING(2,'DRIVER_MATCHED');
EXEC UPDATE_PAYMENT_STATUS(2,'SUCCESSFUL')
EXEC ADD_ORDER_TRACKING(2,'PLACED');
EXEC ADD_ORDER_TRACKING(2,'PICKED');
EXEC ADD_ORDER_TRACKING(2,'DELIVERED');
EXEC ADD_FEEDBACK(2,'Good and quick service', 3, 3 );


--ORDER 3
EXEC ADD_ORDER(4445556666, '555 Pickup Lane', 54321, 'Illinois', 'Chicago', 54321, '456 Business Ave', 'Alice', 9876543210, 'Michael', 'Handle with extra care', 2 );
EXEC ADD_ITEM(3, 'Tablet', 'MEDIUM');
EXEC ADD_ORDER_AMOUNT(3);
EXEC ADD_ORDER_TRACKING(3,'MATCHING_DRIVER');
EXEC MATCH_DRIVER(3,3);
EXEC ADD_ORDER_TRACKING(3,'DRIVER_MATCHED');
EXEC ADD_ORDER_TRACKING(3,'PLACED');
EXEC UPDATE_PAYMENT_STATUS(3,'REFUNDED')
EXEC ADD_ORDER_TRACKING(3,'CANCELLED');
EXEC ADD_FEEDBACK(3,'Quick refund,good service', 5, 7 );

--ORDER 4
EXEC ADD_ORDER(9990001111, '39 west walnut', 87654, 'Massachusetts', 'Boston', 02115, '123 Main St', 'John', 1234567890, 'Jude', 'Quick delivery requested', 1 );
EXEC ADD_ITEM(4, 'Document', 'SMALL');
EXEC ADD_ORDER_AMOUNT(4);
EXEC ADD_ORDER_TRACKING(4,'MATCHING_DRIVER');
EXEC ADD_ORDER_TRACKING(4,'CANCELLED');
EXEC ADD_FEEDBACK(4,'No driver matched after waiting for 15 mins, add more drivers',2,0)

--ORDER 5
EXEC ADD_ORDER(4445556666, '321 Friendship St', 11111, 'Florida', 'Nashville', 01234, '789 Speedy St', 'Kane', 2223334444, 'Michael', 'Standard delivery drop in front of door', 5);
EXEC ADD_ITEM(5, 'LunchBox', 'SMALL');
EXEC ADD_ITEM(5,'Medicine', 'SMALL');
EXEC ADD_ORDER_AMOUNT(5);
EXEC ADD_ORDER_TRACKING(5,'CANCELLED')
EXEC ADD_FEEDBACK(5,'Too costly' ,3, 0)

----------------------------------------------------------------------------------------------------






























