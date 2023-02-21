create function register_get_info(
    p_token iam.registrations.token%type
)
returns table (
    id iam.registrations.id%type,
    email iam.registrations.email%type,
    created iam.registrations.created%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.email,
        a.created
    from iam.registrations a
    where
        token = p_token
        and is_verified = false
    ;
end
$$;