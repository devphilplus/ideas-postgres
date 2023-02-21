create procedure register_get_info(
    p_token iam.registrations.token%type
)
language plpgsql
as $$
begin
    select
        email
    from iam.registrations
    where
        token = p_token
        and is_verified = false
    ;
end
$$;