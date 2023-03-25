create procedure role_add(
    p_tenant_id iam.roles.tenant_id%type,
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
        tenant_id,
        name,
        slug,
        description
    ) values (
        p_id,
        p_tenant_id,
        p_name,
        p_slug,
        p_desc
    );
end
$$;

comment on procedure role_add is 'create role';