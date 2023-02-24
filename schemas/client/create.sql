/**
 * client schema
 */
create schema client;
set schema 'client';

\ir tables/clients.sql
\ir tables/organizations.sql


\ir procs/clients/client_add.sql
\ir procs/clients/client_set_active.sql
\ir procs/clients/client_set_property.sql

\ir procs/organizations/org_add.sql
\ir procs/organizations/org_set_active.sql
\ir procs/organizations/org_set_property.sql