-- ===========================================
-- 03. 뉴스 데이터 검색
-- ===========================================

-- 전체 조회
SELECT *
FROM TBL_NEWS
ORDER BY NEWS_NO;

-- 언론사별 조회
SELECT *
FROM TBL_NEWS
WHERE PRESS_NAME='연합뉴스'
ORDER BY RANKING;

-- 제목에 AI 포함
SELECT *
FROM TBL_NEWS
WHERE TITLE LIKE '%AI%';

-- 최신 뉴스
SELECT *
FROM TBL_NEWS
ORDER BY REG_DATE DESC;

-- 언론사별 기사 수
SELECT PRESS_NAME,
       COUNT(*) AS NEWS_COUNT
FROM TBL_NEWS
GROUP BY PRESS_NAME
ORDER BY NEWS_COUNT DESC;
