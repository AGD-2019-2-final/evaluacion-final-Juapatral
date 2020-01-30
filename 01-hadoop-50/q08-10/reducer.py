#!/usr/bin/env python

import sys


if __name__ == '__main__':

    curkey = None
    suma = 0
    n = 0

    for line in sys.stdin:

        key, val, count = line.split(",")
        val = float(val)
        count =int(count)

        if key == curkey:
            suma += val
            n += count
            
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma, suma/n))

            curkey = key
            suma = val
            n = count
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma, suma/n))
