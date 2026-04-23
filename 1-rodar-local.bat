@echo off
REM ===========================================================
REM  Inicia o servidor local pra voce ver os prototipos no
REM  navegador. URL: https://localhost:5001
REM
REM  Para parar: feche esta janela ou aperte Ctrl+C aqui dentro.
REM ===========================================================

cd /d "%~dp0"

echo.
echo === Subindo servidor local de prototipos ===
echo.
echo     Quando ver "Now listening on: https://localhost:5001"
echo     abra no navegador: https://localhost:5001
echo.
echo     (Para parar: feche esta janela ou aperte Ctrl+C)
echo.

dotnet run --project src\Prototipos\Prototipos.csproj
pause
