create table rwd_user (
    email varchar2(50) primary key,
    username varchar2(20) not null,
    user_pw varchar2(50) not null,
    phone varchar2(13) not null,
    gender varchar2(6) not null,
    regdate date default sysdate,
    update_date date default sysdate
);

insert into rwd_user (email, username, user_pw, phone, gender) values ('admin@rwd.com', 'admin', 'admin123', 'admin', 'admin');
insert into rwd_user (email, username, user_pw, phone, gender) values ('green@green.com', '이초록', 'greengreen', '010-0000-0000', 'none');

select * from rwd_user;

commit;

create table rwd_record (
    rec_num number(5) primary key,
    btitle varchar2(50) not null,
    rate varchar2(15),
    one_line varchar2(200) not null,
    content varchar2(4000) not null,
    regdate date default sysdate,
    update_date date default sysdate
);

create sequence seq_rwd_record;

desc rwd_record;

insert into rwd_record values (0, 'test', '★★★★★', '너무너무 재밌어요 짱!', 'test test test \n test',  sysdate, sysdate);

select * from rwd_record;

commit;