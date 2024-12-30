use try;
SELECT * FROM employee_audit;
select * from employees;

CREATE TABLE employees ( 
Employee_id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR (100), 
position VARCHAR (100), salary DECIMAL (10, 2), hire_date DATE 
); 
CREATE TABLE employee_audit ( 
audit_id INT AUTO_INCREMENT PRIMARY KEY, 
employee_id INT, 
name VARCHAR 
(100), 
position VARCHAR (100), salary DECIMAL (10, 2), hire_date DATE, 
action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
); 
delimiter //
create trigger audit after insert on employees for each row
begin 
     insert into employee_audit(employee_id,name,position,salary,hire_date,action_date) value(new.employee_id,new.name,new.position,new.salary,new.hire_date,now());
end //
delimiter ;

delimiter //
create procedure add_employee(in e_name varchar(100),in e_position varchar(100),in e_salary decimal(7,2),in e_hire_date date) 
begin 
  insert into employees(employee_id,name,position,salary,hire_date) values (employee_id,e_name,e_position,e_salary,e_hire_date);
  end //
  delimiter ;
       
     
