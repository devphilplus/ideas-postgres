create function employee_fetch(
    p_tenant_id hr.employees.tenant_id%type
)
returns table (
    id hr.employees.id%type,
    active hr.employees.active%type,
    people_id hr.emploees.people_id%type,
    given_name people.people.given_name%type,
    middle_name people.people.middle_name%type,
    family_name people.people.family_name%type,
    prefix people.people.prefix%type,
    suffix people.people.suffix%type,
    gender_id people.people.gender_id%type,
    ethnicity_id people.people.ethnicity_id%type,
    marital_state_id people.people.marital_state_id%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.active,
        a.people_id,
        b.given_name,
        b.middle_name,
        b.family_name,
        b.prefix,
        b.suffix,
        b.gender_id,
        b.ethnicity_id,
        b.marital_state_id
    from hr.employees a
        join people.people b
            on a.people_id = b.id
    where
        a.tenant_id = p_tenant_id
    ;
end
$$;

comment on function employee_fetch is 'retrieve employees by tenant';