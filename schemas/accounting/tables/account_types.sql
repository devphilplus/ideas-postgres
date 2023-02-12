create table account_types (
    id smallint not null,
    name varchar(20) not null,

    constraint pk_accounts_types
        primary key (id),
    constraint u_account_types_1
        unique (name)
);


insert into account_types (id, name) values 
(1,'asset'),
(2,'liability'),
(3,'expenses'),
(4,'income'),
(5,'equity')
;