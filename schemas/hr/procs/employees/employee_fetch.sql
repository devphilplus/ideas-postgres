create function employee_fetch(
    p_tenant_id hr.employees.tenant_id%type
)
returns table (
    id hr.employees.id%type,
    active hr.employees.active%type,
    given_name people.people.given_name%type,
    middle_name people.people.middle_name%type,
    family_name people.people.family_name%type,
    prefix people.people.prefix%type,
    suffix people.people.suffix%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.active,
        b.given_name,
        b.middle_name,
        b.family_name,
        b.prefix,
        b.suffix
    from hr.employees a
        join people.people b
            on a.people_id = b.id
    where
        a.tenant_id = p_tenant_id
    ;
end
$$;

comment on function employee_fetch is 'retrieve employees by tenant';