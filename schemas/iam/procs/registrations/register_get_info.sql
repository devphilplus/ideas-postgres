create function register_get_info(
    p_token iam.registrations.token%type
)
returns table (
    token iam.registrations.token%type,
    email iam.registrations.email%type,
    created iam.registrations.created%type
)
language plpgsql
as $$
begin
    return query
    select
        a.token,
        a.email,
        a.created
    from iam.registrations a
    where
        a.token = p_token
        and a.active = true
        and a.verified is null
    ;
end
$$;