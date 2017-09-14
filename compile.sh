rm *.bbl
rm *.aux
rm *.log
rm *.blg
rm *.out

thefile=icra-2018-aqua-shoko
pdflatex $thefile.tex
bibtex $thefile.aux
pdflatex $thefile.tex
pdflatex $thefile.tex
rm *.bbl
rm *.aux
rm *.log
rm *.blg
rm *.out

if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default     -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages     -dCompressFonts=true -r150 -sOutputFile=$thefile.small.pdf $thefile.pdf
    evince $thefile.small.pdf
    # Do something under GNU/Linux platform
else 
    open $thefile.pdf
fi

