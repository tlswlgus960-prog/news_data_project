# 04. DML과 뉴스 데이터 등록

## 학습목표

- DML(Data Manipulation Language)의 개념을 이해한다.
- INSERT, UPDATE, DELETE의 역할을 구분할 수 있다.
- 시퀀스를 이용하여 뉴스번호를 자동으로 생성할 수 있다.
- COMMIT과 ROLLBACK의 차이를 이해한다.
- Oracle 테이블에 뉴스 데이터를 직접 등록하고 수정·삭제할 수 있다.

---

## 이번 시간 학습 흐름

```text
TBL_NEWS 확인
    ↓
INSERT로 뉴스 등록
    ↓
SELECT로 등록 결과 확인
    ↓
UPDATE로 데이터 수정
    ↓
DELETE로 데이터 삭제
    ↓
COMMIT / ROLLBACK
```

---

## 이번 장의 실습 파일

**SQL**

```text
sql/02_뉴스데이터_DML.sql
```

**Python**

```text
없음
```

Python으로 CSV 전체 데이터를 등록하는 실습은 이후 Python-Oracle 연동 장에서 진행합니다.

---

## 1. DML이란?

DML(Data Manipulation Language)은 테이블에 저장된 데이터를 추가, 수정, 삭제하는 SQL 명령어입니다.

| 명령어 | 역할 |
|---|---|
| INSERT | 새로운 데이터 추가 |
| UPDATE | 기존 데이터 수정 |
| DELETE | 기존 데이터 삭제 |

이번 장에서는 앞에서 만든 `TBL_NEWS` 테이블을 사용합니다.

---

## 2. 현재까지 완성된 구조

앞 장에서 다음 객체를 생성했습니다.

```text
TBL_NEWS
SEQ_NEWS_NO
```

뉴스 테이블 구조는 다음과 같습니다.

| 컬럼명 | 설명 |
|---|---|
| NEWS_NO | 뉴스 고유번호 |
| PRESS_NAME | 언론사명 |
| RANKING | 뉴스 순위 |
| TITLE | 기사 제목 |
| ARTICLE_URL | 기사 링크 |
| REG_DATE | 등록일시 |

---

## 3. INSERT

INSERT는 테이블에 새로운 행(Row)을 추가하는 명령어입니다.

뉴스 기사 한 건을 등록하면 `TBL_NEWS`에 하나의 행이 추가됩니다.

```text
뉴스 기사 1건
    ↓
INSERT 실행
    ↓
TBL_NEWS에 Row 1개 추가
```

### 시퀀스를 이용한 뉴스번호 생성

`NEWS_NO`는 직접 입력하지 않고 다음 시퀀스를 사용합니다.

```text
SEQ_NEWS_NO.NEXTVAL
```

시퀀스를 호출할 때마다 새로운 번호가 생성됩니다.

```text
1 → 2 → 3 → 4 → ...
```

---

## 4. 컬럼명을 작성하는 INSERT 방식

INSERT를 작성할 때는 저장할 컬럼명을 함께 작성하는 것이 좋습니다.

```text
INSERT INTO 테이블명 (
    컬럼1,
    컬럼2,
    컬럼3
)
VALUES (
    값1,
    값2,
    값3
);
```

컬럼 순서와 VALUES의 값 순서가 일치해야 합니다.

| 컬럼 | 값 |
|---|---|
| PRESS_NAME | 언론사명 |
| RANKING | 순위 |
| TITLE | 기사 제목 |
| ARTICLE_URL | 기사 링크 |

`REG_DATE`는 `DEFAULT SYSDATE`가 설정되어 있으므로 생략할 수 있습니다.

---

## 5. 등록 결과 확인

DML을 실행한 뒤에는 반드시 SELECT로 결과를 확인합니다.

```text
INSERT 실행
    ↓
SELECT 실행
    ↓
저장 결과 확인
```

확인할 내용은 다음과 같습니다.

- 데이터가 정상적으로 등록되었는가?
- 뉴스번호가 자동 생성되었는가?
- 등록일시가 자동 저장되었는가?
- 컬럼별 값이 올바르게 들어갔는가?

---

## 6. UPDATE

UPDATE는 기존 데이터를 수정하는 명령어입니다.

예를 들어 다음 상황에서 사용합니다.

- 언론사명이 잘못 저장된 경우
- 기사 제목의 오타를 수정하는 경우
- 순위를 변경하는 경우

UPDATE에서는 어떤 행을 수정할 것인지 조건을 지정해야 합니다.

```text
UPDATE
    ↓
SET으로 변경할 값 지정
    ↓
WHERE로 수정할 행 지정
```

### WHERE가 중요한 이유

WHERE 조건을 생략하면 테이블의 모든 행이 수정될 수 있습니다.

따라서 UPDATE를 실행하기 전에 먼저 같은 WHERE 조건으로 SELECT를 실행해 수정 대상을 확인하는 습관이 필요합니다.

```text
SELECT로 대상 확인
    ↓
UPDATE 실행
    ↓
SELECT로 결과 확인
```

---

## 7. DELETE

DELETE는 테이블에 저장된 행을 삭제하는 명령어입니다.

예를 들어 다음 상황에서 사용합니다.

- 잘못 등록된 뉴스 삭제
- 테스트 데이터 삭제
- 중복 데이터 삭제

