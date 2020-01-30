import sys
#  >>> Escriba el codigo del mapper a partir de este punto <<<
import csv
import re
from  operator import itemgetter,attrgetter
if __name__ == "__main__":
    file = sys.stdin.readlines()
    file = open('data.csv','r').readlines()
    patron0 = re.compile('\t|\n')
    file = [re.sub(patron0,"",row) for row in file]
    patron1 = re.compile('\s+')
    datasub = [re.sub(patron1,'~',x) for x in file]
    datasplit = [re.split('~',x) for x in datasub]
    datasplit = sorted(datasplit, key = itemgetter(2))
    datasplit = sorted(datasplit, key = itemgetter(0))
    #file = sorted(file,key= itemgetter(2))

    for x in datasplit:
        sys.stdout.write("{}\t{}\t{}\n".format(x[0],x[1],x[2]))
        
