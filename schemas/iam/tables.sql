/**
 * identity and access management schema
 */
create schema iam;
set schema 'iam';

\ir tables/registrations.sql
\ir tables/users.sql
\ir tables/user_tenants.sql

\ir tables/roles.sql