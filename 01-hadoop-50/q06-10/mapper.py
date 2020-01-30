#! /usr/bin/env python
import sys

for line in sys.stdin:
    line = line.strip()
    line = line.split('  ')
    letter = line[0]
    number = line[2]
    
    sys.stdout.write("{},{}\n".format(letter, number))
