@echo off
title Hexo WSL Deploy (VPS Only)
echo Starting deployment via WSL...

:: 仅执行 Hexo 的核心发布流程，去掉了 Git 备份部分
wsl bash -c "cd /mnt/f/my-blog && echo '[WSL] Cleaning...' && hexo clean && echo '[WSL] Generating...' && hexo g && echo '[WSL] Deploying...' && hexo d"

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Something went wrong!
    echo Please verify that your blog is actually at F:\my-blog
    pause
    exit /b
)

echo.
echo [SUCCESS] 部署完成！网站已同步至 VPS。
pause