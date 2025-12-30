@echo off
title Hexo Source Backup
echo Starting Git backup via WSL...

:: 进入目录并执行 Git 备份
:: 删除了复杂的日期变量，避免格式冲突
wsl bash -c "cd /mnt/f/my-blog && echo '[WSL] Adding changes...' && git add . && echo '[WSL] Committing...' && git commit -m 'Source_Backup_Auto' && echo '[WSL] Pushing...' && git push origin main"

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Backup Failed!
    echo Please check if there are conflicts or network issues.
    pause
    exit /b
)

echo.
echo [SUCCESS] Source backup complete!
pause