#!/bin/bash
cd "$(dirname "$0")"

echo "============================================"
echo "  법무부 정심 업무도우미를 시작합니다..."
echo "============================================"
echo

if ! command -v python3 &> /dev/null; then
    echo "[오류] Python3가 설치되어 있지 않아요. https://www.python.org 에서 설치해주세요."
    exit 1
fi

URL="http://localhost:8877/index.html"

( sleep 1 && (open "$URL" 2>/dev/null || xdg-open "$URL" 2>/dev/null) ) &

echo "브라우저가 자동으로 열리지 않으면 아래 주소를 직접 입력하세요:"
echo "  $URL"
echo
echo "이 터미널을 닫으면 앱이 종료돼요. 계속 켜두세요."
echo "============================================"
echo

python3 -m http.server 8877
