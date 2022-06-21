# 🪐space📚

### 🎤Introduce
- 알라딘 도서 API를 이용한 소설 구독 웹서비스
- 개발 기간 : 2022.04.05 - 2022.05.04

### 🔗Test
- LINK: http://52.79.141.125:8080/user/start
- TEST ACCOUNT
   * 저장된 데이터 X: ID - test@gmail.com / PASSWORD - test
   * 저장된 데이터 O: ID - content@gmail.com / PASSWORD - content
   * (한 줄 평은 구병모 <아가미> 상세정보에 들어가면 보실 수 있습니다.)

### 📑Portfolio
[See a Portfolio👀](JeongHyewon_portfolio.pdf)

### 👩‍💻Tech Stack
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=java&logoColor=white)
![SpringBoot](https://img.shields.io/badge/SpringBoot-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
<br>
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)

### ➡️Progress
* 🗒️기획
   https://ovenapp.io/view/PtfXvmHtrrSZCQVmqZhoIFvYxcwRbjci/
  
* 🛠️DB, URL, 일정 설계
    https://docs.google.com/spreadsheets/d/1WfN0UFY1LEcxX2-XBPeL47Vu4KMUNo1dxD7KuGLP4xU/edit?usp=sharing

### ⚙️Function
* 회원가입/로그인
   * package : [com.ffaikrw.space.user.* ](https://github.com/ffaikrw/Space/tree/master/src/main/java/com/ffaikrw/space/user)
   * view : [webapp/WEB-INF/jsp/user/* ](https://github.com/ffaikrw/Space/tree/master/src/main/webapp/WEB-INF/jsp/user)
* 카카오 로그인 API
   * package : [com.ffaikrw.space.kakao.* ](https://github.com/ffaikrw/Space/tree/master/src/main/java/com/ffaikrw/space/kakao)
* 홈
   * package : [com.ffaikrw.space.browse.* ](https://github.com/ffaikrw/Space/tree/master/src/main/java/com/ffaikrw/space/browse)
   * view : [webapp/WEB-INF/jsp/browse/home.jsp ](https://github.com/ffaikrw/Space/blob/master/src/main/webapp/WEB-INF/jsp/browse/home.jsp)
* 알라딘 도서 API
   * package : [com.ffaikrw.space.aladinAPI.* ](https://github.com/ffaikrw/Space/tree/master/src/main/java/com/ffaikrw/space/aladinAPI)
* 검색
   * package : [com.ffaikrw.space.browse.* ](https://github.com/ffaikrw/Space/tree/master/src/main/java/com/ffaikrw/space/browse)
   * view : [webapp/WEB-INF/jsp/browse/* ](https://github.com/ffaikrw/Space/blob/master/src/main/webapp/WEB-INF/jsp/browse)
* 내 서재
   * package : [com.ffaikrw.space.library.* ](https://github.com/ffaikrw/Space/tree/master/src/main/java/com/ffaikrw/space/library)
   * view : [webapp/WEB-INF/jsp/library/* ](https://github.com/ffaikrw/Space/tree/master/src/main/webapp/WEB-INF/jsp/library)
* 독서노트
   * package : [com.ffaikrw.space.note.* ](https://github.com/ffaikrw/Space/tree/master/src/main/java/com/ffaikrw/space/note)
   * view : [webapp/WEB-INF/jsp/library/* ](https://github.com/ffaikrw/Space/blob/master/src/main/webapp/WEB-INF/jsp/library)
* 추천하기
   * package : [com.ffaikrw.space.library.recommend.* ](https://github.com/ffaikrw/Space/tree/master/src/main/java/com/ffaikrw/space/library/recommend)
   * view : [webapp/WEB-INF/jsp/library/* ](https://github.com/ffaikrw/Space/blob/master/src/main/webapp/WEB-INF/jsp/library)
* 읽어볼까
   * package : [com.ffaikrw.space.wish.* ](https://github.com/ffaikrw/Space/tree/master/src/main/java/com/ffaikrw/space/wish)
   * view : [webapp/WEB-INF/jsp/wishlist.jsp ](https://github.com/ffaikrw/Space/blob/master/src/main/webapp/WEB-INF/jsp/wishlist.jsp)
* 도서 상세 정보
   * package : [com.ffaikrw.space.bookDetail.* ](https://github.com/ffaikrw/Space/tree/master/src/main/java/com/ffaikrw/space/bookDetail)
   * view : [webapp/WEB-INF/jsp/bookDetail.jsp ](https://github.com/ffaikrw/Space/blob/master/src/main/webapp/WEB-INF/jsp/bookDetail.jsp)
* 한 줄 평
   * package : [com.ffaikrw.space.bookDetail.review.* ](https://github.com/ffaikrw/Space/tree/master/src/main/java/com/ffaikrw/space/bookDetail/review)
   * view : [webapp/WEB-INF/jsp/bookDetail.jsp](https://github.com/ffaikrw/Space/blob/master/src/main/webapp/WEB-INF/jsp/bookDetail.jsp)
* 프로필 관리
   * package : [com.ffaikrw.space.user.* ](https://github.com/ffaikrw/Space/tree/master/src/main/java/com/ffaikrw/space/user)
   * view : [webapp/WEB-INF/jsp/user/profile.jsp](https://github.com/ffaikrw/Space/blob/master/src/main/webapp/WEB-INF/jsp/user/profile.jsp)



### 📼DEMO
[![space demo](https://img.youtube.com/vi/_klysApbl2o/1.jpg)](https://youtu.be/_klysApbl2o)

