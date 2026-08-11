-- =====================================================
-- 뉴스 데이터베이스 구축
-- =====================================================

CREATE TABLE TBL_NEWS(
    NEWS_NO NUMBER,
    PRESS_NAME VARCHAR2(100) NOT NULL,
    RANKING NUMBER,
    TITLE VARCHAR2(1000) NOT NULL,
    ARTICLE_URL VARCHAR2(2000),
    REG_DATE DATE DEFAULT SYSDATE,
    CONSTRAINT PK_TBL_NEWS PRIMARY KEY(NEWS_NO)
);

; 끝났다는 뜻. 꼭 적어야 함.
VARCHAR2(1000) 1000글자까지 적겠다. 까지 적어줘야 함. - 가변형 변형이 될 수 있는. 최대 4000까지 쓸 수 있는데, 모두 4000으로 설정하면, 100짜리같은 걸 4000까지 돌렸다가 돌아오기 때문에, 비효율적이다.
1000으로 작성했는데, 1000이 넘는 글자수가 나오면 오류가 난다. 그래서 max를 잘 써야 한다.
PRIMARY KEY(NEWS_NO) pk는 뉴스넘버로 주겠다 라는 뜻
NOT NULL: 널값 허용하지 않겠다. 없으면 다음 페이지로 안 넘어감. 필수조건. / 프라이머리 키는 무조건 낫널값.

CREATE SEQUENCE SEQ_NEWS_NO
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- 테이블 확인
SELECT TABLE_NAME FROM USER_TABLES ORDER BY TABLE_NAME;

-- 컬럼 확인
DESC TBL_NEWS;

-- 상세 컬럼 확인
SELECT COLUMN_ID,COLUMN_NAME,DATA_TYPE,DATA_LENGTH,NULLABLE
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME='TBL_NEWS'
ORDER BY COLUMN_ID;

-- 시퀀스 확인
SELECT SEQUENCE_NAME,LAST_NUMBER
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME='SEQ_NEWS_NO';

-- 재실습용
-- DROP TABLE TBL_NEWS CASCADE CONSTRAINTS;
-- DROP SEQUENCE SEQ_NEWS_NO;
