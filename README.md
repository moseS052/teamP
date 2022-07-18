# 깃 작업 순서

초기셋팅

* 작성자 등록

* git config --global user.name "이름"

* git config --global user.email "메일 주소"

* 작성자 확인

* git config --global -l

  

0. clone으로 받기  (초기)
   * 작업 전 pull로 받은 다음 작업 할 것!!
   * 다음 번 pull받을 땐, 자신의 브랜치가 원격저장소에서 삭제되면 받을 것
   * 자신의 브랜치가 삭제되면 병합했다는 소리
1. 각자 브랜치 생성(이름으로)
2. 본인의 브랜치 명으로 체크아웃
3. 하루동안 작업한 것 add, commit 하고 push origin **※본인브랜치** 할 것
   * 큰 작업을 안했어도 기록을 남기는 의미로 푸시는 하는걸로
4. 본인의 작업이 병합가능(기능적으로) 할 정도로 완성되면 말해주세요
5. 병합 되기 전에는 되도록 작업진행 하지 말기(본인이 merge해서 충돌해결해야할수도있음)
6. 병합 되면 pull origin master  한 후 log 확인할 것
   * 자신의 head->브랜치가 정상적으로 pull 받은 마지막 커밋 지점 향하면 그대로 작업 만약 head->브랜치가 하위 커밋에 향해있다면 7번으로
7. git checkout (pull받은 커밋Id값) 입력 -git log에서 확인가능
   * 새로운 브랜치 생성 후 브랜치로 옮기기(git checkout -b 브랜치명)
   * 자신의 브랜치를 최종단계로 옮기는 과정
   * 이클립스에 오류가 날 수 있음 *Errors occurred while refreshing resources with the local file system.*  이거 해당 프로젝트 refresh(F5) 해주면 해결된다함

# ※작업은 자신의 브랜치로!!
## 다른 파일은 상관 없고 컨트롤러만 새롭게 생성 후 작업할 것!

-----------------------------------------------------------------------------------------------------------------------

------------------------------------

### 단축키

cmd

위,아래 방향키  : 과거 작성한 명령어 조회

ctrl + l  : 터미널 화면 청소(스크롤 올리면 과거 내역 조회)

ctrl + insert  : 복사

shift + insert  : 붙여넣기

git

작업할 폴더가서 우클릭 깃 베쉬 클릭하면 자동으로 디렉토리 설정

git status  :  git 상태확인

git init  :  현 디렉토리를 git 으로 관리한다는 명령어(.git 생성)

git add  파일명/폴더명/./-A      : . 이랑 -A는 변경사항 전체

  깃 변경파일 추가하는 것 (커밋 전), 커밋을 가능하게 해주는 것

git commit -m "커밋메시지"  : 에드한 파일을 커밋

git log   :  기록보기

git log --all --graph --oneline   : 로그보기가 편함 선택으로 사용

git push origin 브랜치명 : 커밋한 파일 원격으로 푸시 

git clone 원격저장소 주소 : 원격저장소에서 파일 복제

git pull origin 브랜치명  : 원격저장소에서 파일 받기

git branch  : 브랜치목록 조회

git branch 브랜치 이름 : 브렌치 생성

git branch 브랜치이름 커밋ID : 특정 커밋 기준으로 브렌치 생성

git branch -d 브랜치 이름 : 브랜치 삭제

git checkout 브랜치이름 : 다른 브랜치 이동

git checkout -b 브랜치이름 : 해당브랜치 생성하면서 체크아웃

git reset --hard 커밋ID  : 해당 커밋으로 되돌리기(되돌리면서 삭제함)



--------------------------

-----------------

git branch -r  원격브렌치확인

git remote add origin 주소
 == 원격 레파지토리 주소 등록
git remote -v
 == 조회
git remote rm origin
 == 원격 연결 삭제
git log -p
git log -stat

git checkout -b branch명 origin/브렌치명 
== 원격 브렌치 내 로컬에 생성

git branch -d 브렌치명  == 해당 브렌치 로컬에서 삭제

git push -d origin 브렌치명    == 원격 브렌치 삭제

----

----

#### ※sysdate 사용하지말고 current_date 로 



### member   =회원테이블    

