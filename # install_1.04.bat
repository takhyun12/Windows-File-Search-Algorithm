@rem ========================================================================================
@rem
@rem	���� �ڰ����� ���α׷�
@rem
@rem	���� ������ɺ� ��������� ������ȣ��
@rem	�ϻ� ������, �Ϻ� �����
@rem
@rem ----------------------------------------------------------------------------------------	
@rem	install.bat
@rem	
@rem	�� ���� ������ ����Ѵ�. 
@rem	1. keyword_threat.txt : �˻��Ϸ��� Ű���带 ����
@rem	2. keyword_bypass.txt : �˻����� ���� ��θ� ����
@rem	3. script.ps1	      : ���� �˻� ��ũ��Ʈ
@rem	4. linkInstall.ps1    : ��Ŭ�� ��ƿ��Ƽ ��ġ
@rem
@rem
@rem	������ bat���Ϸ� �Ʒ� ��ɾ �����ϸ� �ȴ�:
@rem	powershell -File "C:\Program Files\Geni\Geniacn\Plugin\LCCertSecretScanner\script.ps1"
@rem
@rem
@rem	��Ŭ�� ��ƿ��Ƽ:
@rem    Shell:SendTo ���丮�� ������ �����Ѵ�.
@rem
@rem
@rem
@rem
@rem ========================================================================================

@echo off
setlocal

@rem �Ŀ��� ���ÿ����� ���� ���
powershell -Command "Set-ExecutionPolicy RemoteSigned"

@rem ���� ��ġ ����
set LCCERT_DIR="%ProgramFiles%\Geni\Genian\Plugin\LCCertSecretScanner"
set FILE_THREAT=%LCCERT_DIR%\keyword_threat.txt
set FILE_BYPASS=%LCCERT_DIR%\keyword_bypass.txt
set FILE_RESULT="%USERPROFILE%\Desktop\"+$(Get-Date -Format "yyMMdd_HHmm")+"_��н�ĵ���.csv"
set SCRIPT_SEARCH=%LCCERT_DIR%\script.ps1
set SCRIPT_UTILIT=%LCCERT_DIR%\utilInstall.ps1
set POWERSHELL="%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"

mkdir %LCCERT_DIR%

@rem 1.ã�� ����
echo ����> %FILE_THREAT%
echo UFG>> %FILE_THREAT%
echo �Ʒ�>> %FILE_THREAT%
echo KRFE>> %FILE_THREAT%
echo ���>> %FILE_THREAT%
echo ��>> %FILE_THREAT%
echo ����>> %FILE_THREAT%
echo ��ܺ�>> %FILE_THREAT%
echo AFCCS>> %FILE_THREAT%
echo C4I>> %FILE_THREAT%
echo MSEL>> %FILE_THREAT%
echo �۰�>> %FILE_THREAT%
echo �ο�>> %FILE_THREAT%
echo ����>> %FILE_THREAT%
echo ��ȣ>> %FILE_THREAT%
echo �������>> %FILE_THREAT%


