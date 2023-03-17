create procedure user_client_set_active(
    p_user_id iam.user_clients.user_id%type,
    p_active iam.user_clients.active%type
)
language plpgsql
as $$
begin
    update iam.user_clients set
        active = p_active
    where
        user_id = p_user_id
    ;
end
$$;

comment on procedure user_client_set_active is 'enable user to client';