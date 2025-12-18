@echo off
title Hexo WSL Deploy
echo Starting deployment via WSL...

:: Check if we are in the right folder (optional but safe)
:: Execute the Linux commands via WSL
:: 1. Go to path /mnt/f/my-blog
:: 2. Clean -> Generate -> Deploy -> Git Backup

wsl bash -c "cd /mnt/f/my-blog && echo '[WSL] Cleaning...' && hexo clean && echo '[WSL] Generating...' && hexo g && echo '[WSL] Deploying...' && hexo d && echo '[WSL] Backing up...' && git add . && git commit -m 'Auto update' && git push origin main"

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Something went wrong!
    echo Please verify that your blog is actually at F:\my-blog
    pause
    exit /b
)

echo.
echo [SUCCESS] All done!
pause