/**
 * client schema
 */
set schema 'client';

\ir procs/clients/client_add.sql
\ir procs/clients/client_set_active.sql
\ir procs/clients/client_set_property.sql
\ir procs/clients/client_by_name.sql

\ir procs/organizations/org_add.sql
\ir procs/organizations/org_set_active.sql
\ir procs/organizations/org_set_property.sql