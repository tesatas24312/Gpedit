��
@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

@echo off
mode 50,20
chcp 65001
cls
@Title SYSTEM Network
color 00
echo.
call :c 04 "                ▄    ▄▄▄▄▄▄▄    ▄  " /n
call :c 04 "               ▀▀▄ ▄█████████▄ ▄▀▀ " /n
call :c 04 "                   ██ ▀███▀ ██     " /n
call :c 04 "                 ▄ ▀████▀████▀ ▄   " /n
call :c 04 "               ▀█    ██▀█▀██    █▀ " /n
echo.
call :c 04 "              █▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█ " /n
call :c 04 "              █"&call :c 0e "  ╦─╦╔╗╦─╔╗╔╗╔╦╗╔╗"&call :c 04 "  █ " /n
call :c 04 "              █"&call :c 0e "  ║║║╠─║─║─║║║║║╠─"&call :c 04 "  █ " /n
call :c 04 "              █"&call :c 0e "  ╚╩╝╚╝╚╝╚╝╚╝╩─╩╚╝"&call :c 04 "  █ " /n
call :c 04 "              █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ " /n
echo.
echo                ┏┓┏┳┓┏┓┏┓┓┏┏┓┳┓┏┓┏┓
echo                ┗┓ ┃ ┣ ┃┃┣┫┣┫┃┃┃ ┣ 
echo                ┗┛ ┻ ┗┛┣┛┛┗┛┗┛┗┗┛┗┛
echo.
echo                     ┏┓┓┏┏┓┏┓  
echo                     ┗┓┣┫┃┃┃┃ 
echo                     ┗┛┛┗┗┛┣┛
timeout /t 3 /NOBREAK >nul
goto config2

