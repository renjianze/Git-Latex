del *.aux  
del *.bcf 
del *.nlo
del *.synctex(busy)
del *.blg 
del *.fdb_latexmk 
del *.fls 
del *.toc
del *.log 
del *.xml 
del *.lot 
del *.lof 
del *.xdv 
del *.thm
del *.out
del *.gz
del *.spl
del *.bbl
del *.cpt

@echo off

rem Delete .aux files in the chapter folder
cd /d "%~dp0chapter"
del *.aux

rem Delete .aux files in the git folder
cd /d "%~dp0appendix"
del *.aux


exit