create procedure org_tree_add(
    p_tenant_id tenants.org_tree.tenant_id%type,
    p_org_id tenants.org_tree.org_id%type,
    p_parent_org_id tenants.org_tree.parent_org_id%type
)
language plpgsql
as $$
begin
    insert into tenants.org_tree (
        tenant_id,
        org_id,
        parent_org_id
    ) values (
        p_tenant_id,
        p_org_id,
        p_parent_org_id
    );
end
$$;

comment on procedure tenants.org_tree_add is 'add a record to the organizational tree';
