@echo off
chcp 65001 >nul
title 법무부 정심 업무도우미 - 로컬 서버

cd /d "%~dp0"

echo ============================================
echo   법무부 정심 업무도우미를 시작합니다...
echo ============================================
echo.

where python >nul 2>nul
if %errorlevel% neq 0 (
    echo [오류] 이 컴퓨터에 Python이 설치되어 있지 않아요.
    echo https://www.python.org/downloads/ 에서 Python을 먼저 설치한 뒤
    echo 이 파일을 다시 실행해주세요.
    echo.
    pause
    exit /b 1
)

start "" http://localhost:8877/index.html

echo 브라우저가 자동으로 열리지 않으면 아래 주소를 직접 입력하세요:
echo   http://localhost:8877/index.html
echo.
echo 이 창을 닫으면 앱이 종료돼요. 계속 켜두세요.
echo ============================================
echo.

python -m http.server 8877

pause
