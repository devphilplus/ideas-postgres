create procedure role_add(
    p_client_id iam.roles.client_id%type,
    p_id iam.roles.id%type,
    p_name iam.roles.name%type,
    p_slug iam.roles.slug%type,
    p_desc iam.roles.description%type
)
language plpgsql
as $$
begin
    insert into iam.roles (
        id,
        client_id,
        name,
        slug,
        description
    ) values (
        p_id,
        p_client_id,
        p_name,
        p_slug,
        p_desc
    );
end
$$;

comment on procedure role_add is 'create role';