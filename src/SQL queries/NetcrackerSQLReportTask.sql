create sequence sec_employee_id
  start with 1
  increment by 1
  maxvalue 99999
  minvalue 1;

CREATE TABLE employees
(
    employee_id int,
    employee_name varchar(40),
    PRIMARY KEY(employee_id)
)

CREATE TABLE emp_client_stat
(
    employee_id int,
    "date" date,
    new_clients_count int,
    FOREIGN KEY(employee_id) references employees(employee_id)
)

drop sequence sec_employee_id;
drop table emp_client_stat;
drop table employees;

insert into employees(employee_id, employee_name) values (sec_employee_id.nextval, 'John Johnson');
insert into employees(employee_id, employee_name) values (sec_employee_id.nextval, 'Liam Liamson');
insert into employees(employee_id, employee_name) values (sec_employee_id.nextval, 'Smitty Smithson');

insert into emp_client_stat(employee_id, "date", new_clients_count) values (1, '01-JAN-2023', 10);
insert into emp_client_stat(employee_id, "date", new_clients_count) values (1, '02-JAN-2023', 13);
insert into emp_client_stat(employee_id, "date", new_clients_count) values (1, '03-JAN-2023', 10);
insert into emp_client_stat(employee_id, "date", new_clients_count) values (2, '01-MAR-2023', 20);
insert into emp_client_stat(employee_id, "date", new_clients_count) values (2, '02-MAR-2023', 70);
insert into emp_client_stat(employee_id, "date", new_clients_count) values (2, '03-MAR-2023', 10);
insert into emp_client_stat(employee_id, "date", new_clients_count) values (3, '14-MAR-2023', 800);
insert into emp_client_stat(employee_id, "date", new_clients_count) values (3, '14-MAR-2023', 200);

--REPORT
select e.employee_name, sum(new_clients_count) as "amount of clients"
from emp_client_stat ecs, employees e
where e.employee_id = ecs.employee_id
and extract (month from ecs."date") = 3 -- To filter out any non-March resutls
group by e.employee_name