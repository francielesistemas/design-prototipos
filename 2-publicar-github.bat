@echo off
REM ===========================================================
REM  O repo design-prototipos ja foi criado no GitHub.
REM  Este script so faz o push do codigo local.
REM ===========================================================

cd /d "%~dp0"

echo.
echo === [1/4] Configurando credenciais do Git (se necessario) ===
where gh >nul 2>&1
if not errorlevel 1 (
    gh auth setup-git
)

echo.
echo === [2/4] Garantindo commit local ===
if not exist ".git\HEAD" (
    echo Repositorio git nao inicializado. Rode 0-primeira-vez.bat primeiro.
    pause
    exit /b 1
)

git branch -M main
git add -A
git diff-index --quiet HEAD 2>nul || git commit -m "chore: atualizacoes antes do push"

echo.
echo === [3/4] Configurando remote do GitHub ===
git remote remove origin 2>nul
git remote add origin https://github.com/francielesistemas/design-prototipos.git
git remote -v

echo.
echo === [4/4] Enviando codigo pro GitHub ===
echo Se pedir login, use sua conta do GitHub.
echo.
git push -u origin main

if errorlevel 1 (
    echo.
    echo Push falhou. Me manda a mensagem de erro que apareceu acima.
    pause
    exit /b 1
)

echo.
echo ================================================================
echo  PUSH CONCLUIDO!
echo.
echo  Repositorio:
echo    https://github.com/francielesistemas/design-prototipos
echo.
echo  Aba Actions (acompanhar o deploy do GitHub Pages):
echo    https://github.com/francielesistemas/design-prototipos/actions
echo.
echo  Link publico do protipo (ativa em 1-3 min apos o deploy):
echo    https://francielesistemas.github.io/design-prototipos/
echo ================================================================
pause
