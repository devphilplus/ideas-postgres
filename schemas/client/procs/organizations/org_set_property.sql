create procedure org_set_property(
    p_org_id client.organizations.id%type,
    p_name client.organizations.name%type,
    p_slug client.organizations.slug%type,
    p_desc client.organizations.description%type
)
language plpgsql
as $$
begin
    update client.organizations set
        name = p_name,
        slug = p_slug,
        description = p_desc
    where
        id = p_org_id
    ;
end
$$;