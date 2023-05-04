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

/* 날짜함수 처리 연습 */
select now(); /*오늘 날짜 보여주기*/
select year(now());
select month(now());
select day(now());
select concat(year(now()), '년 ',month(now()), '월 ',  day(now()), '일') as 날짜; /*필드를 만들어서 vo에 등록해야 쓸수있음*/
select weekday(now()); /*요일을 숫자로 출력 0(월) 1~~~~*/
select date(now()) /*날짜를 '년-월-일'로 출력*/
select year('2023-5-3');
select idx, year(wDate) from board;

/* 날짜 연산 */
/* date_add(date, interval 값 Type) */
select date_add(now(), interval 1 day); /*오늘 날짜 보다 +1 = 내일 날짜 출력*/
select date_add(now(), interval -1 day); /*오늘 날짜 보다 -1 = 어제 날짜 출력*/
		/* 오늘 날짜보다 +10시간 이후의 날짜/시간 출력 */
select now(), date_add(now(), interval 10 day_hour);
select now(), date_add(now(), interval -10 day_hour);
/* date_sub(date, interval 값 Type) */
select date_sub(now(), interval 1 day); /*오늘 날짜 보다 -1 = 어제 날짜 출력*/
select date_sub(now(), interval -1 day); /*오늘 날짜 보다 +1 = 내일 날짜 출력*/

/* board 테이블에 적용하기 */
	/* 게시글 중에서 하루 전에 올라온 글만 보여주기 */
select wDate, date_add(now(), interval -1 day) from board;
select substring(wDate,11,19), substring(date_add(now(), interval -24 day_hour),11,19) from board;
select idx, wDate, date_add(now(), interval -1 day) from board where substring(wDate,1,10) <= substring(date_add(now(), interval -1 day),1,10);
select * from board where wDate > date_add(now(), interval -24 day_hour);

/* 날짜차이 계산 : DATEDIFF(시작날짜, 마지막날짜) */
select datediff('2023-05-04','2023-05-01');
select datediff(now(),'2023-05-01');
select idx, datediff(now(), wDate) as day_diff from board;
select timestampdiff(hour, now(), '2023-05-04');
select idx, timestampdiff(hour, wDate, now()) as hour_diff from board;
select *, timestampdiff(hour, wDate, now()) as hour_diff from board order by idx desc limit 0,5
select *, datediff(wDate, now()) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from board order by idx desc limit 0,5

/* 날짜 양식(date_format() : 4자리년도(%Y), 월(%m), 일(%d) */
select wDate, date_format(wDate, '%Y-%m-%d %H:% i') from board;
