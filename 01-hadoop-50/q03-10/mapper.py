#! /usr/bin/env python
import sys

for line in sys.stdin:
    line = line.strip()
    line = line.split(',')
    letter = line[0]
    number = int(line[1])
    
    sys.stdout.write("{},{}\n".format(letter,number))
