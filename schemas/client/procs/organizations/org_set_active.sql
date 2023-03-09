create procedure org_set_active(
    p_org_id client.organizations.id%type,
    p_active client.organizations.active%type
)
language plpgsql
as $$
begin
    update client.organizations set
        active = p_active
    where
        id = p_org_id
    ;
end
$$;

comment on procedure org_set_active is 'set organization record to active';