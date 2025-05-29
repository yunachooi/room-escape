
# 🗝️ Room Escape - 방탈출 게임 예약 서비스

**Room Escape**는 사용자 친화적인 방탈출 카페 예약 통합 플랫폼입니다.  
다양한 테마의 방탈출 카페를 쉽게 검색하고 빠르게 예약할 수 있도록 설계되었습니다.

---

## 📌 프로젝트 개요

- **프로젝트 기간:**  
  2025년 05월 21일 ~ 05월 27일 (7일간)
  
- **목표:**  
  방탈출 경험이 풍부한 팀원의 실제 불편사항을 기반으로,  
  사용자에게 쉽고 빠른 예약 서비스를 제공하는 웹 플랫폼 개발

- **주요 기능:**
  - 방탈출 테마 검색 및 상세 조회
  - 시간대별 예약 가능 여부 확인
  - 예약 및 예약 내역 확인
  - 관리자 테마 등록 및 예약 관리

---

## 🛠 기술 스택

- **Frontend:** HTML, CSS, JavaScript
- **Backend:** Java (Spring Framework), JSP
- **Database:** ORACLE DB
- **협업 도구:** GitHub, KakaoTalk, Google Drive

---

## 👥 팀원 소개

| 이름 | 역할 |
|------|------|
| 김성훈 | (팀장) 회원가입, 공지사항(사용자), 이벤트(사용자), 테마(관리자), UI/UX |
| 차수현 | 메인페이지, 테마(사용자), 지점(관리자), 공지사항(관리자), 이벤트(관리자) |
| 김법진 | 로그인, 리뷰(사용자), FAQ(사용자, 관리자), QNA(사용자, 관리자) |
| 최유나 | 예약 시스템 (사용자, 관리자) |

> 본 프로젝트는 **그린 컴퓨터 아카데미**에서 진행한 미니 프로젝트입니다.

---

## 📌 ERD
![resized_erd_image](https://github.com/user-attachments/assets/cdaba110-fc05-4848-8aeb-a7c27b773863)

---

## 📌 유저 접근 프로세스
![resized_right_image](https://github.com/user-attachments/assets/f5498628-67cc-4ae0-aeed-1017daeae445)

---

## 📌 관리자 접근 프로세스
![cb793680-7dfa-4439-8bb9-0c207759fb71](https://github.com/user-attachments/assets/81570a35-6747-4098-9d69-2c8449d0c6a6)

---

## 📂 프로젝트 구조 (상세)

```
📁 room-escape/
├── 📁 src/                    # 자바 소스 코드
│   ├── 📁 controller/         # 컨트롤러 클래스 (요청/응답 처리)
│   │   └── ReservationController.java
│   ├── 📁 model/              # 모델/비즈니스 로직 계층
│   │   ├── dao/              # DB 접근 객체 (DAO)
│   │   │   └── ReservationDAO.java
│   │   ├── dto/              # 데이터 전달 객체 (DTO)
│   │   │   └── ReservationDTO.java
│   │   └── service/          # 서비스 계층 (비즈니스 로직)
│   │       └── ReservationService.java
│   └── 📁 config/             # Spring 및 DB 설정
│       └── WebAppConfig.java
│
├── 📁 web/                    # 웹 리소스 (JSP 및 정적 파일)
│   ├── 📁 css/                # CSS 파일 (디자인)
│   │   └── style.css
│   ├── 📁 js/                 # 자바스크립트 파일
│   │   └── main.js
│   └── 📁 jsp/                # JSP 페이지 (View)
│       ├── index.jsp         # 메인 페이지
│       ├── login.jsp         # 로그인
│       ├── reserve.jsp       # 예약
│       ├── admin.jsp         # 관리자
│       └── error.jsp         # 에러 처리
│
├── 📁 images/                 # 이미지 파일 (팀원 사진 포함 가능)
│   └── team/
│       ├── kim.jpg
│       ├── cha.jpg
│       ├── kim2.jpg
│       └── choi.jpg
│
├── 📁 resources/              # 설정 파일
│   ├── db.properties         # DB 연결 정보
│   └── applicationContext.xml # Spring 설정
│
├── 📁 sql/                    # SQL 스크립트
│   └── schema.sql            # 테이블 생성 및 초기 데이터
│
├── 📄 README.md               # 프로젝트 설명 문서
├── 📄 pom.xml                 # Maven 설정 파일
└── 📄 .gitignore              # Git 제외 설정 파일
```

---

## 🧩 디렉토리 요약 설명

| 디렉토리 | 설명 |
|----------|------|
| `src/` | 자바 코드 및 로직 |
| `controller/` | 웹 요청 처리 컨트롤러 |
| `model/dao/` | 데이터베이스 접근 계층 |
| `model/dto/` | 데이터 전달용 객체 |
| `model/service/` | 비즈니스 로직 처리 |
| `web/` | 사용자 화면과 정적 리소스 |
| `images/` | 이미지 리소스 |
| `resources/` | 설정 및 프로퍼티 파일 |
| `sql/` | DB 초기화 SQL 스크립트 |
| `README.md` | 프로젝트 소개 문서 |
| `pom.xml` | Maven 빌드 설정 |
| `.gitignore` | Git에서 무시할 파일 목록 |


```
📁 room-escape/
 ├── src/
 │   ├── controller/
 │   ├── model/
 │   ├── view/
 ├── web/
 │   ├── css/
 │   ├── js/
 │   └── jsp/
 └── README.md
```

---

## 🖥️ 시연 및 결과

- 주요 기능 시연은 [[PPT 문서](RoomEscape.pptx)](https://docs.google.com/presentation/d/1jUguLLQHd8pRKiA_ceLCD_CmfJQNqRII/edit?usp=sharing&ouid=100973109632084360692&rtpof=true&sd=true)를 참고해주세요.
- 기능 흐름은 `Depth Flow.xlsx`에 정리되어 있습니다.

---

## 📈 문제 및 해결

- 협업 툴 충돌 상황 -> 각자의 작업 상황 공유
- 프로젝트 통합 -> 요청 경로, 파라미터, 변수명 등 문서화
- CSS 적용 과정 충돌 -> 태그명 통일
- 테이블 설계 구조 문제 -> 재설계

---

## 📈 향후 발전 방향

- 모바일 반응형 UI 개선
- 결제 시스템 연동
- 편의 기능 확대
- 다국어 지원
- 커뮤니티 기능
