# 03. Oracle 자료형과 DDL

## 학습목표

- Oracle의 주요 자료형을 이해한다.
- 뉴스 데이터에 적합한 자료형을 선택할 수 있다.
- 제약조건의 역할을 이해한다.
- CREATE TABLE과 SEQUENCE의 역할을 이해한다.

---

## 이번 시간 학습 흐름

```
뉴스 데이터 확인
    ↓
자료형 선택
    ↓
제약조건 설정
    ↓
CREATE TABLE
    ↓
SEQUENCE 생성
    ↓
테이블 확인
```

---

## 이번 장의 실습 파일

**SQL**

```
sql/01_뉴스테이블_구축.sql
```

**Python**

```
없음
```

---

## 1. Oracle 자료형이란?

자료형(Data Type)은 컬럼에 어떤 종류의 데이터를 저장할 것인지 결정하는 규칙입니다.

| 컬럼 | 저장 데이터 | 자료형 |
|------|------------|--------|
| NEWS_NO | 뉴스번호 | NUMBER |
| PRESS_NAME | 언론사 | VARCHAR2(100) |
| RANKING | 순위 | NUMBER |
| TITLE | 기사 제목 | VARCHAR2(1000) |
| ARTICLE_URL | 기사 링크 | VARCHAR2(2000) |
| REG_DATE | 등록일 | DATE |

---

## 2. 주요 자료형

### NUMBER
숫자를 저장합니다.

사용 예
- 뉴스번호
- 뉴스순위

### VARCHAR2
길이가 가변적인 문자열을 저장합니다.

사용 예
- 언론사
- 기사제목
- 기사 URL

### CHAR
길이가 고정된 문자열입니다.

예)
- Y/N
- 성별(M/F)

이번 프로젝트에서는 거의 사용하지 않습니다.

### DATE
날짜와 시간을 저장합니다.

예)
- 등록일(REG_DATE)

### CLOB
긴 문자열을 저장합니다.

예)
- 기사 본문
- 댓글

이번 프로젝트에서는 소개만 합니다.

---

## 3. 자료형 선택 기준

자료형은 데이터의 특성을 보고 결정합니다.

| 질문 | 선택 |
|------|------|
| 숫자인가? | NUMBER |
| 문자형인가? | VARCHAR2 |
| 날짜인가? | DATE |
| 매우 긴 문자열인가? | CLOB |

---

## 4. 제약조건

### PRIMARY KEY

데이터를 구분하는 고유한 값입니다.

```
NEWS_NO
```

### NOT NULL

반드시 값이 입력되어야 합니다.

예)

- PRESS_NAME
- TITLE

### DEFAULT

기본값을 자동으로 저장합니다.

예)

```
REG_DATE DEFAULT SYSDATE
```

---

## 5. CREATE TABLE 작성 원리

테이블 생성 순서

```
컬럼 결정
    ↓
자료형 결정
    ↓
제약조건 설정
    ↓
CREATE TABLE 작성
```

실습에서는 아래 파일을 실행합니다.

```
sql/01_뉴스테이블_구축.sql
```

---

## 6. Sequence

Oracle 11g에서는 자동 증가 번호를 위해 Sequence를 사용합니다.

```
1
2
3
4
5
```

Python에서는

```
SEQ_NEWS_NO.NEXTVAL
```

을 사용하여 NEWS_NO를 생성합니다.

---

## 7. 실무에서는

자료형은 최소 크기로 작성하지 않습니다.

예)

```
TITLE VARCHAR2(1000)
```

기사 제목은 길이가 일정하지 않기 때문입니다.

---

## 8. 실습 순서

1. sql/01_뉴스테이블_구축.sql 실행
2. CREATE TABLE 확인
3. CREATE SEQUENCE 확인
4. USER_TABLES 확인
5. USER_TAB_COLUMNS 확인
6. USER_SEQUENCES 확인

---

## 핵심 정리

- 자료형은 데이터 특성에 맞게 선택한다.
- PRIMARY KEY는 데이터를 구분한다.
- DEFAULT는 기본값을 저장한다.
- Oracle 11g는 Sequence를 사용한다.
- 테이블 생성 후 반드시 생성 결과를 확인한다.

---

## 다음 시간

다음 시간에는 Python을 이용하여 CSV 데이터를 Oracle Database에 저장(DML)하는 방법을 학습합니다.
