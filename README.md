# 프로젝트 기획안

### 작성일 : 2021. 12. 13
### 작성자 : 선장원

## 설정
- 톰캣 9.0 폴더 안 server.xml의 하단 context태그의 path="/"으로 변경
- mysql 테이블 계정 설정(README 하단)

# 프로젝트명 : 공유문제집 프로젝트 PublicWorkBook

## 기획 의도 
- 어떠한 목적을 구현하는 프로그램인지를 설명 
- 스터디를 할 때처럼 문제를 만들고 서로 풀어보면서 같이 공부를 하게 해주는 프로그램
- 왜 이러한 프로그램을 생각하게 되었는지에 대한 설명 
- 문제를 풀면서 서로 문제를 만들고 공유하면서 더 자신이 알고 있는 정보를 더 자세하게 알기 위해
- 문제를 만들고 문제를 풀고 내가 푼 문제의 점수를 알고 공부한다.

## 벤치마킹
- 백준 알고리즘

## 주요 기능 
- 회원가입
  - 출제자와 문제를 푸는 사람 두가지(선생님, 학생)로 가입
  - 두가지 가입 가능 구별방법은 enum
- 로그인 
  - 선생님과 학생의 로그인을 라디오 버튼으로 구분
- 선생님 페이지
  - 내 정보
  - 안에 수정
  - 내 문제 확인
- 학생 페이지
  - 내 정보
  - 안에 수정
  - 내가 푼 문제 (점수확인 등등)
- 문제 출제 (선생님 계정만 보임)
  - 문제는 과목당 5문제
  - 번호 문제 보기(사진) 선택지 정답 간단한해석
- 문제 풀기 (학생 계정만 보임)
  - 카테고리로 문제 유형 선택
  - 문제 선택
  - 문제 풀고 제출
- 정답확인 페이지
  - 정답확인 틀렸으면 해설 출력
  - 점수를 저장

## 기타
### mysql
- 데이터베이스 명 : public_work_book
#### members table
- create table members(
- m_number bigint auto_increment,
- m_id varchar(20) unique not null,
- m_password varchar(20) not null,
- m_name varchar(10) not null,
- m_email varchar(30) not null,
- m_phone varchar(30) not null,
- m_type enum('teacher','student', 'admin'),
- constraint primary key(m_number)
- );
#### category table
- create table category(
- c_number bigint auto_increment,
- c_name varchar(20)  not null,
- constraint primary key(c_number)
- );
#### subjects table
- create table category(
- c_number bigint auto_increment,
- c_name varchar(20)  not null,
- constraint primary key(c_number)
- );
#### question table
- create table question(
- q_number bigint auto_increment,
- s_number bigint,
- m_id varchar(20),
- q_name varchar(50) not null,
- q_filename varchar(100),
- q_select1 varchar(20) not null,
- q_select2 varchar(20) not null,
- q_select3 varchar(20) not null,
- q_select4 varchar(20) not null,
- q_select5 varchar(20),
- q_answer int not null,
- q_exposition varchar(100) not null,
- constraint primary key(q_number),
- constraint foreign key(s_number) references subjects(s_number) on delete cascade,
- constraint foreign key(m_id) references members(m_id) on delete cascade
- );
#### answer table
- create table answer(
- a_number bigint auto_increment,
- s_number bigint,
- q_number bigint,
- m_id varchar(20),
- a_answer int not null,
- constraint primary key(a_number),
- constraint foreign key(s_number) references subjects(s_number) on delete cascade,
- constraint foreign key(q_number) references question(q_number) on delete cascade,
- constraint foreign key(m_id) references members(m_id) on delete cascade
- );
#### mysore table
- create table myscore(
- ms_number bigint auto_increment,
- s_number bigint,
- m_id varchar(20),
- ms_score double(5,1) not null,
- constraint primary key(ms_number),
- constraint foreign key(s_number) references subjects(s_number) on delete cascade,
- constraint foreign key(m_id) references members(m_id) on delete cascade
- );
#### review table
- create table review(
- r_number bigint auto_increment,
- s_number bigint,
- m_id varchar(20),
- r_score double(3,1) default 0 not null,
- r_contents varchar(100) not null,
- constraint primary key(r_number),
- constraint foreign key(s_number) references subjects(s_number) on delete cascade,
- constraint foreign key(m_id) references members(m_id) on delete cascade
- );
