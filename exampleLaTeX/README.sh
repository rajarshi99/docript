awk -f ../calc.awk oneDmap.tex
# First time the result would not be proper
awk -f ../calc.awk oneDmap.tex | pdflatex -jobname=oneDmap
