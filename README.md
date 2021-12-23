# 프로젝트 기획안

### 작성일 : 2021. 12. 13
### 작성자 : 선장원

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
  - 두가지 가입 가능 구별방법은 변수
- 로그인 
  - 선생님과 학생의 로그인을 따로 받음
- 선생님 페이지
  - 내 정보
  - 안에 수정
  - 내 문제 확인
- 학생 페이지
  - 내 정보
  - 안에 수정
  - 내가 푼 문제 (점수확인 등등)
- 문제 출제 (선생님 계정만 보임)
  - 문제는 과목당 5문제(과목을 넣으면 너무 어려워지는데…?)
  - 번호 문제 보기(사진?) 선택지 정답 간단한해석
- 문제 풀기 (학생 계정만 보임)
  - 카테고리로 (DTO를 만들어야 하겠지) 문제 유형 선택
  - 문제 선택
  - 문제 풀고 제출
- 정답확인 페이지
  - 정답확인 틀렸으면 해설 출력
  - 점수를 저장?

## 기타
