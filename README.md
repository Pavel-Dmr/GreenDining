# 어떤 프로젝트인가요?

| 항목 | 내용 |
| --- | --- |
| 프로젝트 소개 | 농수산물 쇼핑몰 웹 서비스 ‘그린다이닝’
사업자 회원이 가입해서, 각자의 스토어를 가지고 상품,판매글,배송관리를 할 수 있고, 등록된 상품이 일반 회원에게 노출되어 구매,결제,주문 관리가 가능하도록 만들었습니다. 

[목표]
- Pageble로 페이징 처리
- ResponseEntity , AJAX을 통한 요청,응답 처리
- 클라우드서비스로 이미지 파일 업로드,불러오기
- 회원 가입, 수정 , 탈퇴
- 사업자 회원의 상품, 판매글, 배송 관리
- 구매, 장바구니 구현
- PG 결제 API로 결제 시스템 구축
- 주문 관리
- 배송지 관리
- 쿠폰 / 할인
- 기획전 , 행사 구현
 |
| 개발 인원 | 총 4명 ( 풀스택 4명 ) |
| 담당 역할 | 팀장, 코드 컨벤션, DB 설계 및 구축, 브랜치 전략 수립 ,코드 리뷰, 기능 개발, 화면 설계 |
| 개발 기간 | 총 54일 (2023-10-23 ~ 2023-12-15일) |

# 프로젝트 설명

### 기술 스택

| Frontend | HTML CSS SCSS Babel BootStrap 5 JSP |
| --- | --- |
| Backend | Spring Boot Mybatis Node.js Maven JavaScript Jquery |
| Database | Oracle DB  |
| Deploy | Heroku |
| API | Imgur API Payup API |
| Tool | GitHub GitKraken Intellij IDEA Visual Studio Code Eclipse |

### 프로젝트 구조

![그린다이닝_아키텍쳐.jpg](https://prod-files-secure.s3.us-west-2.amazonaws.com/a281f0f1-8fe0-4c6c-aa62-9f38b4b4811a/7e59918b-a791-468b-ae86-474f99401570/%EA%B7%B8%EB%A6%B0%EB%8B%A4%EC%9D%B4%EB%8B%9D_%EC%95%84%ED%82%A4%ED%85%8D%EC%B3%90.jpg)

### DB 관계도

![GreenDining (1).png](https://prod-files-secure.s3.us-west-2.amazonaws.com/a281f0f1-8fe0-4c6c-aa62-9f38b4b4811a/6af084a1-8391-48a9-a2bc-9a1a71f02cb2/GreenDining_(1).png)

## 프로젝트 구현 기능

## 직접 구현한 기능 및 화면 설계

[기능,화면 설계 명세서 ](https://www.notion.so/366f58059aa0478f8f8bbd8704268c39?pvs=21)

## 프로젝트 경험, 이슈

### Mybatis SQL문의 parameterType나 ResultType이 DTO로 통일되지 않음

- 코드의 일관성이 부족해서 나중에 코드를 재설계하거나 파라미터을 추가할때 매우 불편했다…
- 특히 변경에 취약하기 때문에, 반드시 DTO로 통일해야 겠다는 생각이 들었다.

### 데이터 정규화,비정규화

- 초기 프로젝트 진행시 모든 쿼리문을 전부 정규화맞게 설계했음
- 특정 테이블은 쿼리가 너무 복잡하거나, 조인 연산이 많아서 비정규화하는 편이 맞았다
- DB 설계를 맡아서 하면서, 어떻게 데이터를 다뤄야할 지 알아갔다.

### 컨트롤러 URL 맵핑 메소드가 AJAX로 통일 되지 않음

- 맵핑 요청,응답 처리를 기본적인 컨트롤러 메소드 와 AJAX를 혼용 했는데 코드 일관성이 부족하다 보니 불편한 점이 있었다.
- 요청,응답을 특정 방식으로 일관화하는게 좋을듯하다
    - ResponseEntity와 AJAX로 필요한 부분을 RestAPI 처리했다.
