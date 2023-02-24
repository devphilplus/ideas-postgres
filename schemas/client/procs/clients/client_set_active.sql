create procedure client_set_active(
    p_client_id client.clients.id%type,
    p_active client.clients.active%type
)
language plpgsql
as $$
begin
    update client.clients set
        active = p_active
    where
        id = p_client_id
    ;
end
$$;