@echo off
echo ===== PUBLICANDO EL PROYECTO =====

REM Publicar Blazor WASM
dotnet publish -c Release

REM Eliminar carpeta temporal si ya existe
rmdir /S /Q _publish
mkdir _publish

REM Copiar solo el contenido dentro de la subcarpeta correcta
xcopy /E /I /Y Japones\bin\Release\net8.0\publish\wwwroot\Japones\* _publish

REM Inicializar repositorio temporal
cd _publish
git init
git remote add origin https://github.com/nicolaspafundi/Japones.git
git checkout -b gh-pages

REM Subir contenido al branch gh-pages
git add .
git commit -m "Deploy Blazor to GitHub Pages"
git push -f origin gh-pages

cd ..
rmdir /S /Q _publish
echo ===== DEPLOY COMPLETADO =====
pause
