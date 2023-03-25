/**
 * identity and access management schema
 */
set schema 'iam';

\ir procs/registrations/register.sql
\ir procs/registrations/register_get_info.sql
\ir procs/registrations/register_complete.sql

\ir procs/users/user_add.sql
\ir procs/users/user_set_active.sql
\ir procs/users/user_set_pw.sql
\ir procs/users/user_authenticate.sql
\ir procs/users/user_by_id.sql
\ir procs/users/user_by_email.sql

\ir procs/roles/role_add.sql
\ir procs/roles/role_set_active.sql
\ir procs/roles/create_default_roles_for_tenant.sql