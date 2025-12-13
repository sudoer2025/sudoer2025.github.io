@echo off
echo [1/3] 正在清理旧文件并重新生成 (Building)...
call hexo clean
call hexo g

echo.
echo [2/3] 正在上传到美国服务器 (Uploading)...
:: 注意：这里假设你的服务器路径是 /root/blog，如果不是请修改
scp -r public/* root@142.171.239.31:/root/blog

echo.
echo [3/3] 任务完成！(Done)
echo =======================================================
echo  请访问 http://142.171.239.31 (或你的域名) 查看效果
echo =======================================================
pause