echo ���>> %FILE_THREAT%
echo ����>> %FILE_THREAT%
echo ���>> %FILE_THREAT%
echo ħ��>> %FILE_THREAT%
echo �η�>> %FILE_THREAT%
echo ����>> %FILE_THREAT%
echo ��Ʋ>> %FILE_THREAT%
echo ����>> %FILE_THREAT%
echo Battle>> %FILE_THREAT%
echo ����>> %FILE_THREAT%
echo ��й�ȣ>> %FILE_THREAT%
echo �н�����>> %FILE_THREAT%
echo ������Ϻ�>> %FILE_THREAT%
echo Password>> %FILE_THREAT%
echo ����>> %FILE_THREAT%
echo ������>> %FILE_THREAT%
echo �����ٸ��>> %FILE_THREAT%
echo ��������>> %FILE_THREAT%
echo ��������>> %FILE_THREAT%
echo ����â��>> %FILE_THREAT%
echo â��>> %FILE_THREAT%
echo ����>> %FILE_THREAT%
echo ���ü���>> %FILE_THREAT%
echo ���ú���>> %FILE_THREAT%
echo ������ŵ���>> %FILE_THREAT%
echo ����������ȹ��>> %FILE_THREAT%
echo �湫>> %FILE_THREAT%
echo ���ñٷμ���>> %FILE_THREAT%
echo ����ηµ���>> %FILE_THREAT%
echo ���µ���>> %FILE_THREAT%
echo ����ǥ>> %FILE_THREAT%
echo ������>> %FILE_THREAT%
echo ���Һδ���>> %FILE_THREAT%
echo �����ӹ�����ö>> %FILE_THREAT%
echo Battlebook>> %FILE_THREAT%
echo ��Ʋ��>> %FILE_THREAT%
echo ����>> %FILE_THREAT%
echo ������ȹ>> %FILE_THREAT%
echo ��������>> %FILE_THREAT%
echo ��������>> %FILE_THREAT%
echo ������������>> %FILE_THREAT%
echo Pre-ATO>> %FILE_THREAT%
echo �۰�5026>> %FILE_THREAT%
echo �۰�5027>> %FILE_THREAT%
echo �۰�5028>> %FILE_THREAT%
echo �۰�5029>> %FILE_THREAT%
echo �۰�5030>> %FILE_THREAT%
echo �л��ġ>> %FILE_THREAT%
echo ��������>> %FILE_THREAT%
echo ħ��>> %FILE_THREAT%
echo ź����Ȳ>> %FILE_THREAT%
echo ��ø>> %FILE_THREAT%
echo 3����>> %FILE_THREAT%
echo ���>> %FILE_THREAT%
echo KADIZ>> %FILE_THREAT%
echo �����>> %FILE_THREAT%
echo BLź>> %FILE_THREAT%
echo �Ǿƽĺ�>> %FILE_THREAT%
echo ȭ��������>> %FILE_THREAT%
echo ����������>> %FILE_THREAT%
echo �����������>> %FILE_THREAT%
echo �������>> %FILE_THREAT%
echo �������>> %FILE_THREAT%
echo ö����ȹ>> %FILE_THREAT%
echo ���ð����ൿ����>> %FILE_THREAT%
echo �װ��Ⱑ����>> %FILE_THREAT%
echo ��������>> %FILE_THREAT%
echo ATSP>> %FILE_THREAT%
echo ���ù��װ�>> %FILE_THREAT%
echo RHYTHM>> %FILE_THREAT%
echo 1��>> %FILE_THREAT%
echo 2��>> %FILE_THREAT%
echo 3��>> %FILE_THREAT%
echo ��ܺ�>> %FILE_THREAT%
echo ����>> %FILE_THREAT%
echo ����>> %FILE_THREAT%
echo ����>> %FILE_THREAT%

@rem 2.������ ���
echo Adobe> %FILE_BYPASS%
echo Eclipse>> %FILE_BYPASS%
echo Program Files\Java>> %FILE_BYPASS%
echo Hnc\HOffice9\Shared>> %FILE_BYPASS%
echo Microsoft Visual Studio>> %FILE_BYPASS%
echo C:\Windows\>> %FILE_BYPASS%


@rem 3.�˻� �ڵ� ���
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
echo "���ϸ�,Ž���׸�,���ϰ��" ^> $filename >> %SCRIPT_SEARCH%

echo if (!$args) { >> %SCRIPT_SEARCH%
echo     Search C:\ $threat $bypass ^>^> $filename >> %SCRIPT_SEARCH%
echo     Search D:\ $threat $bypass ^>^> $filename >> %SCRIPT_SEARCH%
echo     Search E:\ $threat $bypass ^>^> $filename >> %SCRIPT_SEARCH%
echo } >> %SCRIPT_SEARCH%
echo else >> %SCRIPT_SEARCH%
echo { >> %SCRIPT_SEARCH%
echo    Search $args[0] $threat $bypass ^>^> $filename >> %SCRIPT_SEARCH%
echo } >> %SCRIPT_SEARCH%


@rem 4.��Ŭ�� ��ƿ��Ƽ ��� �� ���� �� ����
echo $wsh = New-Object -comObject WScript.Shell > %SCRIPT_UTILIT%
echo $path = [system.Environment]::GetFolderPath("SendTo") >> %SCRIPT_UTILIT%
echo $link = $wsh.CreateShortcut("$path\���� �ڰ� ����.lnk") >> %SCRIPT_UTILIT%
echo $link.TargetPath = %POWERSHELL% >> %SCRIPT_UTILIT%
echo $link.Arguments  = '-File %SCRIPT_SEARCH%' >> %SCRIPT_UTILIT%
echo $link.Description = "���� ������ ���� �ڰ� ���� ��ƿ��Ƽ" >> %SCRIPT_UTILIT%
echo $link.WorkingDirectory = "%USERPROFILE%" >> %SCRIPT_UTILIT%
echo $link.Save() >> %SCRIPT_UTILIT%

%POWERSHELL% -File %SCRIPT_UTILIT%
del %SCRIPT_UTILIT%

endlocal