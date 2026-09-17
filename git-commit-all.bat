@echo off
REM ============================================================================
REM Git Commit Script for SchoolPortal Project
REM ============================================================================
REM This script automates the Git commit process following the commit roadmap
REM ============================================================================

echo.
echo ========================================
echo  SchoolPortal Git Commit Automation
echo ========================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Git is not installed or not in PATH
    echo Please install Git from https://git-scm.com/
    pause
    exit /b 1
)

REM Check if we're in a git repository
git rev-parse --git-dir >nul 2>&1
if errorlevel 1 (
    echo [INFO] Not a git repository. Initializing...
    git init
    echo [SUCCESS] Git repository initialized
    echo.
) else (
    echo [INFO] Git repository detected
    echo.
)

REM Ask user for commit strategy
echo Choose your commit strategy:
echo.
echo [1] Single commit (all changes in one commit)
echo [2] Structured commits (13 separate commits following roadmap)
echo [3] Exit without committing
echo.
set /p choice="Enter your choice (1, 2, or 3): "

if "%choice%"=="3" (
    echo.
    echo [INFO] Exiting without making commits
    pause
    exit /b 0
)

if "%choice%"=="1" goto single_commit
if "%choice%"=="2" goto structured_commits

echo [ERROR] Invalid choice. Please run the script again.
pause
exit /b 1

REM ============================================================================
REM SINGLE COMMIT STRATEGY
REM ============================================================================
:single_commit
echo.
echo ========================================
echo  Single Commit Strategy
echo ========================================
echo.

echo [INFO] Staging all files...
git add .

echo [INFO] Creating commit...
git commit -m "feat: implement SchoolPortal microservices architecture" -m "- Add Students microservice with CRUD operations and API endpoints" -m "- Add Grades microservice with inter-service communication" -m "- Implement Entity Framework Core with automatic migrations" -m "- Add Docker containerization with multi-stage builds" -m "- Configure Docker Compose for service orchestration" -m "- Add modern Tailwind CSS UI with responsive design" -m "- Include comprehensive documentation and setup guides"

if errorlevel 1 (
    echo [ERROR] Commit failed
    pause
    exit /b 1
)

echo [SUCCESS] Commit created successfully
goto push_prompt

REM ============================================================================
REM STRUCTURED COMMITS STRATEGY
REM ============================================================================
:structured_commits
echo.
echo ========================================
echo  Structured Commits Strategy
echo ========================================
echo.
echo [WARNING] This will create 13 separate commits
echo Press Ctrl+C to cancel, or
pause

REM Commit 1: Initial Setup
echo.
echo [1/13] Committing: Initial Setup
git add .gitignore Directory.Packages.props SchoolPortal.slnx SchoolPortal.slnLaunch.user
git commit -m "chore: initialize project structure and configuration" -m "- Add .gitignore with comprehensive exclusions" -m "- Configure Central Package Management (CPM)" -m "- Set up solution structure"
if errorlevel 1 echo [WARNING] Commit 1 failed or no changes

