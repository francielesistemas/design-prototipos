@echo off
REM ===========================================================
REM  Limpa qualquer .git quebrado, inicializa repositorio novo
REM  e cria o primeiro commit com tudo o que ja esta na pasta.
REM  Rode UMA UNICA VEZ na primeira configuracao.
REM ===========================================================

cd /d "%~dp0"

echo.
echo === [1/5] Removendo .git antigo (se existir) ===
rmdir /s /q .git         2>nul
rmdir /s /q .git-quebrado 2>nul

echo.
echo === [2/5] Checando .NET SDK e Git ===
dotnet --version || (echo. & echo !!! .NET nao encontrado. Baixe o SDK 8 em https://dotnet.microsoft.com/download/dotnet/8.0 & pause & exit /b 1)
git --version    || (echo. & echo !!! Git nao encontrado. Baixe em https://git-scm.com/download/win & pause & exit /b 1)

echo.
echo === [3/5] Inicializando repositorio git ===
git init -b main
git config user.email "franciele.sistemas@lar.ind.br"
git config user.name "Franciele Lar"

echo.
echo === [4/5] Adicionando e commitando arquivos ===
git add -A
git commit -m "chore: estrutura inicial do repositorio de prototipos"

echo.
echo === [5/5] Restaurando pacotes NuGet (pode levar 1-2 min) ===
dotnet restore src\Prototipos\Prototipos.csproj

echo.
echo ============================================================
echo  OK! Primeira configuracao concluida.
echo  Proximo passo: de dois cliques em "1-rodar-local.bat"
echo ============================================================
pause
