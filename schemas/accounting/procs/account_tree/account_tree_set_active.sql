create procedure account_tree_set_active(
    p_tenant_id accounting.account_tree.tenant_id%type,
    p_account_id accounting.account_tree.account_id%type,
    p_parent_account_id accounting.account_tree.parent_account_id%type,
    p_active accounting.account_tree.active%type
)
language plpgsql
as $$
begin
    update accounting.account_tree set
        active = p_active
    where
        tenant_id = p_tenant_id
        and account_id = p_account_id
        and parent_account_id = p_parent_account_id
    ;
end
$$;

comment on procedure accounting.account_tree_set_active is 'set account tree active status';