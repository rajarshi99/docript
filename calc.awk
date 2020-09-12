BEGIN {
	lineCode = "python -"
	printf "import sys\ncon_out = sys.stdout\n" | lineCode
}

/^\.PY1/ {
	flag = 1
	file = $2
	if (file && !stale)
		printf "sys.stdout = open(\"%s\", \"w\")\n", file | lineCode
	$0 = ""
}

!flag { print }

/^\.PY2/ {
	flag = 0
	if (file) {
		if (!stale)
			print "sys.stdout = con_out" | lineCode
		while ( (getline < file) > 0 )
			print
	}
	$0 = ""
}

flag && !stale { print | lineCode }
