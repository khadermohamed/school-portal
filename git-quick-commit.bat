@echo off
REM ============================================================================
REM Quick Git Commit Script
REM ============================================================================
REM Simple script for quick commits with custom message
REM ============================================================================

echo.
echo ========================================
echo  Quick Git Commit
echo ========================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Git is not installed or not in PATH
    pause
    exit /b 1
)

REM Check if we're in a git repository
git rev-parse --git-dir >nul 2>&1
if errorlevel 1 (
    echo [INFO] Initializing git repository...
    git init
    echo [SUCCESS] Git repository initialized
    echo.
)

REM Show current status
echo Current status:
echo.
git status --short
echo.

REM Ask for commit message
set /p commit_msg="Enter commit message (or press Enter for default): "

if "%commit_msg%"=="" (
    set commit_msg=feat: implement SchoolPortal microservices architecture
    echo [INFO] Using default commit message
)

echo.
echo [INFO] Staging all files...
git add .

echo [INFO] Creating commit...
git commit -m "%commit_msg%"

if errorlevel 1 (
    echo [ERROR] Commit failed
    pause
    exit /b 1
)

echo [SUCCESS] Commit created successfully
echo.

REM Ask about pushing
set /p push_choice="Push to remote? (y/n): "

if /i "%push_choice%"=="y" (
    git push
    if errorlevel 1 (
        echo [WARNING] Push failed. You may need to set up remote first.
        echo Use: git remote add origin YOUR_REPO_URL
    ) else (
        echo [SUCCESS] Pushed to remote
    )
)

echo.
echo Recent commits:
git log --oneline -3
echo.
pause
