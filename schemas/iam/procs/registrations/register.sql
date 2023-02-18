create procedure register(
    p_id iam.registrations.id%type,
    p_email iam.registrations.email%type
)
language plpgsql
as $$
begin
    insert into iam.registrations (
        id,
        email
    ) values (
        p_id,
        p_email
    );
end
$$;
