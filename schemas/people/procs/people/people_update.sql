create procedure people_update(
    p_people_id people.people.id%type,
    p_given_name people.people.given_name%type,
    p_middle_name people.people.middle_name%type,
    p_family_name people.people.family_name%type,
    p_prefix people.people.prefix%type,
    p_suffix people.people.suffix%type,
    p_gender_id people.people.gender_id%type,
    p_ethnicity_id people.people.ethnicity_id%type,
    p_marital_state_id people.people.marital_status_id%type
)
language plpgsql
as $$
begin
    update people.people set
        given_name = p_given_name,
        middle_name = p_middle_name,
        family_name = p_family_name,
        prefix = p_prefix,
        suffix = p_suffix,
        gender_id = p_gender_id,
        enthnicity_id = p_ethnicity_id,
        marital_status_id = p_marital_state_id
    where
        id = p_people_id
    ;
end
$$;

comment on procedure people_update is 'update people record';