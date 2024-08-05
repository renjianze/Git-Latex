
@echo off
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
del


setlocal enabledelayedexpansion

rem Loop through all .bib files in the current directory
for %%f in (*.bib) do (
    rem Check if the file is not ref.bib
    if /I not "%%~nxf"=="reference.bib" (
        rem Delete the file
        del "%%~f"
    )
)

endlocal
exit