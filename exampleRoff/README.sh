awk -f ../calc.awk oneDmap.ms
# First time the result would not be proper
awk -f ../calc.awk oneDmap.ms | groff -ms -G -e -T pdf > oneDmap.pdf
