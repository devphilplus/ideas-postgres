create function user_clients_by_client(
    p_client_id iam.user_clients.client_id%type
)
returns table (
    user_id iam.users.id%type,
    email iam.users.email%type,
    active iam.user_clients.active%type
)
language plpgsql
as $$
begin
    return query
    select
        a.user_id,
        b.email,
        a.active
    from iam.user_clients a
        join iam.users b
            on a.user_id = b.id
    where
        a.client_id = p_client_id
        and a.active = true
        and b.active = true
    ;
end
$$;


comment on function user_clients_by_client is 'get users associated with client';