#! /usr/bin/env python
import sys

for line in sys.stdin:
    line = line.strip()
    line = line.split('  ')
    letter = line[0]
    date = line[1]
    valor =int(line[2])
       
    
    sys.stdout.write("{}\t{}\t{}\n".format(letter, date, valor))
