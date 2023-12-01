--ADDING DELIVERY AGENT USING SP

EXEC KITKY_ADMIN.ADD_DELIVERY_AGENT('John', 'Doe', 'agentpass1', 'john.doe@delivery.com', 9876543210, '456 Delivery St', 'Boston', 'Massachusetts', 54321);
EXEC KITKY_ADMIN.ADD_DELIVERY_AGENT('Alice', 'Smith', 'agentpass2', 'alice.smith@delivery.com', 8765432109, '789 Express Ave', 'Boston', 'Massachusetts', 98765);
EXEC KITKY_ADMIN.ADD_DELIVERY_AGENT('Bob', 'Johnson', 'agentpass3', 'bob.johnson@delivery.com', 7654321098, '101 Speedy Lane', 'Chicago', 'Illinois', 12345);
EXEC KITKY_ADMIN.ADD_DELIVERY_AGENT('Emily', 'Williams', 'agentpass4', 'emily.williams@delivery.com', 6543210987, '321 Swift St', 'New York', 'New York', 67890);
EXEC KITKY_ADMIN.ADD_DELIVERY_AGENT('Michael', 'Jones', 'agentpass5', 'michael.jones@delivery.com', 5432109876, '555 Quick Blvd', 'Nashville', 'Florida', 23456);

--ADDING VEHICLE FROM SP

EXEC KITKY_ADMIN.ADD_VEHICLE(111222, 'Car', 9876543210);
EXEC KITKY_ADMIN.ADD_VEHICLE(413222, 'Motorcycle', 9876543210);
EXEC KITKY_ADMIN.ADD_VEHICLE(333444, 'Car', 8765432109);
EXEC KITKY_ADMIN.ADD_VEHICLE(555666, 'Motorcycle', 7654321098);
EXEC KITKY_ADMIN.ADD_VEHICLE(777888, 'Scooter', 6543210987);
EXEC KITKY_ADMIN.ADD_VEHICLE(999000, 'Van', 5432109876);

SELECT * FROM KITKY_ADMIN.V_VEHICLE;
SELECT * FROM KITKY_ADMIN.V_DELIVERY_AGENT;