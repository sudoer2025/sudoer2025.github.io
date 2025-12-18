@echo off
chcp 65001 >nul
title Hexo Blog Auto Deploy & Backup Tool
color 0A

echo =======================================================
echo        正在启动 Hexo 自动发布与备份程序...
echo =======================================================
echo.

:: ---------------------------------------------------------
:: 第一步：清理、生成并发布到 VPS 服务器
:: ---------------------------------------------------------
echo [1/2] 正在清理缓存并生成静态页面...
call hexo clean
call hexo g

echo.
echo [1/2] 正在发布到 VPS (142.171.239.31)...
call hexo d

if %errorlevel% neq 0 (
    color 0C
    echo.
    echo [ERROR] 发布失败！请检查 VPS 连接或配置。
    pause
    exit /b
)
echo [SUCCESS] VPS 发布成功！网站已更新。
echo.

:: ---------------------------------------------------------
:: 第二步：备份源码到 GitHub (sudoer2025.github.io)
:: ---------------------------------------------------------
echo [2/2] 正在备份源码到 GitHub...

:: 添加所有文件到暂存区
git add .

:: 提交更改，备注包含当前日期和时间
git commit -m "Site Update: %date% %time%"

:: 推送到 GitHub (假设远程仓库名叫 origin，分支叫 main 或 master)
:: 如果你的 GitHub 主分支叫 main，请把下面的 master 改成 main
git push origin main

if %errorlevel% neq 0 (
    color 0E
    echo.
    echo [WARNING] 备份失败！可能原因：
    echo 1. 你还没有把 GitHub 仓库关联为 origin。
    echo 2. 网络连接 GitHub 超时。
    echo 3. 本地代码和远程有冲突（试着先 git pull）。
    pause
    exit /b
)

echo.
echo =======================================================
echo               恭喜！发布与备份全部完成！
echo =======================================================
echo.
pause