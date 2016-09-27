@echo off

cls

:menu

ECHO.
ECHO ...............................................
ECHO What type of files do you want to download?
ECHO ...............................................
ECHO.
ECHO 1 - pictures
ECHO 2 - music
ECHO 3 - video
ECHO 4 - ebooks
ECHO 5 - software
ECHO 6 - custom
ECHO 7 - exit
ECHO.

SET /P M=What do you want?
IF %M%==1 GOTO pictures
IF %M%==2 GOTO music
IF %M%==3 GOTO video
IF %M%==4 GOTO ebooks
IF %M%==5 GOTO software
IF %M%==6 GOTO custom
IF %M%==7 GOTO EOF
GOTO menu

:pictures
set dirpre=pictures
set accept=jpg,gif,png,jpeg
GOTO AskSite

:music
set dirpre=music
set accept=mp3,wav,ac3,ogg,flac,wma,m4a
GOTO AskSite

:video
set dirPre=video
set accept=mkv,mp4,avi,mov,mpg,wmv
GOTO AskSite

:ebooks
set dirpre=ebooks
set accept=pdf,mobi,cbz,cbr,epub,pdf,rtf,doc,docx
GOTO AskSite

:software
set dirpre=software
set accept=exe,iso,tar,rar,zip,apk
GOTO AskSite

:custom
set dirpre=custom
SET /P accept= Enter a custom search with wildcards  
GOTO AskSite

:AskSite
echo.
echo "Enter a website to rip"
echo.
set /p website= Enter website:  
cls
wget --directory-prefix=%dirpre% --no-directories --recursive --level 1 --no-clobber --accept %accept% %website%
GOTO MENU

:EOF