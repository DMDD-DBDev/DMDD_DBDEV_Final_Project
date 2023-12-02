# DMDD_DBDEV_Final_Project

## Steps to execute the scripts

* Login to your **ADMIN** user
* Run _**KITKY_ADMIN_SCRIPT.sql**_ from your Admin user to create user: **KITKY_ADMIN**
* Login as **KITKY_ADMIN** with right credentials
* Run the following scripts in the below order under **KITKY_ADMIN** user
    * _**DDL.sql**_
    * _**CALCULATE_DRIVER_SALARY.sql, CALCULATE_ORDER_AMOUNT.sql**_ under KITKY_ADMIN --> Functions
    * _**SAVE_HISTORY_LOG**_ under KITKY_ADMIN --> Triggers
    * _**ALL_STORED_PROCEDURES.sql**_ under KITKY_ADMIN
    * _**VIEWS_SCRIPT.sql**_ under KITKY_ADMIN
    * _**BUSINESS_REPORTS.sql**_ under KITKY_ADMIN --> Business Reports
    * _**USER_CREATION_PACKAGE.sql**_ under KITKY_ADMIN
    * _**USER_MANAGER_DML.sql**_ under USER_MANAGER
    * _**DELIVERY_AGENT_MANAGER_DML.sql**_ under DELIVERY_AGENT_MANAGER
    * _**ORDER_MANAGER_DML.sql**_ under ORDER_MANAGER
    * _**BUSINESS_ANALYST_VIEWS.sql**_ under BUSINESS_ANALYST (To view the views for analysis)
    
* Login as different users to execute the respective procedures to insert data and access views.