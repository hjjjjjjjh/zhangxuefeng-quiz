@echo off
chcp 65001 >nul
title 张雪峰智能志愿百科
echo.
echo  ╔══════════════════════════════════════╗
echo  ║   张 雪 峰 说 · 智能志愿百科        ║
echo  ║   SYS://INTELLIGENT-ADVISOR         ║
echo  ╚══════════════════════════════════════╝
echo.

:: Step 1: Python
echo  [1/4] 检查 Python...
python --version 2>nul
if errorlevel 1 (
    echo  [X] 未找到 Python
    echo.
    echo  请安装 Python 3.8+: https://www.python.org/downloads/
    echo  安装时勾选 "Add Python to PATH"
    pause
    exit /b 1
)
echo  [OK] Python 已安装
echo.

:: Step 2: 依赖
echo  [2/4] 检查依赖...
python -c "import flask" 2>nul
if errorlevel 1 (
    echo  [*] 正在安装 flask...
    pip install flask -q
)
python -c "import flask_cors" 2>nul
if errorlevel 1 (
    echo  [*] 正在安装 flask-cors...
    pip install flask-cors -q
)
python -c "import anthropic" 2>nul
if errorlevel 1 (
    echo  [*] 正在安装 anthropic...
    pip install anthropic -q
)
python -c "import ddgs" 2>nul
if errorlevel 1 (
    echo  [*] 正在安装 ddgs...
    pip install ddgs -q
)
echo  [OK] 依赖就绪
echo.

:: Step 3: API Key 检查
echo  [3/4] 检查 API 配置...
python -c "import os; k=os.environ.get('ANTHROPIC_AUTH_TOKEN','') or os.environ.get('ANTHROPIC_API_KEY',''); print('OK' if k else 'MISSING')" > _keycheck.txt 2>nul
set /p KEYSTATUS=<_keycheck.txt
del _keycheck.txt 2>nul
if "%KEYSTATUS%"=="MISSING" (
    echo  [!] 未检测到 API Key
    echo.
    echo  方式A: 设置环境变量 ANTHROPIC_API_KEY
    echo  方式B: 修改 app.py 中的配置
    echo.
    echo  百科问答需要 API Key
    echo  专业数据库和测评功能无需 Key 可直接使用
    echo.
) else (
    echo  [OK] API Key 已配置
)
echo.

:: Step 4: 启动
echo  [4/4] 启动服务...
echo.
echo  ╔══════════════════════════════════════╗
echo  ║  访问: http://localhost:5000         ║
echo  ║  按 Ctrl+C 停止                     ║
echo  ╚══════════════════════════════════════╝
echo.

:: 自动打开浏览器
start http://localhost:5000

:: 启动 Flask
python app.py

pause
