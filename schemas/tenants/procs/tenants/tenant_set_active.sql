create procedure tenant_set_active(
    p_tenant_id tenants.tenants.id%type,
    p_active tenants.tenants.active%type
)
language plpgsql
as $$
begin
    update tenants.tenants set
        active = p_active
    where
        id = p_tenant_id
    ;
end
$$;

comment on procedure tenant_set_active is 'set tenant record to active';