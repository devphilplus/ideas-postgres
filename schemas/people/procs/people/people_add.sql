create or replace procedure people_add (
    p_people_id people.people.id%type,
    p_given_name people.people.given_name%type,
    p_middle_name people.people.middle_name%type,
    p_family_name people.people.family_name%type,
    p_prefix people.people.prefix%type,
    p_suffix people.people.suffix%type,
    p_gender_id people.people.gender_id%type,
    p_ethnicity_id people.people.ethnicity_id%type,
    p_marital_status_id people.people.marital_status_id%type
)
language plpgsql
as $$
begin
    insert into people.people (
        id,
        active,
        
        given_name,
        middle_name,
        family_name,
        prefix,
        suffix,
        
        gender_id,
        ethnicity_id,
        marital_status_id
    ) values (
        p_people_id,
        true,

        p_given_name,
        p_middle_name,
        p_family_name,
        p_prefix,
        p_suffix,

        p_gender_id,
        p_ethnicity_id,
        p_marital_status_id
    );
end
$$;