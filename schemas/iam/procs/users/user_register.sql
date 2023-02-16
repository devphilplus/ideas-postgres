create procedure user_register(
    p_register_id uuid,
    p_email common.email_address
)
language plpgsql
as $$
begin
    insert into iam.registrations values (
        id,
        active,
        email,
        is_verified
    ) values (
        p_register_id,
        true,
        p_email,
        false
    );
end
$$;