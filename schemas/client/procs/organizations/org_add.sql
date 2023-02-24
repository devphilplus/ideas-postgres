create procedure org_add(
    p_client_id client.organizations.client_id%type,
    p_org_id client.organizations.id%type,
    p_name client.organizations.name%type,
    p_slug client.organizations.slug%type,
    p_desc client.organizations.description%type
)
language plpgsql
as $$
begin
    insert into client.organizations (
        id,
        client_id,
        name,
        slug,
        description
    ) values (
        p_org_id,
        p_client_id,
        p_name,
        p_slug,
        p_desc
    );
end
$$;