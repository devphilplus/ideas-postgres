create procedure register(
    p_id iam.registrations.id%type,
    p_email iam.registrations.email%type,
    p_token iam.registrations.toke%type
)
language plpgsql
as $$
begin
    insert into iam.registrations (
        id,
        email,
        token
    ) values (
        p_id,
        p_email,
        p_token
    );
end
$$;
