@echo off
title RED_COLLABS
echo
echo github:https://github.com/RED-collabs
echo
timeout /t 3>nul
:: ====================================================
:: Windows 11 Taskbar & Start Cleanup Script
:: Run as Administrator
:: ====================================================

:: Check for Admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script must be run as Administrator!
    pause
    exit /b
)

echo Disabling transparency effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f

echo Disabling Widgets (TaskbarDa)...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarDa /t REG_DWORD /d 0 /f

echo Disabling Task View button...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f

echo Disabling Web Search in Start...
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f

echo Disabling Recently Added Apps...
reg add "HKLM\Software\Microsoft\PolicyManager\default\Start\ShowRecentlyAddedApps" /v value /t REG_DWORD /d 0 /f

echo Disabling Most Used Apps...
reg add "HKLM\Software\Microsoft\PolicyManager\default\Start\ShowMostUsedApps" /v value /t REG_DWORD /d 0 /f

echo Disabling Recommended files in Start...
reg add "HKLM\Software\Microsoft\PolicyManager\default\Start\HideRecentJumplists" /v value /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\Start\HideRecentDocs" /v value /t REG_DWORD /d 1 /f

echo.
echo ====================================================
echo Done! Some changes need a restart to take effect.
echo ====================================================
choice /m "Do you want to restart now?"
if errorlevel 1 (
    shutdown /r /t 5
)
