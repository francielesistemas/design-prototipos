@echo off
REM ===========================================================
REM  Inicia o servidor local pra voce ver os prototipos no
REM  navegador. URL: https://localhost:5001
REM
REM  Para parar: feche esta janela ou aperte Ctrl+C aqui dentro.
REM ===========================================================

cd /d "%~dp0"

echo.
echo === Subindo servidor local com HOT RELOAD ===
echo.
echo     Quando ver "Now listening on: https://localhost:5001"
echo     abra no navegador: https://localhost:5001
echo.
echo     HOT RELOAD: qualquer mudanca em arquivo .razor/.css eh
echo     detectada automaticamente e o navegador recarrega em 1-2s.
echo     Voce nao precisa parar e rodar de novo.
echo.
echo     (Para parar de vez: feche esta janela ou aperte Ctrl+C)
echo.

dotnet watch --project src\Prototipos\Prototipos.csproj --non-interactive
pause
