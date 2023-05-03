/*board.sql*/
show tables;

create table board(
	idx int not null auto_increment,
	mid varchar(20) not null,
	nickName varchar(20) not null,
	title varchar(100) not null,
	email varchar(50),
	homePage varchar(50),
	content text not null,
	readNum int default 0,
	hostIp varchar(40) not null,
	openSw char(2) default 'OK', /*공개 여부*/
	wDate datetime default now(), /*글 작성 날짜*/
	good int default 0, /*좋아요 수 */
	primary key(idx)
);

desc board;

insert into board values(default,'admin','관리자','게시판 서비스를 시작합니다.','ehfrl64@naver.com','naver.blog/ehfrl64','이곳은 게시판 입니다.',default,'192.168.50.84',default,default,default);

select * from board;