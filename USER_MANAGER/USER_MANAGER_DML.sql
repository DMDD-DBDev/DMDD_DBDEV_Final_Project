-- adding customers with stored procedures.

EXEC KITKY_ADMIN.ADD_CUSTOMER(1234567890, 'John', 'Doe', 'password123', 'john.doe@example.com');
EXEC KITKY_ADMIN.ADD_CUSTOMER(9876543210, 'Alice', 'Smith', 'securepass', 'alice.smith@example.com');
EXEC KITKY_ADMIN.ADD_CUSTOMER(5555555555, 'Bob', 'Johnson', 'pass123456', 'bob.johnson@example.com');
EXEC KITKY_ADMIN.ADD_CUSTOMER(1112223333, 'Emily', 'Williams', 'emily_pass', 'emily.williams@example.com');
EXEC KITKY_ADMIN.ADD_CUSTOMER(4445556666, 'Michael', 'Jones', 'michael123', 'michael.jones@example.com');



--ADDING SAVED ADDRESSES WITH STORED PROCS

EXEC KITKY_ADMIN.ADD_SAVED_ADDRESSES('Home', '123 Main St', 'Boston', 'Massachusetts', 12345,1234567890);
EXEC KITKY_ADMIN.ADD_SAVED_ADDRESSES('Work', '39 west walnut', 'Boston', 'Massachusetts', 02115,1234567890);
EXEC KITKY_ADMIN.ADD_SAVED_ADDRESSES('Work', '456 Business Ave', 'Chicago', 'Illinois', 54321,9876543210);
EXEC KITKY_ADMIN.ADD_SAVED_ADDRESSES('Vacation Home', '789 Beach Blvd', 'New York', 'New York', 98765,5555555555);
EXEC KITKY_ADMIN.ADD_SAVED_ADDRESSES('Home', '101 Dimock street', 'Boston', 'Massachusetts', 11111,1112223333);
EXEC KITKY_ADMIN.ADD_SAVED_ADDRESSES('Office', '101 Corporate Lane', 'Boston', 'Massachusetts', 11111,1112223333);
EXEC KITKY_ADMIN.ADD_SAVED_ADDRESSES('Friends Place', '321 Friendship St', 'Nashville', 'Florida', 01234,1234567890);

SELECT * FROM KITKY_ADMIN.V_CUSTOMER;
SELECT * FROM KITKY_ADMIN.V_SAVED_ADDRESSES;