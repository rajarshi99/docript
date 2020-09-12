.EQ
delim $$
.EN

.nr PI 4n
.nr PS 14
.nr VS 16

.TL
One Dimensional Maps

.AU
Rajarshi

.SH
Introduction

.PP

Let us look at the
.ft B
logistic
.ft
map.

.EQ
x sub n+1 = f( x sub n ) = r x sub n ( 1 - x sub n )
.EN

.PP
The context of this relation is lies in population dynamics.
The variable $x$ represents the population
as a fraction of the population
which can be sustained by the system.
Hence the requirement is that

.EQ
0 <= x <= 1
.EN

Given the bounds on $x$ we need require a simialr bound on $f(x)$.
For the problem to be meaningfull we require

.EQ
0 <= r <= 4
.EN

.PY1
def logMap(r, N):
	 x = 0.0
	 h = 1.0/N
	 for i in range(N+1):
		print x, r*x*(1.0-x)
		x += h

def line(xBeg, xEnd, N, m = 1.0, c = 0.0):
	h = (xEnd - xBeg) / N
	x = xBeg
	for i in range(N):
		print x, m*x + c
		x += h

.PY2

.G1
coord x 0,1 y 0,1

draw solid
label left "$x sub n+1$" 
label bottom "$x sub n$"

.PY1 logmap.d
r = 3.5
logMap(r, 50)

if r/4.0 < 0.85:
	print "ticks left out at", r/4, "\"$r over 4$\", 1 \"1\""
else:
	print "ticks left out at", r/4, "\"$r over 4$\""
.PY2

new dotted
.PY1 line1.d
line(0.0, 1.0, 50)
.PY2

.G2

.NH
Population Evolution

.PP
Value of $r$
\fIdrastically\fR changes the patterns
we observe in the sequence ${x sub n}$

.PY1 logGrowth.d
def logGrowth(x, r, N):
	for i in range(1, N):
		print i, x
		x = r*x*(1-x)

paramList = [[0.1, 2.5, 50], [0.2, 3.2, 50], [0.1, 3.7, 50]]
for [x, r, n] in paramList:
	print ".G1"
	print "label top \"$r = ", r, "$\""
	logGrowth(x, r, n)
	print ".G2"
.PY2


.NH
Cobweb diagrams

.PP
There is another nice geometric way
of looking at the sequence we are interested in.

.PY1 cobweb.d
for [x, r, n] in paramList:
	print ".G1"
	print "draw solid"
	print "coord x 0,1"
	print "label top \"$r = ", r, "$\""
	n = 5
	for i in range(n):
		xNext = r*x*(1-x)
		print x, xNext
		print xNext, xNext
		x = xNext
	print "new dotted"
	logMap(r, 50)
	print "new dotted"
	line(0.0, 1.0, 50)
	print ".G2"
.PY2
