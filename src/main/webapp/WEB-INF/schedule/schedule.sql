/* schedule.sql */

show tables;

create table schedule (
  idx   int not null auto_increment primary key,
  memberIdx int not null,
  mid   varchar(20) not null,   /* 회원 아이디(일정검색시 필요) */
  sDate datetime not null,			/* 일정 등록 날짜 */
  part	varchar(10) not null,		/* 분류(1.모임, 2.업무, 3.학습, 4.여행, 5:기타) */
  content text not null,					/* 일정 상세내역 */
  foreign key(mid,memberIdx) references member(mid, idx)
);

insert into schedule values (default,'hkd1234','2023-05-17','학습','JSP 주제발표');
insert into schedule values (default,'hkd1234','2023-05-17','학습','JSP 보고서작성');
insert into schedule values (default,'hkd1234','2023-05-17','모임','업무회식, 성안길 가자호프 6시');
insert into schedule values (default,'hkd1234','2023-05-20','기타','영화관람 cgv 6시');
insert into schedule values (default,'hkd1234','2023-05-22','모임','초등학교 동창회');
insert into schedule values (default,'hkd1234','2023-05-22','업무','기획3팀 업무관련');
insert into schedule values (default,'hkd1234','2023-05-24','학습','JSP 발표');
insert into schedule values (default,'hkd1234','2023-06-12','모임','학원6기 모임');
insert into schedule values (default,'hkd1234','2023-06-15','모임','중학교 모임');
insert into schedule values (default,'hkd1234','2023-06-15','업무','제일기획 영업이익표작성');
insert into schedule values (default,'hkd1234','2023-06-27','기타','수영장 가기로한날');
insert into schedule values (default,'kms1234','2023-05-17','학습','JSP 주제발표');
insert into schedule values (default,'kms1234','2023-05-22','기타','친구들과 음악회');
insert into schedule values (default,'kms1234','2023-05-29','모임','초등친구모임 6시 사창사거리');
insert into schedule values (default,'kms1234','2023-05-30','업무','JSP프로그램 TEST');
insert into schedule values (default,'kms1234','2023-06-17','학습','JSP 주제발표');


select * from schedule where mid='hkd1234' and sDate='2023-05-17' order by sDate desc;
select * from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m-%d')='2023-05-17' order by sDate desc;
select * from schedule where mid='hkd1234' and sDate='2023-05' order by sDate desc;
select * from schedule where mid='hkd1234' and date_format(sDate, '%Y-%m')='2023-5' order by sDate desc;

select * from schedule where mid='hkd1234' and date_format(sDate, '%Y-%m')='2023-05' order by sDate desc, part;

desc schedule;
select * from schedule;
drop table schedule;


ScheduleVO.java

1
2
3
4
public class ScheduleVO {
    private int idx,count;
    private String mid,sDate,part,content;
 
Colored by Color Scripter
cs
 

ScheduleDAO.java

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
package schedule;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
 
import conn.GetConn;
 
public class ScheduleDAO {
    // 싱클톤으로 선언된 DB연결객체(GetConn)을 연결한다.
    GetConn getConn = GetConn.getInstance();
    private Connection conn = getConn.getConn();
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    
    private String sql = "";
    
    ScheduleVO vo = null;
 
    // 선택된 날짜(년/월)의 개별회원에 대한 스케줄의 모든 정보를 가져오기
    public ArrayList<ScheduleVO> getSchedule(String mid, String ym, int sw) {
        ArrayList<ScheduleVO> vos = new ArrayList<>();
        
        try {
            
            if(sw == 0) {
                //sql = "select * from schedule where mid=? and date_format(sDate,'%Y-%m')=? order by sDate,part";
                sql="select * ,(select count(*) from schedule where part = a.part and sDate = a.sDate) as partCnt "
                        + "from schedule as a where mid=? and date_format(sDate,'%Y-%m') = ? group by part,sDate  order by sDate, part ;";
                
            }
            else if(sw ==1) {
                sql = "select * from schedule where mid=? and date_format(sDate,'%Y-%m-%d')=? order by sDate,part";
                
            }
            
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, mid);
            pstmt.setString(2, ym);
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                vo= new ScheduleVO();
                vo.setIdx(rs.getInt("idx"));
                vo.setMid(rs.getString("mid"));
                vo.setsDate(rs.getString("sDate"));
                vo.setPart(rs.getString("part"));
                vo.setContent(rs.getString("content"));
                
                if(sw==0) vo.setCount(rs.getInt("partCnt"));
                
                vos.add(vo);
            }
            
        } catch (SQLException e) {
            System.out.println("schedule.ScheduleDAO.getSchedule sql에러\n"+e.getMessage());
        }finally {
            getConn.rsClose();
        }
        
        return vos;
    }
 
    //스케줄 등록
    public String setScheduleInputOk(ScheduleVO vo) {
        String res = "0";
        
        try {
            sql="insert into schedule values(default,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, vo.getMid());
            pstmt.setString(2, vo.getsDate());
            pstmt.setString(3, vo.getPart());
            pstmt.setString(4, vo.getContent());
            pstmt.executeUpdate();
            res = "1";
            
            
        } catch (SQLException e) {
            System.out.println("schedule.ScheduleDAO.setScheduleInputOk sql에러\n"+e.getMessage());
        }finally {
            getConn.pstmtClose();
        }
        
        return res;
    }
 
    public String setScheduleUpdate(ScheduleVO vo) {
        String res = "0";
        
        try {
            sql="update schedule set content=?, part=? where idx=?";
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, vo.getContent());
            pstmt.setString(2, vo.getPart());
            pstmt.setInt(3, vo.getIdx());
            
            if(pstmt.executeUpdate() == 1) res="1";
            
        } catch (SQLException e) {
            System.out.println("schedule.ScheduleDAO.setScheduleInputOk sql에러\n"+e.getMessage());
        }finally {
            getConn.pstmtClose();
        }
        return res;
    }
 
    
    
    
 
 
}

select * , (select count(*) from schedule where part = a.part and sDate = a.sDate and mid='hkd1234') as b from schedule as a where mid='hkd1234' and date_format(sDate,'%Y-%m') = '2023-05' group by part, sDate  order by sDate, part;