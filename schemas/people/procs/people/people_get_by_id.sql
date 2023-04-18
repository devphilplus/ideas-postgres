create function people_get_by_id(
    p_people_id people.people.id%type
)
returns table (
    id people.people.id%type,
    active people.people.active%type,
    given_name people.people.given_name%type,
    middle_name people.people.middle_name%type,
    family_name people.people.family_name%type,
    prefix people.people.prefix%type,
    suffix people.people.suffix%type,
    gender_id people.people.gender_id%type,
    ethnicity_id people.people.ethnicity_id%type,
    marital_status_id people.people.marital_status_id%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.active,
        a.given_name,
        a.middle_name,
        a.family_name,
        a.prefix,
        a.suffix,
        a.gender_id,
        a.ethnicity_id,
        a.marital_status_id
    from people.people a
    where
        a.id = p_people_id
    ;
end
$$;

comment on function people_get_by_id is 'retrieve people record by people id';