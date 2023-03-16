create function client_by_name(
    p_name client.clients.name%type
)
return table (
    id client.clients.id%type,
    name client.clients.name%type
)
as $$
begin
    return query
    select
        a.id,
        a.name
    from client.clients a
    where
        a.name = p_name
    ;
end
$$;