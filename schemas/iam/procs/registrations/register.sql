create procedure register(
    p_id iam.registrations.id%type,
    p_email iam.registrations.email%type,
    p_token iam.registrations.token%type
)
language plpgsql
as $$
begin
    insert into iam.registrations (
        id,
        active,
        email,
        token
    ) values (
        p_id,
        true,
        p_email,
        p_token
    );
end
$$;

comment on procedure register is 'register unverified account';