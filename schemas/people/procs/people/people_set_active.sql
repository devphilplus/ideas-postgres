create procedure people_set_active(
    p_people_id people.people.id%type,
    p_active people.people.active%type
)
language plpsql
as $$
begin
    update people.people set
        active = p_active
    where
        id = p_people_id
    ;
end
$$;