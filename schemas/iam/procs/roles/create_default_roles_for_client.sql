create procedure create_default_roles_for_client (
    p_client_id client.clients.id%type
)
language plpgsql
as $$
declare
    p_role_id iam.roles.id%type;
begin
    p_role_id := public.gen_random_uuid();

    call iam.role_add(
        p_client_id,
        p_role_id,
        'default',
        'default',
        'default client role'
    );

    call iam.role_set_active(
        p_role_id,
        true
    );
end
$$;

comment on procedure create_default_roles_for_client is 'create default role for client';