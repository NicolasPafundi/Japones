@echo off
setlocal

:: CONFIGURACIÓN
set REPO_URL=https://github.com/NicolasPafundi/JaponesDev.git
set BRANCH=gh-pages
set PUBLISH_DIR=publish_output

echo ===== PUBLICANDO EL PROYECTO BLazor WASM =====
dotnet publish -c Release -o %PUBLISH_DIR%

if not exist "%PUBLISH_DIR%\wwwroot" (
    echo ERROR: No se encontró el directorio %PUBLISH_DIR%\wwwroot
    pause
    exit /b 1
)

echo ===== CLONANDO RAMA gh-pages =====
rmdir /s /q temp_gh_pages 2>nul
git clone -b %BRANCH% %REPO_URL% temp_gh_pages

cd temp_gh_pages

echo ===== LIMPIANDO ARCHIVOS ANTERIORES =====
del /q *.* >nul 2>&1
rmdir /s /q * >nul 2>&1

echo ===== COPIANDO NUEVOS ARCHIVOS =====
xcopy /E /Y /I ..\%PUBLISH_DIR%\wwwroot\* .

echo ===== COMMIT Y PUSH =====
git add .
git commit -m "Deploy Blazor to GitHub Pages"
git push origin %BRANCH%

cd ..
rmdir /s /q temp_gh_pages
rmdir /s /q %PUBLISH_DIR%

echo ===== PUBLICADO CORRECTAMENTE =====
pause
