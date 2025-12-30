@echo off
title Hexo Source Backup
echo Starting Git backup via WSL...

:: 进入目录
:: 逻辑优化：不论有没有新提交，都尝试 push 一次
wsl bash -c "cd /mnt/f/my-blog && echo '[WSL] Adding changes...' && git add . && echo '[WSL] Committing...' && (git commit -m 'Source_Backup_Auto' || echo 'No new changes to commit') && echo '[WSL] Pushing...' && git push origin main"

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Push Failed! 
    echo If it says 'rejected', run 'git pull origin main --rebase' in WSL.
    pause
    exit /b
)

echo.
echo [SUCCESS] Source backup complete!
pause