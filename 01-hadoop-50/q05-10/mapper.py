#! /usr/bin/env python
import sys
#import numpy as np

for line in sys.stdin:
    line = line.strip()
    line = line.split('  ')[1]
    line = line.split('-')[1] 
    
    sys.stdout.write("{}\t1\n".format(line))
