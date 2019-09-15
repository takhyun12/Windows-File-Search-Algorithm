@rem ========================================================================================
@rem
@rem	보안 자가점검 프로그램
@rem
@rem	공군 군수사령부 군수전산소 정보보호실
@rem	하사 정택현, 일병 한재승
@rem
@rem ----------------------------------------------------------------------------------------	
@rem	install.bat
@rem	
@rem	네 개의 파일을 드랍한다. 
@rem	1. keyword_threat.txt : 검색하려는 키워드를 지정
@rem	2. keyword_bypass.txt : 검색하지 않을 경로를 지정
@rem	3. script.ps1	      : 파일 검색 스크립트
@rem	4. linkInstall.ps1    : 우클릭 유틸리티 설치
@rem
@rem
@rem	별도의 bat파일로 아래 명령어를 실행하면 된다:
@rem	powershell -File "C:\Program Files\Geni\Geniacn\Plugin\LCCertSecretScanner\script.ps1"
@rem
@rem
@rem	우클릭 유틸리티:
@rem    Shell:SendTo 디렉토리에 파일을 생성한다.
@rem
@rem
@rem
@rem
@rem ========================================================================================

@echo off
setlocal

@rem 파워쉘 로컬에서만 실행 허용
powershell -Command "Set-ExecutionPolicy RemoteSigned"

@rem 파일 위치 정의
set LCCERT_DIR="%ProgramFiles%\Geni\Genian\Plugin\LCCertSecretScanner"
set FILE_THREAT=%LCCERT_DIR%\keyword_threat.txt
set FILE_BYPASS=%LCCERT_DIR%\keyword_bypass.txt
set FILE_RESULT="%USERPROFILE%\Desktop\"+$(Get-Date -Format "yyMMdd_HHmm")+"_비밀스캔결과.csv"
set SCRIPT_SEARCH=%LCCERT_DIR%\script.ps1
set SCRIPT_UTILIT=%LCCERT_DIR%\utilInstall.ps1
set POWERSHELL="%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"

mkdir %LCCERT_DIR%

@rem 1.찾는 파일
echo 작전> %FILE_THREAT%
echo UFG>> %FILE_THREAT%
echo 훈련>> %FILE_THREAT%
echo KRFE>> %FILE_THREAT%
echo 비밀>> %FILE_THREAT%
echo 비문>> %FILE_THREAT%
echo 진영>> %FILE_THREAT%
echo 대외비>> %FILE_THREAT%
echo AFCCS>> %FILE_THREAT%
echo C4I>> %FILE_THREAT%
echo MSEL>> %FILE_THREAT%
echo 작계>> %FILE_THREAT%
echo 인원>> %FILE_THREAT%
echo 기지>> %FILE_THREAT%
echo 방호>> %FILE_THREAT%
echo 기지방어>> %FILE_THREAT%


