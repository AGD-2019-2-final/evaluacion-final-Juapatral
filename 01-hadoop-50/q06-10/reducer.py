#! /usr/bin/env python
import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
curkey = None
total = 0

for line in sys.stdin:

    key, val = line.split(",")
    val = float(val)
    tipo = key

    if key == curkey:
        
        if val > total:
            max = val
        if val <total:
            min = val
    else:
        
        if curkey is not None:
            
            sys.stdout.write("{}\t{}\t{}\n".format(curkey, max, min))

        curkey = key
        max = val
        min = val 

sys.stdout.write("{}\t{}\t{}\n".format(curkey, max, min))
