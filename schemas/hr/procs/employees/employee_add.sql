create procedure employee_add(
    p_tenant_id hr.employees.tenant_id%type,
    p_employee_id hr.employees.id%type,
    p_people_id hr.employees.people_id%type
)
language plpgsql
as $$
begin
    insert into hr.employees (
        id,
        tenant_id,
        people_id
    ) values (
        p_employee_id,
        p_tenant_id,
        p_people_id
    );
end
$$;

comment on procedure employee_add is 'add an employee to tenant';