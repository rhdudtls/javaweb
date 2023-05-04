/* member.sql */

create table member(
	idx int not null auto_increment,
	mid varchar(20) not null, /*아이디 중복 불허 */
	pwd varchar(100) not null, /*회원 비밀번호(SHA256 암호화) */
	nickName varchar(20) not null, /* 닉네임(중복불허/수정가능) */
	name varchar(20) not null,
	gender varchar(4) default '남자',
	birthday datetime default now(),
	tel varchar(15), /*형식 (010-1238-4567)*/
	address varchar(100), /*주소(다음API) 우편번호 활용*/
	email varchar(50) not null,  /*아이디 or 비밀번호 분실시 사용(형식체크 필수)*/
	homePage varchar(50),
	job varchar(20),
	hobby varchar(100),  /*취미(중복선택 가능, 구분자는 '/'로 한다 */
	photo varchar(100) default 'noimage.jpg',
	content text,
	userInfor char(6) default '공개',
	userDel char(2) default 'NO',  /* 회원 탈퇴신청여부(NO:활동중, OK:탈퇴신청중)*/
	point int default 100, /*가입 포인트 100점 제공, 1회 방문시 10점씩 제공 1일 최대 증가 50 */
	level int default 1, /*회원등급 (0:관리자, 1:준회원, 2:정회원, 3:우수회원, 4:운영자)*/
	visitCnt int default 0, /*총 방문 횟수 */
	startDate datetime default now(), /*최초 가입일 */
	lastDate datetime default now(), /*마지막 접속일 */
	todayCnt int default 0, /*오늘 방문 횟수 */
	primary key(idx, mid)
);

desc member;

select * from member;