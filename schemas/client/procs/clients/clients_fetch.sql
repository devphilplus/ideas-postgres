create function clients_fetch()
returns table (
    id client.clients.id%type,
    active client.clients.active%type,
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
    ;
end
$$;