create table subject(
	no number primary key,
	s_num number(2) check (s_num in(01,02,03,04,05)) not  null,
	s_name varchar2(40) not null
	);
	
create table student(
	no number primary key,
	sd_num number(8) not null,
	sd_name varchar2(40) not null
	sd_id varchar2(40) not null,
	sd_passwd varchar2(40) not null,
	s_num num(8) not null,
	sd_jumin num(13) not null,
	sd_phone num(11) not null,
	sd_address varchar2(40) not null,
	sd_email varchar2(40) not null,
	sd_date date not null,
	);

create table lesson(
	no number primary key,
	l_num number(2) not null,
	l_name varchar2(40) not null
	);

create table trainee(
	no number primary key,
	sd_num number(2) check (s_num in(01,02,03,04,05)) not null,
	l_num varchar2(40) not null
	t_section culture major minor not null
	t_date not null
	);
	

	create sequence seq_num
	increment by 1
  	start with 1
  	minvalue 1
  	maxvalue 1000
  	nocycle
   	nocache; 