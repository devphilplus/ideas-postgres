create procedure client_set_property(
    p_client_id client.clients.id%type,
    p_name client.clients.name%type,
    p_slug client.clients.slug%type,
    p_desc client.clients.description%type
)
language plpgsql
as $$
begin
    update client.clients set
        name = p_name,
        slug = p_slug,
        description = p_desc
    where
        id = p_client_id
    ;
end
$$;

comment on procedure client_set_property is 'update client record';