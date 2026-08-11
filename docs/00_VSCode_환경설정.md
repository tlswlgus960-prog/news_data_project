# Python 개발환경 구축 (VS Code)

## 실습 목표

VS Code를 이용하여 Python 개발환경을 구축하고 데이터 분석 및
데이터베이스 구축에 필요한 패키지를 설치합니다.

## 1. Python 설치

-   Python 3.11.x 권장
-   https://www.python.org/downloads/
-   설치 시 **Add Python to PATH** 체크

## 2. VS Code 설치

-   https://code.visualstudio.com/

## 3. 확장 프로그램

-   Python
-   Jupyter
-   Pylance

## 4. 프로젝트 폴더 생성

    news_data_project

## 5. VS Code 터미널 실행

    Terminal → New Terminal

## 6. Python 설치 확인

``` bash
python --version
```

또는

``` bash
py --version
```

## 7. 가상환경 생성

``` bash
python -m venv venv


```

## 8. 가상환경 활성화
``` powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\venv\Scripts\Activate.ps1
```

## 9. Python Interpreter 선택

    Ctrl + Shift + P
    → Python: Select Interpreter
    → venv\Scripts\python.exe

## 10. pip 업데이트

``` bash
python -m pip install --upgrade pip
```

## 11. 패키지 설치

``` bash
pip install pandas numpy openpyxl matplotlib plotly seaborn requests beautifulsoup4 lxml selenium oracledb sqlalchemy konlpy wordcloud koreanize-matplotlib scikit-learn fastapi uvicorn jinja2 python-multipart jupyter ipykernel
```

## 12. 설치 확인

``` bash
pip list
```

## 13. requirements.txt 저장

``` bash
pip freeze > requirements.txt
```

## 14. test.py 실행

``` python
import pandas as pd
import numpy as np
import matplotlib
import plotly
import requests
import selenium
import oracledb
import sklearn
import fastapi

print("환경설정 완료")
```

``` bash
python test.py
```

## 전체 순서

Python 설치 ↓ VS Code 설치 ↓ 확장 프로그램 설치 ↓ 프로젝트 폴더 생성 ↓
VS Code 터미널 실행 ↓ Python 설치 확인 ↓ 가상환경 생성 ↓ 가상환경 활성화
↓ Interpreter 선택 ↓ pip 업데이트 ↓ 패키지 설치 ↓ requirements.txt 생성
↓ 패키지 테스트


https://www.oracle.com/kr/database/technologies/instant-client/downloads.html

