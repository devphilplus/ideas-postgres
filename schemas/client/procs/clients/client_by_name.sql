create function client_by_name(
    p_name client.clients.name%type
)
returns table (
    id client.clients.id%type,
    active clients.clients.active%type,
    name client.clients.name%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.active,
        a.name
    from client.clients a
    where
        a.name = p_name
    ;
end
$$;