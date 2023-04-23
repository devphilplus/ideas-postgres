create procedure org_tree_set_active(
    p_tenant_id tenants.org_tree.tenant_id%type,
    p_org_id tenants.org_tree.org_id%type,
    p_parent_org_id tenants.org_tree.parent_org_id%type,
    p_active tenants.org_tree.active%type
)
language plpgsql
as $$
begin
    update tenants.org_tree set
        active = p_active
    where
        tenant_id = p_tenant_id
        and org_id = p_org_id
        and parent_org_id = p_parent_org_id
    ;
end
$$;

comment on procedure tenants.org_tree_set_active is 'set organization tree active status';