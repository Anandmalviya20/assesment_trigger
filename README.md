# Employee Management System (SQL Project)

## Introduction
This project is an **Employee Management System** built using **MySQL**. It demonstrates the implementation of database design, triggers, and stored procedures to maintain an audit log of employee records.

## Project Overview
The system consists of two tables:
- **employees**: Stores employee details such as name, position, salary, and hire date.
- **employee_audit**: Records every insertion into the `employees` table, capturing changes for auditing purposes.

Additionally, the project includes:
- **A trigger** (`audit`) that logs insertions into the `employee_audit` table.
- **A stored procedure** (`add_employee`) to add new employees efficiently.

## Database Schema

### Employees Table
```sql
CREATE TABLE employees (
  Employee_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  position VARCHAR(100),
  salary DECIMAL(10,2),
  hire_date DATE
);
```

### Employee Audit Table
```sql
CREATE TABLE employee_audit (
  audit_id INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT,
  name VARCHAR(100),
  position VARCHAR(100),
  salary DECIMAL(10,2),
  hire_date DATE,
  action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Triggers
### Audit Trigger
This trigger automatically logs every new employee added to the `employee_audit` table.
```sql
delimiter //
CREATE TRIGGER audit
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
  INSERT INTO employee_audit(employee_id, name, position, salary, hire_date, action_date)
  VALUES (NEW.employee_id, NEW.name, NEW.position, NEW.salary, NEW.hire_date, NOW());
END //
delimiter ;
```

## Stored Procedures
### Add Employee Procedure
This stored procedure simplifies inserting new employee records into the database.
```sql
delimiter //
CREATE PROCEDURE add_employee(
  IN e_name VARCHAR(100),
  IN e_position VARCHAR(100),
  IN e_salary DECIMAL(7,2),
  IN e_hire_date DATE
)
BEGIN
  INSERT INTO employees(name, position, salary, hire_date)
  VALUES (e_name, e_position, e_salary, e_hire_date);
END //
delimiter ;
```

## How to Use
1. **Create the Database**
   ```sql
   CREATE DATABASE employee_db;
   USE employee_db;
   ```
2. **Create Tables** by executing the schema scripts.
3. **Create the Trigger** to maintain an audit log.
4. **Create the Stored Procedure** to insert employees.
5. **Insert an Employee Record**
   ```sql
   CALL add_employee('John Doe', 'Software Engineer', 75000, '2024-03-04');
   ```
6. **Check the Audit Log**
   ```sql
   SELECT * FROM employee_audit;
   ```

## Conclusion
This project showcases how to manage employee records efficiently while maintaining an audit log using triggers and stored procedures in MySQL. It provides a foundational understanding of **database management, automation, and auditing**.

## Author
**Anand Malviya**



