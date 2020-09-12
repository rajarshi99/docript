# docript

Marking up text and wish to contaminate it with a scripting language of your choice? Here is roff style preprocessor to solve your problem.

The idea is the following

```ms
One line in the document
Another
.PY1 fib_seq.d
a = 0
b = 1
for i in range(5):
	print b
	tmp = b
	b = a + b
	a = tmp
.PY2
Just finishing up...
```

Lines between ".PY1" and ".PY2" will be executed in a python interpreter and the output will be stored in a file. In the example the file is "fib_seq.d". The preprocessor also puts the output of this file in the place of the script which generated it.
