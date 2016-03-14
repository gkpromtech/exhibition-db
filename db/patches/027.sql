create table if not exists business_event_enrollments (
    id int auto_increment primary key,
    name varchar(256),
    company varchar(256),
    position varchar(256),
    phone varchar(64),
    email varchar(256),
    eventid int not null,
    foreign key (eventid) references business_events(id) on delete cascade on update cascade
);