DELETE도 WHERE 조건이 매우 중요합니다.

WHERE를 생략하면 테이블의 모든 데이터가 삭제될 수 있습니다.

```text
SELECT로 대상 확인
    ↓
DELETE 실행
    ↓
SELECT로 삭제 결과 확인
```

---

## 8. 트랜잭션

트랜잭션(Transaction)은 데이터베이스에서 하나의 작업 단위입니다.

INSERT, UPDATE, DELETE를 실행한 직후에는 변경 내용을 확정하거나 취소할 수 있습니다.

| 명령어 | 역할 |
|---|---|
| COMMIT | 변경 내용을 최종 확정 |
| ROLLBACK | 마지막 COMMIT 이후 변경 내용 취소 |

---

## 9. COMMIT

COMMIT을 실행하면 현재까지 수행한 변경 내용이 데이터베이스에 최종 저장됩니다.

```text
INSERT / UPDATE / DELETE
    ↓
결과 확인
    ↓
COMMIT
    ↓
변경 내용 확정
```

COMMIT 이후에는 일반적으로 ROLLBACK으로 되돌릴 수 없습니다.

---

## 10. ROLLBACK

ROLLBACK은 마지막 COMMIT 이후 실행한 INSERT, UPDATE, DELETE 작업을 취소합니다.

```text
잘못된 UPDATE 실행
    ↓
결과 확인
    ↓
ROLLBACK
    ↓
변경 전 상태로 복구
```

실습에서는 일부 데이터를 수정한 뒤 ROLLBACK을 실행하여 복구 과정을 확인합니다.

---

## 11. DDL과 트랜잭션의 차이

Oracle에서는 CREATE TABLE, ALTER TABLE, DROP TABLE과 같은 DDL을 실행하면 암시적으로 COMMIT이 발생할 수 있습니다.

따라서 다음을 구분해야 합니다.

| 구분 | 주요 명령어 | ROLLBACK |
|---|---|---|
| DML | INSERT, UPDATE, DELETE | COMMIT 전 가능 |
| DDL | CREATE, ALTER, DROP | 일반적으로 되돌리기 어려움 |

---

## 12. 이번 장 실습 순서

다음 파일을 엽니다.

```text
sql/02_뉴스데이터_DML.sql
```

실습 순서는 다음과 같습니다.

1. `TBL_NEWS` 구조 확인
2. 테스트 뉴스 데이터 등록
3. 등록 결과 조회
4. COMMIT 실행
5. 뉴스 데이터 수정
6. 수정 결과 확인
7. ROLLBACK 실행
8. 뉴스 데이터 삭제
9. 삭제 결과 확인
10. ROLLBACK 또는 COMMIT 선택

---

## 13. 실무에서는

### INSERT할 때 컬럼명을 작성합니다

컬럼명을 생략하면 테이블 구조가 변경되었을 때 오류가 발생하기 쉽습니다.

### UPDATE와 DELETE 전에 SELECT를 먼저 실행합니다

수정·삭제 대상을 먼저 확인하면 전체 데이터가 잘못 변경되는 사고를 줄일 수 있습니다.

### 작업 단위가 끝나면 COMMIT합니다

여러 건을 등록할 때 매 행마다 COMMIT하기보다, 논리적인 작업 단위가 끝난 뒤 COMMIT하는 방식이 일반적입니다.

### 테스트 데이터와 실제 데이터를 구분합니다

테스트용 뉴스에는 제목 앞에 `[테스트]`와 같은 표시를 넣으면 나중에 쉽게 찾고 삭제할 수 있습니다.

---

## 14. 프로젝트 연결

이번 장에서는 소량의 뉴스를 SQL로 직접 등록합니다.

```text
SQL로 뉴스 몇 건 등록
    ↓
DML 동작 확인
    ↓
트랜잭션 이해
    ↓
Python으로 CSV 전체 등록
```

다음 단계에서는 Python이 CSV 파일을 읽고, 여러 뉴스 데이터를 Oracle에 반복하여 등록합니다.

---

## 핵심 정리

- INSERT는 데이터를 추가한다.
- UPDATE는 기존 데이터를 수정한다.
- DELETE는 데이터를 삭제한다.
- UPDATE와 DELETE에서는 WHERE 조건이 중요하다.
- COMMIT은 변경 내용을 확정한다.
- ROLLBACK은 마지막 COMMIT 이후 변경 내용을 취소한다.
- DML 실행 후에는 SELECT로 결과를 확인해야 한다.

---

## 완료 확인

- [ ] `sql/02_뉴스데이터_DML.sql` 파일을 실행했다.
- [ ] 시퀀스를 이용하여 뉴스번호를 생성했다.
- [ ] INSERT로 뉴스 데이터를 등록했다.
- [ ] UPDATE와 DELETE 전에 SELECT로 대상을 확인했다.
- [ ] COMMIT과 ROLLBACK의 차이를 확인했다.

---

## 다음 시간

다음 시간에는 SELECT를 이용하여 구축된 뉴스 데이터를 검색합니다.

- 전체 뉴스 조회
- 특정 언론사 뉴스 조회
- 제목 키워드 검색
- 순위별 조회
- 언론사별 기사 수 집계
- 최신 뉴스 정렬