echo 방어>> %FILE_THREAT%
echo 진지>> %FILE_THREAT%
echo 경로>> %FILE_THREAT%
echo 침투>> %FILE_THREAT%
echo 인력>> %FILE_THREAT%
echo 동원>> %FILE_THREAT%
echo 배틀>> %FILE_THREAT%
echo 리듬>> %FILE_THREAT%
echo Battle>> %FILE_THREAT%
echo 전시>> %FILE_THREAT%
echo 비밀번호>> %FILE_THREAT%
echo 패스워드>> %FILE_THREAT%
echo 관리기록부>> %FILE_THREAT%
echo Password>> %FILE_THREAT%
echo 도면>> %FILE_THREAT%
echo 완편명부>> %FILE_THREAT%
echo 가나다명부>> %FILE_THREAT%
echo 전시증편>> %FILE_THREAT%
echo 전시증원>> %FILE_THREAT%
echo 증·창설>> %FILE_THREAT%
echo 창설>> %FILE_THREAT%
echo 숙영>> %FILE_THREAT%
echo 전시수송>> %FILE_THREAT%
echo 전시보급>> %FILE_THREAT%
echo 정보통신동원>> %FILE_THREAT%
echo 산업동원운영계획서>> %FILE_THREAT%
echo 충무>> %FILE_THREAT%
echo 전시근로소집>> %FILE_THREAT%
echo 기술인력동원>> %FILE_THREAT%
echo 병력동원>> %FILE_THREAT%
echo 편제표>> %FILE_THREAT%
echo 전략서>> %FILE_THREAT%
echo 관할부대장>> %FILE_THREAT%
echo 전투임무수행철>> %FILE_THREAT%
echo Battlebook>> %FILE_THREAT%
echo 배틀북>> %FILE_THREAT%
echo 전시>> %FILE_THREAT%
echo 잔전계획>> %FILE_THREAT%
echo 작전예규>> %FILE_THREAT%
echo 지상작전>> %FILE_THREAT%
echo 지상작전예규>> %FILE_THREAT%
echo Pre-ATO>> %FILE_THREAT%
echo 작계5026>> %FILE_THREAT%
echo 작계5027>> %FILE_THREAT%
echo 작계5028>> %FILE_THREAT%
echo 작계5029>> %FILE_THREAT%
echo 작계5030>> %FILE_THREAT%
echo 분산배치>> %FILE_THREAT%
echo 전투진지>> %FILE_THREAT%
echo 침투>> %FILE_THREAT%
echo 탄약현황>> %FILE_THREAT%
echo 간첩>> %FILE_THREAT%
echo 3지대>> %FILE_THREAT%
echo 경계>> %FILE_THREAT%
echo KADIZ>> %FILE_THREAT%
echo 운영예규>> %FILE_THREAT%
echo BL탄>> %FILE_THREAT%
echo 피아식별>> %FILE_THREAT%
echo 화생방작전>> %FILE_THREAT%
echo 대공방어작전>> %FILE_THREAT%
echo 기지경계작전>> %FILE_THREAT%
echo 지역방공>> %FILE_THREAT%
echo 방공작전>> %FILE_THREAT%
echo 철새계획>> %FILE_THREAT%
echo 전시개인행동절차>> %FILE_THREAT%
echo 항공기가동률>> %FILE_THREAT%
echo 전시유류>> %FILE_THREAT%
echo ATSP>> %FILE_THREAT%
echo 전시민항공>> %FILE_THREAT%
echo RHYTHM>> %FILE_THREAT%
echo 1급>> %FILE_THREAT%
echo 2급>> %FILE_THREAT%
echo 3급>> %FILE_THREAT%
echo 대외비>> %FILE_THREAT%
echo Ⅰ급>> %FILE_THREAT%
echo Ⅱ급>> %FILE_THREAT%
echo Ⅲ급>> %FILE_THREAT%

@rem 2.무시할 경로
echo Adobe> %FILE_BYPASS%
echo Eclipse>> %FILE_BYPASS%
echo Program Files\Java>> %FILE_BYPASS%
echo Hnc\HOffice9\Shared>> %FILE_BYPASS%
echo Microsoft Visual Studio>> %FILE_BYPASS%
echo C:\Windows\>> %FILE_BYPASS%


@rem 3.검색 코드 드랍
@rem $file -replace "(?m)^", "echo " -replace "(?m)$", ">> %SCRIPT_SEARCH%" -replace "\|", "^|"

