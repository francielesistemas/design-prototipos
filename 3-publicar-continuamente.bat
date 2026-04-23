@echo off
REM ===========================================================
REM  PUBLICADOR AUTOMATICO
REM  A cada 30 segundos, verifica se houve mudanca nos arquivos.
REM  Se sim, commita e da push pro GitHub automaticamente.
REM  O deploy no link publico acontece em ~1-2 min depois.
REM
REM  Deixe esta janela aberta enquanto trabalha. Pra parar,
REM  feche a janela ou aperte Ctrl+C.
REM ===========================================================

setlocal
cd /d "%~dp0"

echo.
echo ============================================================
echo  Publicador automatico LIGADO
echo ============================================================
echo   A cada 30s verifica mudancas e, se houver, commita e publica.
echo.
echo   Link publico: https://francielesistemas.github.io/design-prototipos/
echo   Deploy automatico roda em ~1-2 min apos cada push.
echo.
echo   Para parar: feche esta janela ou Ctrl+C.
echo ============================================================
echo.

:loop
timeout /t 30 /nobreak >nul

git add -A >nul 2>&1
git diff --cached --quiet
if %errorlevel% == 0 (
    echo [%TIME%] Sem mudancas.
    goto loop
)

echo.
echo [%TIME%] Mudancas detectadas. Commitando...
git commit -m "wip: atualizacoes automaticas" >nul
if %errorlevel% neq 0 (
    echo [%TIME%] Falhou o commit. Verifique manualmente.
    goto loop
)

echo [%TIME%] Enviando pro GitHub...
git push >nul 2>&1
if %errorlevel% == 0 (
    echo [%TIME%] Publicado! Deploy rodando, link atualiza em ~1-2 min.
) else (
    echo [%TIME%] Push falhou ^(sem rede ou conflito^). Rode 2-publicar-github.bat depois.
)
goto loop
