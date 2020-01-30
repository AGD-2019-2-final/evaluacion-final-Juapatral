#! /usr/bin/env python
import sys
import operator

my_dict = {}
for line in sys.stdin:
    key, val = line.split(',')
    val = int(val)
    my_dict[key] = val 

dict_sort = sorted(my_dict.items(), key=operator.itemgetter(1), reverse=False)
        
for k, v in dict_sort:
    sys.stdout.write("{},{}\n".format(k,v))
