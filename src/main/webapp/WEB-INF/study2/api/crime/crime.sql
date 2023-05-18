create table crime (
	idx int not null auto_increment primary key,
	year int, 					 /* 발생 년도 */
	police varchar(20) not null, /* 경찰서명  */
	robbery int, 				 /* 강도 건수 */
	murder int, 				 /* 살인 건수 */
	theft int, 					 /* 절도 건수 */
	violence int 				 /* 폭력 건수 */
);