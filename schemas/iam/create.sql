/**
 * identity and access management schema
 */
create schema iam;
set schema 'iam';

\ir tables/registrations.sql
\ir tables/users.sql


\ir procs/registrations/register.sql
\ir procs/registrations/register_get_info.sql