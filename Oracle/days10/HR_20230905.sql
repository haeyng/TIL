
select employee_id, first_name, last_name,
        manager_id, department_id
    from employees
    where department_id not in( --anti join
                                select department_id
                                from departments
                                where location_id = 1700
                              );
    
select *
from tabs;

select *
from locations
where location_id = 1700;
    
    
--semi join
select * 
from departments d
where EXISTS
    (select * 
    from employees e
    where d.department_id = e.department_id
    and e.salary > 2500 --2500 이상 받는 부서가 있는 곳을 조회
    );
    
    
    
    