:config2
cls
echo.
echo. start
echo.
netsh int tcp set global netdma=enabled > nul
netsh int tcp set global dca=enabled > nul
netsh int ipv4 set glob defaultcurhoplimit=64 > nul
netsh int ipv6 set glob defaultcurhoplimit=64 > nul
set supplemental congestionprovider=ctcp > nul
netsh int tcp set heuristics disabled > nul
netsh int ipv4 set glob defaultcurhoplimit=86
netsh int ipv6 set glob defaultcurhoplimit=86
set supplemental congestionprovider=ctcp > nul
netsh int tcp set heuristics disabled > nul
netsh int tcp set global rss=enabled > nul
netsh int tcp set global chimney=disabled
netsh int tcp set global rsc=enabled > nul
netsh int tcp set global nonsackrttresiliency=disabled > nul
netsh int tcp set global maxsynretransmissions=4 > nul
netsh int tcp set global fastopen=enabled > nul
netsh interface tcp set global ecncapability=disabled > nul
netsh int tcp set global autotuninglevel=restricted > nul
netsh int tcp set global ecncapability=disabled
netsh int tcp set global timestamps=disabled > nul
netsh int tcp set global rsc=disabled > nul
netsh interface tcp set global autotuning=disabled > nul
netsh interface tcp set global rss=disabled > nul
netsh interface tcp set global chimney=disabled > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MTU" /t REG_DWORD /d "2927" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MSS" /t REG_DWORD /d "2927" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d "7" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpDelAckTicks" /t REG_DWORD /d "2" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "NumTcbTablePartitions" /t REG_DWORD /d "9" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPNoDelay" /t REG_DWORD /d "4" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpWindowSize" /t REG_DWORD /d "730000" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "SackOpts" /t REG_DWORD /d "3" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d "4" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "Tcp1323Opts" /t REG_DWORD /d "2" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPTimedWaitDelay" /t REG_DWORD /d "33" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "IRPStackSize" /t REG_DWORD /d "34" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "DefaultTTL" /t REG_DWORD /d "79" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "KeepAliveTime" /t REG_DWORD /d "90000" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "KeepAliveInterval" /t REG_DWORD /d "3000" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPInitialRtt" /t REG_DWORD /d "700" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpRecSegmentSize" /t REG_DWORD /d "2776677" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "EnablePMTUBHDetect" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "700967" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MaxHashTableSize" /t REG_DWORD /d "65536" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "DisableTaskOffload" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "WorldMaxTcpWindowsSize" /t REG_DWORD /d "700967" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPAllowedPorts" /t REG_DWORD /d "3" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "NTEContextList" /t REG_DWORD /d "5" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "DisableLargeMTU" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "IGMPVersion" /t REG_DWORD /d "4" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "IGMPLevel" /t REG_DWORD /d "3" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d "24" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MaxConnectionsPerServer" /t REG_DWORD /d "24" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MaxFreeTcbs" /t REG_DWORD /d "76482" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "ArpTRSingleRoute" /t REG_DWORD /d "3" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "SynAttackProtect" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MaxForwardBufferMemory" /t REG_DWORD /d "245720" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "ForwardBufferMemory" /t REG_DWORD /d "174834" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "NumForwardPackets" /t REG_DWORD /d "687" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MaxNumForwardPackets" /t REG_DWORD /d "687" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MaxUserPort" /t REG_DWORD /d "76482" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpMaxSendFree" /t REG_DWORD /d "76473" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "DeadGWDetectDefault" /t REG_DWORD /d "3" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "DontAddDefaultGatewayDefault" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MaxMpxCt" /t REG_DWORD /d "175" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "EnableICMPRedirect" /t REG_DWORD /d "2" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "CacheHashTableBucketSize" /t REG_DWORD /d "8907" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "EnableWsd" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "EnableDynamicBacklog" /t REG_DWORD /d "2" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "EnableDHCP" /t REG_DWORD /d "3" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "EnableWsd" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "AllowUnqualifiedQuery" /t REG_DWORD /d "2" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "DisableMediaSenseEventLog" /t REG_DWORD /d "3" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "DisableRss" /t REG_DWORD /d "4" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "DisableTcpChimneyOffload" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "DnsOutstandingQueriesCount" /t REG_DWORD /d "3000" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "EnableAddrMaskReply" /t REG_DWORD /d "4" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "EnableBcastArpReply" /t REG_DWORD /d "2" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "EnableConnectionRateLimiting" /t REG_DWORD /d "4" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "EnableDca" /t REG_DWORD /d "6" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "EnableHeuristics" /t REG_DWORD /d "3" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "EnableIPAutoConfigurationLimits" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "EnableTCPA" /t REG_DWORD /d "4" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "IPEnableRouter" /t REG_DWORD /d "7" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "QualifyingDestinationThreshold" /t REG_DWORD /d "729796" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "StrictTimeWaitSeqCheck" /t REG_DWORD /d "4" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "EnableDca" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MTU" /t REG_DWORD /d "0x5ac" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MSS" /t REG_DWORD /d "0x597" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /t REG_DWORD /d "7" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "NumTcbTablePartitions" /t REG_DWORD /d "9" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d "1079576" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d "2" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPTimedWaitDelay" /t REG_DWORD /d "30" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "IRPStackSize" /t REG_DWORD /d "19" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "67" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "KeepAliveTime" /t REG_DWORD /d "60000" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "KeepAliveInterval" /t REG_DWORD /d "1000" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPInitialRtt" /t REG_DWORD /d "300" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpRecSegmentSize" /t REG_DWORD /d "2776677" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUBHDetect" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "700967" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxHashTableSize" /t REG_DWORD /d "65536" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "WorldMaxTcpWindowsSize" /t REG_DWORD /d "700967" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPAllowedPorts" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "NTEContextList" /t REG_DWORD /d "3" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableLargeMTU" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "IGMPVersion" /t REG_DWORD /d "2" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "IGMPLevel" /t REG_DWORD /d "2" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d "24" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "24" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxFreeTcbs" /t REG_DWORD /d "65536" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "ArpTRSingleRoute" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SynAttackProtect" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxForwardBufferMemory" /t REG_DWORD /d "175200" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "ForwardBufferMemory" /t REG_DWORD /d "175200" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "NumForwardPackets" /t REG_DWORD /d "567" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxNumForwardPackets" /t REG_DWORD /d "567" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "76482" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxSendFree" /t REG_DWORD /d "65535" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DeadGWDetectDefault" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_QWORD /d "0x0200000000000000" /f > nul
cls
echo.
echo.
timeout /t 3 /NOBREAK > nul
exit


:c
setlocal enableDelayedExpansion
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:colorPrint Color  Str  [/n]
setlocal
set "s=%~2"
call :colorPrintVar %1 s %3
exit /b

:colorPrintVar  Color  StrVar  [/n]
if not defined DEL call :initColorPrint
setlocal enableDelayedExpansion
pushd .
':
cd \
set "s=!%~2!"
:: The single blank line within the following IN() clause is critical - DO NOT REMOVE
for %%n in (^"^

^") do (
  set "s=!s:\=%%~n\%%~n!"
  set "s=!s:/=%%~n/%%~n!"
  set "s=!s::=%%~n:%%~n!"
)
for /f delims^=^ eol^= %%s in ("!s!") do (
  if "!" equ "" setlocal disableDelayedExpansion
  if %%s==\ (
    findstr /a:%~1 "." "\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%"
  ) else if %%s==/ (
    findstr /a:%~1 "." "/.\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%"
  ) else (
    >colorPrint.txt (echo %%s\..\')
    findstr /a:%~1 /f:colorPrint.txt "."
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
  )
)
if /i "%~3"=="/n" echo(
popd
exit /b

:initColorPrint
for /f %%A in ('"Prompt $H&for %%B in (1) do rem"') do set "DEL=%%A %%A"
<nul >"%temp%\'" set /p "=."
subst ': "%temp%" >nul
exit /b