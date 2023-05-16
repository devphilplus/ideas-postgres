/**
 * inventory schema
 */
create schema inventory;
set schema 'inventory';

\ir tables/warehouses.sql
\ir tables/items.sql
\ir tables/item_locators.sql
\ir tables/item_locations.sql
\ir tables/item_expirations.sql