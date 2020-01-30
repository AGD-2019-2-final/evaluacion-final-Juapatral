#! /usr/bin/env python
import sys

for line in sys.stdin:
    line = line.strip()
    line = line.split('  ')[0]
    
    sys.stdout.write("{}\t1\n".format(line))
