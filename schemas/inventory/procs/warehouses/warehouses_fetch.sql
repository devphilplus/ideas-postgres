create function warehouses_fetch(
    p_tenant_id inventory.warehouses.tenant_id%type
)
returns table (
    id inventory.warehouses.id%type,
    active inventory.warehouses.active%type,
    name inventory.warehouses.name%type,
    slug inventory.warehouses.slug%type,
    description inventory.warehouses.description%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.active,
        a.name,
        a.slug,
        a.description
    from inventory.warehouses a
    where
        a.tenant_id = p_tenant_id
    ;
end
$$;