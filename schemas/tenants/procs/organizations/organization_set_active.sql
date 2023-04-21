create procedure organization_set_active(
    p_org_id tenants.organizations.id%type,
    p_active tenants.organizations.active%type
)
language plpgsql
as $$
begin
    update tenants.organizations set
        active = p_active
    where
        id = p_org_id
    ;
end
$$;

comment on procedure tenants.organization_set_active is 'toggle organization active status';