| m_no    | id           | pw       | name     | nick     | phone    |gender| mail     | score     | ava_route    | birth    |
| ------- | ------------ | -------- | -------- | -------- | -------- | ---- | -------- | --------- | --------------- | -------- |
| 회원seq | ID           | PW        | 이름     | 닉네임   | 모바일    | 성별 | 이메일    | 활동 점수 | 아바타 사진경로   | 생년월일 |
| number  | varchar2     | varchar2 | varchar2 | varchar2 | varchar2 | char | varchar2 | number    | varchar2        | varchar2 |
| primary | not null(NN) | NN       | NN       | NN       | NN       |      |          | default 0 |                 |          |

★ m_no seq = member_sq    ,   사용-  member_sq.nextval


### talent_check  =재능체크테이블

| m_no    | t_no     |
| ------- | -------- |
| 회원seq | 재능넘버 |
| number  | number   |
| NN      | NN       |



### talent  =재능테이블

| t_no        | t_name |
| ----------- | -------- |
| 재능넘버seq  | 재능명   |
| number      | varchar2 |
| primary     | NN       |

★ t_no seq = talent_sq    ,   사용-  talent_sq.nextval


### activities  =활동내역테이블

| m_no    | act              | term     |
| ------- | ---------------- | -------- |
| 회원seq | 활동내역(활동명) | 기간     |
| number  | varchar2         | varchar2 |
| NN      | NN               | NN       |



### board  =게시판 테이블

| b_no      | b_type      | m_no    | b_title  | b_date   | b_con    |
| --------- | --------------- | ------- | -------- | -------- | -------- |
| 게시판seq | 게시판 종류 | 회원seq | 제목     | 작성시간 | 내용     |
| number    | char    | number  | varchar2 | date     | varchar2 |
| primary   | NN              | NN      | NN       | NN       |          |

※게시판 분류

* 포토  P
* 요청게시판  Q
* 자유게시판  F

※제목은 안적으면 제목없음으로

★ 게시판 Insert Update Delete 는 board 테이블 사용

★ 게시판 Read 시에는 view 사용  boardP , boardQ, boardF

★ b_no seq = board_sq    ,   사용-  board_sq.nextval  



### route  =파일경로테이블

| b_no      | b_route  |
| --------- | -------- |
| 게시판seq | 경로     |
| number    | varchar2 |
| NN        | NN       |



### comment_t  =댓글 테이블

| c_no    | b_no      | c_con    | m_no    | c_date | c_pa_no     |
| ------- | --------- | -------- | ------- | ------ | ----------- |
| 자체seq | 게시판seq | 내용     | 회원seq | 시간   | 상위댓글seq |
| number  | number    | varchar2 | number  | date   | number      |
| primary |           | NN       | NN      | NN     |             |

★ c_no seq = comment_sq    ,   사용-  comment_sq.nextval  


### questions 질문게시판테이블(Q&A)

| q_no    | q_title  | q_con    | q_date | m_no    | q_a      |
| ------- | -------- | -------- | ------ | ------- | -------- |
| 자체seq | 제목     | 내용     | 시간   | 회원seq | 답변     |
| number  | varchar2 | varchar2 | date   | number  | varchar2 |
| primary | NN       |          | NN     | NN      |          |

♠ 자주묻는질문은 미리 questions 게시판에 입력후 사용하는 쪽으로

★ q_no seq = questions_sq    ,   사용-  questions_sq.nextval 



### list  =목록테이블

| l_no    | m_no    | l_title  | l_con    | l_date |      |
| ------- | ------- | -------- | -------- | ------ | ---- |
| 자체seq | 회원seq | 제목     | 내용     | 시간   |      |
| number  | number  | varchar2 | varchar2 | date   |      |
| primary | NN      | NN       |          | NN     |      |

※추가할 내용이 많아질 것 같음

★ l_no seq = list_sq    ,   사용-  list_sq.nextval 



### talent_check_list 목록 재능체크테이블

| l_no    | t_no        |
| ------- | ----------- |
| 목록seq | 재능넘버seq |
| number  | number      |
| NN      | NN          |



### apply  =신청자테이블

| l_no    | m_no    |
| ------- | ------- |
| 목록seq | 회원seq |
| number  | number  |
| NN      | NN      |



### note  =쪽지 테이블

|n_no      | m_no        | n_con    | n_date       | m_pa_no     |
|----------| ----------- | -------- | ------------ | ----------- |
|쪽지seq    | 회원seq본인 | 내용     | 쪽지보낸시간 | 회원seq상대 |
|number    | number      | varchar2 | date         | number      |
|primary   | NN          | NN       | NN           | NN          |

★ n_no seq = note_sq    ,   사용-  note_sq.nextval
