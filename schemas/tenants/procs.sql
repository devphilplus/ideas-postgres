/**
 * tenant management schema
 */
set schema 'tenants';


\ir procs/tenants/tenant_add.sql
\ir procs/tenants/tenant_update.sql
\ir procs/tenants/tenant_by_id.sql
\ir procs/tenants/tenant_by_name.sql
\ir procs/tenants/tenant_set_active.sql