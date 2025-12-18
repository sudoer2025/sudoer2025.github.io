@echo off
title Hexo Auto Server

echo [1/4] Checking Port 4000...
:: 精准打击：只查找占用 4000 端口的进程 ID (PID) 并将其结束
:: 这样不会误伤你电脑上其他正在运行的 Node 程序
for /f "tokens=5" %%a in ('netstat -aon ^| find ":4000" ^| find "LISTENING"') do taskkill /f /pid %%a >nul 2>&1

echo [2/4] Cleaning old files...
call hexo clean

echo [3/4] Generating static files...
call hexo g

echo [4/4] Starting server...
echo The browser will open automatically in 3 seconds.

:: 启动倒计时打开浏览器
start "" cmd /c "timeout /t 3 /nobreak >nul & start http://localhost:4000/"

:: 启动服务器
call hexo s

pause