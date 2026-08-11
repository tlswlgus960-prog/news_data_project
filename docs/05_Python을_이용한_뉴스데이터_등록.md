# 05. Python을 이용한 뉴스 데이터 등록

## 학습목표

- Python과 Oracle Database를 연동할 수 있다.
- CSV 파일을 읽어 Oracle에 저장할 수 있다.
- 반복문을 이용하여 여러 건의 뉴스를 등록할 수 있다.
- COMMIT을 이용하여 저장을 완료할 수 있다.

---

## 이번 시간 학습 흐름

```text
CSV 읽기
    ↓
Oracle 연결
    ↓
INSERT 실행
    ↓
COMMIT
    ↓
SELECT로 확인
```

---

## 이번 장의 실습 파일

### Python

```text
src/insert_news.py
```

### SQL

```text
sql/03_뉴스데이터_SELECT.sql
```

---

## 1. 이번 시간 목표

앞 장에서는 SQL로 뉴스를 직접 등록했습니다.

이번 시간에는 Python이 CSV 파일을 읽어 Oracle Database에 자동으로 저장합니다.

```text
news.csv
    ↓
Python
    ↓
Oracle
```

---

## 2. 처리 순서

1. CSV 파일 읽기
2. Oracle 연결
3. INSERT SQL 준비
4. 반복문으로 뉴스 등록
5. COMMIT
6. 저장 결과 확인

---

## 3. 핵심 코드

- pandas로 CSV 읽기
- database.py의 connect_db() 사용
- cursor.execute() 실행
- SEQ_NEWS_NO.NEXTVAL 사용
- conn.commit()

실습은 `src/insert_news.py` 파일을 실행합니다.

---

## 4. 실습 순서

1. news.csv 준비
2. database.py 연결 확인
3. insert_news.py 실행
4. SQL Developer에서 SELECT 확인

---

## 실무에서는

- INSERT는 반복문보다 executemany()가 더 빠른 경우가 많습니다.
- 작업이 끝난 뒤 한 번만 COMMIT하는 것이 일반적입니다.
- 오류가 발생하면 ROLLBACK 후 원인을 수정합니다.

---

## 핵심 정리

- Python으로 Oracle을 제어할 수 있다.
- CSV 전체 데이터를 자동 등록할 수 있다.
- INSERT 후 COMMIT으로 저장을 완료한다.

---

## 다음 시간

등록된 뉴스를 SELECT로 검색하고 Python DataFrame으로 조회합니다.
