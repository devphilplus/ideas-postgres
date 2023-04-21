create table work_types (
    id int not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    name varchar(100) not null,
    description text,

    constraint pk_work_types
        primary key (id),

    constraint u_work_types_1
        unique (name)
);

comment on table work.work_types is 'table of work types';

insert into work.work_types (id, name, description) values 
(1,'hourly','hourly work type'),
(2,'piece','per piece work type'),
(3,'project','project work type')
;