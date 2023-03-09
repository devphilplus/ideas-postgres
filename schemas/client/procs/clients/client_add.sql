create procedure client_add(
    p_client_id client.clients.id%type,
    p_name client.clients.name%type,
    p_slug client.clients.slug%type,
    p_desc client.clients.description%type
)
language plpgsql
as $$
begin
    insert into client.clients (
        id,
        name,
        slug,
        description
    ) values (
        p_client_id,
        p_name,
        p_slug,
        p_desc
    );
end
$$;

comment on procedure client_add is 'add client record';