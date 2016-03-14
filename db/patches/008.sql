create table if not exists known_visitors (
    id int not null auto_increment,
    name varchar(256) not null,
    email varchar(256) not null,
    primary key (id)
);

