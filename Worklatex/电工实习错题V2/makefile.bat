@echo off
rem 运行 xelatex 第一次
xelatex diangong

rem 检查 xelatex 是否成功运行
if %errorlevel% neq 0 (
    echo xelatex 运行失败
    exit /b %errorlevel%
)

rem 再次运行 xelatex
xelatex diangong

rem 检查第二次 xelatex 是否成功运行
if %errorlevel% neq 0 (
    echo xelatex 第二次运行失败
    exit /b %errorlevel%
)

echo xelatex 运行完成