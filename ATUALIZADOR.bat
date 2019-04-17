@echo off

Title Atualizador do BPA
::===============================================================================================
::=============================================MENU==============================================
::===============================================================================================
echo. 
echo ======================================================================================================================
Echo   ESSA APLICACAO IRA ATUALIZAR O BPA DE ACORDO COM A OPCAO ESCOLHIDA NO PROXIMO MENU. CASO VOCE QUEIRA REALMENTE    
echo   ATUALIZAR SEU BPA, PRESSIONE O NUMERO CORRESPONDENTE A OPCAO DESEJADA, CASO CONTRARIO, PRESSIONE QUALQUER OUTRA   
echo   TECLA DIFERENTE DAS OPCOES ABAIXO PARA SAIR. 									 
echo ======================================================================================================================
echo.
echo 1- Ressonancia
echo 2- Tomografia
echo 3- Ultrassom
echo 4- Raio-x


set /p opcao=


if %opcao% == 1 (goto :Atualiza_BPA_RM) else (if %opcao% == 2 (goto :Atualiza_BPA_TC))
if %opcao% == 3 (goto :Atualiza_BPA_US) else (if %opcao% == 4 (goto :Atualiza_BPA_RX))
if %opcao% == 5 (exit)

::===============================================================================================
::==========================================ATUALIZA RM==========================================
::===============================================================================================
goto end
:Atualiza_BPA_RM

call \\10.0.0.71\sistemas\BPA_ATUALIZADOR\download_bdsia_e_bpa.bat

mkdir D:\Perfil\%username%\Documents\BPA_RM\BKP-%date:/=-%

::Copia todos os arquivos da pasta do BPA para dentro da pasta de backup
xcopy D:\Perfil\%username%\Documents\BPA_RM\*.* D:\Perfil\%username%\Documents\BPA_RM\BKP-%date:/=-% /y

::Acessa a pasta do BPA evitando que por algum erro do windows os arquivos sejam extraídos na pasta errada
cd D:\Perfil\%username%\Documents\BPA_RM

:: Extrai o BDSIA para dentro da pasta do BPA
start D:\Perfil\%username%\Documents\BPA_RM\BDSIA.exe
:: Extrai o BPA para dentro da pasta do BPA
start D:\Perfil\%username%\Documents\BPA_RM\BPA.exe


::===============================================================================================
::==========================================ATUALIZA TC==========================================
::===============================================================================================
goto end
:Atualiza_BPA_TC
 
::Download BDSIA E BPA
powershell -command "& { iwr ftp://arpoador.datasus.gov.br/siasus/sia/BDSIA201903b.exe -OutFile D:\Perfil\%username%\Documents\BPA_TC\BDSIA.exe }"
powershell -command "& { iwr ftp://arpoador.datasus.gov.br/siasus/BPA/BPA0289.exe -OutFile D:\Perfil\%username%\Documents\BPA_TC\BPA.exe }"

mkdir D:\Perfil\%username%\Documents\BPA_RM\BKP-%date:/=-%

::Copia todos os arquivos da pasta do BPA para dentro da pasta de backup
xcopy D:\Perfil\%username%\Documents\BPA_TC\*.* D:\Perfil\%username%\Documents\BPA_TC\BKP-%date:/=-% /y

::Acessa a pasta do BPA evitando que por algum erro do windows os arquivos sejam extraídos na pasta errada
cd D:\Perfil\%username%\Documents\BPA_TC

:: Extrai o BDSIA para dentro da pasta do BPA
start D:\Perfil\%username%\Documents\BPA_TC\BDSIA.exe
:: Extrai o BPA para dentro da pasta do BPA
start D:\Perfil\%username%\Documents\BPA_TC\BPA.exe


::===============================================================================================
::=======================================ATUALIZA US=============================================
::===============================================================================================
goto end
:Atualiza_BPA_US 

::Download BDSIA E BPA
powershell -command "& { iwr ftp://arpoador.datasus.gov.br/siasus/sia/BDSIA201903b.exe -OutFile D:\Perfil\%username%\Documents\BPA_US\BDSIA.exe }"
powershell -command "& { iwr ftp://arpoador.datasus.gov.br/siasus/BPA/BPA0289.exe -OutFile D:\Perfil\%username%\Documents\BPA_US\BPA.exe }"

mkdir D:\Perfil\%username%\Documents\BPA_RM\BKP-%date:/=-%

::Copia todos os arquivos da pasta do BPA para dentro da pasta de backup
xcopy D:\Perfil\%username%\Documents\BPA_US\*.* D:\Perfil\%username%\Documents\BPA_US\BKP-%date:/=-% /y

::Acessa a pasta do BPA evitando que por algum erro do windows os arquivos sejam extraídos na pasta errada
cd D:\Perfil\%username%\Documents\BPA_US

:: Extrai o BDSIA para dentro da pasta do BPA
start D:\Perfil\%username%\Documents\BPA_US\BDSIA.exe
:: Extrai o BPA para dentro da pasta do BPA
start D:\Perfil\%username%\Documents\BPA_US\BPA.exe



::===============================================================================================
::=======================================ATUALIZA RX=============================================
::===============================================================================================
goto end
:Atualiza_BPA_RX 

::Download BDSIA E BPA
powershell -command "& { iwr ftp://arpoador.datasus.gov.br/siasus/sia/BDSIA201903b.exe -OutFile D:\Perfil\%username%\Documents\BPA_RX\BDSIA.exe }"
powershell -command "& { iwr ftp://arpoador.datasus.gov.br/siasus/BPA/BPA0289.exe -OutFile D:\Perfil\%username%\Documents\BPA_RX\BPA.exe }"

mkdir D:\Perfil\%username%\Documents\BPA_RM\BKP-%date:/=-%

::Copia todos os arquivos da pasta do BPA para dentro da pasta de backup
xcopy D:\Perfil\%username%\Documents\BPA_RX\*.* D:\Perfil\%username%\Documents\BPA_RX\BKP-%date:/=-% /y

::Acessa a pasta do BPA evitando que por algum erro do windows os arquivos sejam extraídos na pasta errada
cd D:\Perfil\%username%\Documents\BPA_RX

:: Extrai o BDSIA para dentro da pasta do BPA
start D:\Perfil\%username%\Documents\BPA_RX\BDSIA.exe
:: Extrai o BPA para dentro da pasta do BPA
start D:\Perfil\%username%\Documents\BPA_RX\BPA.exe

