MySQL Database of Banking System
This database solution optimizes customer transactions and enhances scalability.
GOAL - The goal of the Project is to design, develop, and implement a structured and efficient relational database that simulates real-world banking systems and operations such as customer management, account handling, transactions, and reporting. It includes data modeling, table creation, constraints, and data insertion.

PROBLEMS - 
1)Ensuring data integrity - Use of constraints, triggers, and transactions.
2)Handling large data and query optimization - Use of indexes, optimize joins, and avoid suboptimal queries.
3)Implementing Relationships Between Tables - Use of foreign keys to maintain relationship between tables and clearly define primary keys to uniquely identifying the data in table.

TOOLS USED-MySQL Workbench 
ER DIAGRAM-This ER diagram represents a database of a banking system which is shows entities, relationships and attributes between them.
Entities & Their Attributes -
✅ trandetails → Stores transaction details
- Primary Key: tnumber (transaction number)
- Linked to: account (via acnumber)
✅ account → Stores customer accounts
- Primary Key: acnumber
- Linked to: trandetails (via acnumber), branch (via bid), customer (via custid)
✅ branch → Stores branch information
- Primary Key: bid
- Linked to: account (via bid)
✅ loan → Stores loan details
- Primary Key: Composite key (custid, bid)
- Linked to: customer (via custid), branch (via bid)
✅ customer → Stores customer details
- Primary Key: custid
- Linked to: account (via custid), loan (via custid)
- ![Image](https://github.com/user-attachments/assets/aa4fc819-400c-4e16-b26b-4b5df872138e)
- ![Screenshot 2025-05-03 150353](https://github.com/user-attachments/assets/c437cbd4-d732-4c8d-83ca-b860d28161b5)


OVERVIEW OF RELATIONSHIP-
- Customers hold accounts and take loans
- Accounts belong to branches
- Transactions are associated with accounts
This diagram effectively models a banking system’s data flow.


