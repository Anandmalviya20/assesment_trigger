use try;
-- Creating the 'employees' table to store employee details
CREATE TABLE employees ( 
Employee_id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR (100), 
position VARCHAR (100), salary DECIMAL (10, 2), hire_date DATE 
); 

--Creating the 'employee_audit' table to insert in auditing purposes
CREATE TABLE employee_audit ( 
audit_id INT AUTO_INCREMENT PRIMARY KEY, 
employee_id INT, 
name VARCHAR 
(100), 
position VARCHAR (100), salary DECIMAL (10, 2), hire_date DATE, 
action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
); 

-- Creating a trigger to automatically log new employee insert into 'employee_audit'
delimiter //
create trigger audit after insert on employees for each row
begin 
     insert into employee_audit(employee_id,name,position,salary,hire_date,action_date) value(new.employee_id,new.name,new.position,new.salary,new.hire_date,now());
end //
delimiter ;

--create a Store procedure to  insert new employees into the 'employees' table
delimiter //
create procedure add_employee(in e_name varchar(100),in e_position varchar(100),in e_salary decimal(7,2),in e_hire_date date) 
begin 
  insert into employees(employee_id,name,position,salary,hire_date) values (employee_id,e_name,e_position,e_salary,e_hire_date);
  end //
  delimiter ;

--calling the procedure to insert a new employee
CALL add_employee('John Doe', 'Software Engineer', 75000.00, '2024-03-04');     
