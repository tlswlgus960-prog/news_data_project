-- ============================================================
-- 02. 뉴스 데이터 DML 실습
-- 대상 테이블 : TBL_NEWS
-- ============================================================
-- 학습내용
-- 1. INSERT
-- 2. UPDATE
-- 3. DELETE
-- 4. COMMIT
-- 5. ROLLBACK
-- ============================================================


-- ============================================================
-- 0. 실습 전 테이블 구조와 현재 데이터 확인
-- ============================================================

DESC TBL_NEWS;

SELECT *
FROM TBL_NEWS
ORDER BY NEWS_NO;


-- ============================================================
-- 1. INSERT : 뉴스 데이터 등록
-- ============================================================
-- NEWS_NO는 SEQ_NEWS_NO.NEXTVAL을 사용합니다.
-- REG_DATE는 DEFAULT SYSDATE가 설정되어 있어 생략합니다.

INSERT INTO TBL_NEWS (
    NEWS_NO,
    PRESS_NAME,
    RANKING,
    TITLE,
    ARTICLE_URL
)
VALUES (
    SEQ_NEWS_NO.NEXTVAL,
    '연합뉴스',
    1,
    '[테스트] AI 산업 성장 관련 뉴스',
    'https://example.com/news/1'
);


INSERT INTO TBL_NEWS (
    NEWS_NO,
    PRESS_NAME,
    RANKING,
    TITLE,
    ARTICLE_URL
)
VALUES (
    SEQ_NEWS_NO.NEXTVAL,
    '한국경제',
    2,
    '[테스트] 반도체 시장 전망',
    'https://example.com/news/2'
);


INSERT INTO TBL_NEWS (
    NEWS_NO,
    PRESS_NAME,
    RANKING,
    TITLE,
    ARTICLE_URL
)
VALUES (
    SEQ_NEWS_NO.NEXTVAL,
    '전자신문',
    3,
    '[테스트] 생성형 AI 서비스 확대',
    'https://example.com/news/3'
);


-- 등록 결과 확인
SELECT *
FROM TBL_NEWS
ORDER BY NEWS_NO;


-- 변경 내용을 최종 확정합니다.
COMMIT;


-- ============================================================
-- 2. UPDATE : 뉴스 데이터 수정
-- ============================================================
-- UPDATE 전에 먼저 수정 대상을 확인합니다.

SELECT *
FROM TBL_NEWS
WHERE TITLE = '[테스트] 반도체 시장 전망';


-- 기사 제목 수정
UPDATE TBL_NEWS
SET TITLE = '[테스트] 국내 반도체 시장 전망'
WHERE TITLE = '[테스트] 반도체 시장 전망';


-- 수정 결과 확인
SELECT *
FROM TBL_NEWS
WHERE TITLE LIKE '%반도체%';


-- 수정 내용을 취소합니다.
ROLLBACK;


-- ROLLBACK 결과 확인
SELECT *
FROM TBL_NEWS
WHERE TITLE LIKE '%반도체%';


-- ============================================================
-- 3. DELETE : 뉴스 데이터 삭제
-- ============================================================
-- DELETE 전에 먼저 삭제 대상을 확인합니다.

SELECT *
FROM TBL_NEWS
WHERE PRESS_NAME = '전자신문'
  AND TITLE = '[테스트] 생성형 AI 서비스 확대';


-- 뉴스 데이터 삭제
DELETE FROM TBL_NEWS
WHERE PRESS_NAME = '전자신문'
  AND TITLE = '[테스트] 생성형 AI 서비스 확대';


-- 삭제 결과 확인
SELECT *
FROM TBL_NEWS
ORDER BY NEWS_NO;


-- 삭제 내용을 취소합니다.
ROLLBACK;


-- ROLLBACK 결과 확인
SELECT *
FROM TBL_NEWS
ORDER BY NEWS_NO;


-- ============================================================
-- 4. 테스트 데이터 전체 삭제 예제
-- ============================================================
-- 아래 DELETE는 제목이 [테스트]로 시작하는 데이터만 삭제합니다.
-- 교수자의 안내에 따라 실행합니다.

-- SELECT *
-- FROM TBL_NEWS
-- WHERE TITLE LIKE '[테스트]%';

-- DELETE FROM TBL_NEWS
-- WHERE TITLE LIKE '[테스트]%';

-- COMMIT;


-- ============================================================
-- 5. 주의사항
-- ============================================================
-- WHERE가 없는 UPDATE는 모든 행을 수정합니다.
-- UPDATE TBL_NEWS SET RANKING = 1;

-- WHERE가 없는 DELETE는 모든 행을 삭제합니다.
-- DELETE FROM TBL_NEWS;

-- UPDATE와 DELETE를 실행하기 전에는
-- 반드시 같은 WHERE 조건으로 SELECT를 먼저 실행합니다.