REM Commit 2: Students Service Core
echo [2/13] Committing: Students Service Core
git add SchoolPortal.Students/*.csproj SchoolPortal.Students/Program.cs SchoolPortal.Students/Models/ SchoolPortal.Students/Data/ SchoolPortal.Students/Controllers/ SchoolPortal.Students/Handlers/ SchoolPortal.Students/appsettings*.json
git commit -m "feat(students): implement Students microservice with CRUD operations" -m "- Add Student model with EF Core configuration" -m "- Implement StudentDbContext with auto-migration" -m "- Create StudentsController with CRUD and API endpoints" -m "- Add custom exception handler" -m "- Configure connection strings for local and Docker"
if errorlevel 1 echo [WARNING] Commit 2 failed or no changes

REM Commit 3: Students Migrations
echo [3/13] Committing: Students Migrations
git add SchoolPortal.Students/Migrations/
git commit -m "feat(students): add Entity Framework migrations for Students database" -m "- Add initial migration for Students table" -m "- Configure Student entity with constraints"
if errorlevel 1 echo [WARNING] Commit 3 failed or no changes

REM Commit 4: Students Views
echo [4/13] Committing: Students Views
git add SchoolPortal.Students/Views/ SchoolPortal.Students/wwwroot/ SchoolPortal.Students/libman.json
git commit -m "feat(students): add Razor views with modern Tailwind CSS design" -m "- Implement responsive layout with neon-themed design" -m "- Add CRUD views for student management" -m "- Configure Tailwind CSS and Bootstrap Icons" -m "- Add modern home page with service navigation"
if errorlevel 1 echo [WARNING] Commit 4 failed or no changes

REM Commit 5: Grades Service Core
echo [5/13] Committing: Grades Service Core
git add SchoolPortal.Grades/*.csproj SchoolPortal.Grades/Program.cs SchoolPortal.Grades/Models/ SchoolPortal.Grades/Data/ SchoolPortal.Grades/Controllers/ SchoolPortal.Grades/Handlers/ SchoolPortal.Grades/appsettings*.json
git commit -m "feat(grades): implement Grades microservice with CRUD operations" -m "- Add Grade model with EF Core configuration" -m "- Implement GradeDbContext with auto-migration" -m "- Create GradesController with CRUD operations" -m "- Add custom exception handler" -m "- Configure connection strings and service URLs"
if errorlevel 1 echo [WARNING] Commit 5 failed or no changes

REM Commit 6: Grades Inter-Service Communication
echo [6/13] Committing: Grades Inter-Service Communication
git add SchoolPortal.Grades/Services/
git commit -m "feat(grades): add HTTP client for Students service validation" -m "- Implement StudentsClient for API communication" -m "- Add student existence validation before grade creation" -m "- Configure HttpClient with base URL from configuration"
if errorlevel 1 echo [WARNING] Commit 6 failed or no changes

REM Commit 7: Grades Migrations
echo [7/13] Committing: Grades Migrations
git add SchoolPortal.Grades/Migrations/
git commit -m "feat(grades): add Entity Framework migrations for Grades database" -m "- Add initial migration for Grades table" -m "- Configure Grade entity with constraints"
if errorlevel 1 echo [WARNING] Commit 7 failed or no changes

REM Commit 8: Grades Views
echo [8/13] Committing: Grades Views
git add SchoolPortal.Grades/Views/ SchoolPortal.Grades/wwwroot/ SchoolPortal.Grades/libman.json
git commit -m "feat(grades): add Razor views with modern Tailwind CSS design" -m "- Implement responsive layout with neon-themed design" -m "- Add CRUD views for grade management" -m "- Configure Tailwind CSS and Bootstrap Icons" -m "- Add modern home page"
if errorlevel 1 echo [WARNING] Commit 8 failed or no changes

REM Commit 9: Students Dockerfile
echo [9/13] Committing: Students Dockerfile
git add SchoolPortal.Students/Dockerfile
git commit -m "build(docker): add Dockerfile for Students service" -m "- Create multi-stage build with SDK and runtime images" -m "- Optimize layer caching with separate restore step" -m "- Configure for Central Package Management" -m "- Expose port 8080 for container communication"
if errorlevel 1 echo [WARNING] Commit 9 failed or no changes

REM Commit 10: Grades Dockerfile
echo [10/13] Committing: Grades Dockerfile
git add SchoolPortal.Grades/Dockerfile
git commit -m "build(docker): add Dockerfile for Grades service" -m "- Create multi-stage build with SDK and runtime images" -m "- Optimize layer caching with separate restore step" -m "- Configure for Central Package Management" -m "- Expose port 8080 for container communication"
if errorlevel 1 echo [WARNING] Commit 10 failed or no changes

REM Commit 11: Docker Compose
echo [11/13] Committing: Docker Compose
git add docker-compose.yml .dockerignore
git commit -m "build(docker): add docker-compose for multi-service orchestration" -m "- Configure SQL Server 2022 with persistent volume" -m "- Set up Students service with port 5001" -m "- Set up Grades service with port 5002" -m "- Create custom bridge network for inter-service communication" -m "- Add .dockerignore to optimize build context"
if errorlevel 1 echo [WARNING] Commit 11 failed or no changes

REM Commit 12: Documentation
echo [12/13] Committing: Documentation
git add README.md
git commit -m "docs: add comprehensive README with setup and usage instructions" -m "- Document microservices architecture with diagram" -m "- Add Docker setup and configuration guide" -m "- Include API endpoint documentation" -m "- Add troubleshooting section" -m "- Provide local development instructions"
if errorlevel 1 echo [WARNING] Commit 12 failed or no changes



REM ============================================================================
REM PUSH TO REMOTE
REM ============================================================================
:push_prompt
echo.
echo ========================================
echo  Push to Remote Repository
echo ========================================
echo.
echo Would you like to push to a remote repository?
echo.
set /p push_choice="Push to remote? (y/n): "

if /i "%push_choice%"=="y" goto setup_remote
if /i "%push_choice%"=="yes" goto setup_remote

echo.
echo [INFO] Skipping push to remote
echo [INFO] You can push later with: git push origin main
goto end

:setup_remote
echo.
echo Checking remote configuration...
git remote -v | findstr origin >nul 2>&1
if errorlevel 1 (
    echo.
    echo [INFO] No remote repository configured
    echo.
    set /p remote_url="Enter your GitHub repository URL (e.g., https://github.com/username/repo.git): "
    
    if "!remote_url!"=="" (
        echo [ERROR] No URL provided. Skipping push.
        goto end
    )
    
    echo [INFO] Adding remote origin...
    git remote add origin !remote_url!
    
    if errorlevel 1 (
        echo [ERROR] Failed to add remote
        goto end
    )
    
    echo [SUCCESS] Remote added successfully
)

echo.
echo [INFO] Pushing to remote repository...
git push -u origin main

if errorlevel 1 (
    echo.
    echo [WARNING] Push failed. This might be because:
    echo   - The branch name is different (try 'master' instead of 'main')
    echo   - Authentication is required
    echo   - The remote repository doesn't exist
    echo.
    echo Try manually with:
    echo   git push -u origin main
    echo   or
    echo   git push -u origin master
    goto end
)

echo [SUCCESS] Successfully pushed to remote repository

:end
echo.
echo ========================================
echo  Git Operations Complete
echo ========================================
echo.
echo Summary:
git log --oneline -5
echo.
echo [INFO] View full history with: git log --oneline --graph
echo [INFO] Check status with: git status
echo.
pause