echo function Search([string]$path, [string]$searchfor, [string]$ignore)> %SCRIPT_SEARCH%
echo {>> %SCRIPT_SEARCH%
echo     $children = get-ChildItem $path -errorAction "SilentlyContinue">> %SCRIPT_SEARCH%
echo     foreach ($child in $children)>> %SCRIPT_SEARCH%
echo     {>> %SCRIPT_SEARCH%
echo         if ($child.PSIsContainer -eq $true)>> %SCRIPT_SEARCH%
echo         {>> %SCRIPT_SEARCH%
echo             if ($child.FullName -match $ignore)>> %SCRIPT_SEARCH%
echo             {>> %SCRIPT_SEARCH%
echo                 continue;>> %SCRIPT_SEARCH%
echo             }>> %SCRIPT_SEARCH%
echo             if($child.Name -match $searchfor)>> %SCRIPT_SEARCH%
echo             {>> %SCRIPT_SEARCH%
echo                 $child.Name + "," + $matches[0] + "," + $child.DirectoryName >> %SCRIPT_SEARCH%
echo             }>> %SCRIPT_SEARCH%
echo             Search $child.FullName $searchfor $ignore>> %SCRIPT_SEARCH%
echo         }>> %SCRIPT_SEARCH%
echo         else>> %SCRIPT_SEARCH%
echo         {>> %SCRIPT_SEARCH%
echo             if($child.Name -match $searchfor)>> %SCRIPT_SEARCH%
echo             {>> %SCRIPT_SEARCH%
echo                 $child.Name + "," + $matches[0] + "," + $child.DirectoryName >> %SCRIPT_SEARCH%
echo             }>> %SCRIPT_SEARCH%
echo         }>> %SCRIPT_SEARCH%
echo     }>> %SCRIPT_SEARCH%
echo }>> %SCRIPT_SEARCH%
echo function synthesizeRegex([string]$path)>> %SCRIPT_SEARCH%
echo {>> %SCRIPT_SEARCH%
echo     $regex = "">> %SCRIPT_SEARCH%
echo     gc $path ^| ForEach-Object {$regex = $regex + $_ + "|"}>> %SCRIPT_SEARCH%
echo     $regex = $regex.Substring(0, $regex.Length - 1)>> %SCRIPT_SEARCH%
echo     $regex = "(" + $regex + ")">> %SCRIPT_SEARCH%
echo     $regex = $regex -replace "\\", "\\">> %SCRIPT_SEARCH%
echo     $regex>> %SCRIPT_SEARCH%
echo }>> %SCRIPT_SEARCH%
echo $threat = synthesizeRegex(%LCCERT_DIR%+"\keyword_threat.txt")>> %SCRIPT_SEARCH%
echo $bypass = synthesizeRegex(%LCCERT_DIR%+"\keyword_bypass.txt")>> %SCRIPT_SEARCH%
echo $filename = %FILE_RESULT% >> %SCRIPT_SEARCH%
echo "파일명,탐지항목,파일경로" ^> $filename >> %SCRIPT_SEARCH%

echo if (!$args) { >> %SCRIPT_SEARCH%
echo     Search C:\ $threat $bypass ^>^> $filename >> %SCRIPT_SEARCH%
echo     Search D:\ $threat $bypass ^>^> $filename >> %SCRIPT_SEARCH%
echo     Search E:\ $threat $bypass ^>^> $filename >> %SCRIPT_SEARCH%
echo } >> %SCRIPT_SEARCH%
echo else >> %SCRIPT_SEARCH%
echo { >> %SCRIPT_SEARCH%
echo    Search $args[0] $threat $bypass ^>^> $filename >> %SCRIPT_SEARCH%
echo } >> %SCRIPT_SEARCH%


@rem 4.우클릭 유틸리티 드랍 및 실행 후 삭제
echo $wsh = New-Object -comObject WScript.Shell > %SCRIPT_UTILIT%
echo $path = [system.Environment]::GetFolderPath("SendTo") >> %SCRIPT_UTILIT%
echo $link = $wsh.CreateShortcut("$path\보안 자가 점검.lnk") >> %SCRIPT_UTILIT%
echo $link.TargetPath = %POWERSHELL% >> %SCRIPT_UTILIT%
echo $link.Arguments  = '-File %SCRIPT_SEARCH%' >> %SCRIPT_UTILIT%
echo $link.Description = "공군 군수사 보안 자가 점검 유틸리티" >> %SCRIPT_UTILIT%
echo $link.WorkingDirectory = "%USERPROFILE%" >> %SCRIPT_UTILIT%
echo $link.Save() >> %SCRIPT_UTILIT%

%POWERSHELL% -File %SCRIPT_UTILIT%
del %SCRIPT_UTILIT%

endlocal