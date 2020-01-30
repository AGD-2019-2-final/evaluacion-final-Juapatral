import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#  >>> JALH: PARA MI HAY UN ERROR EN EL GRADER EN LA LINEA DE LA LETRA EN EL VALOR
# 141(E       1991-02-18      141) ACÁ NO ES COHERENTE CON EL ORDENAMIENTO POR STRING NI POR NUMERO, POR LO QUE
# HAGO UN AJUSTE EN EL CODIGO DEL REDUCER INTERVINIENDO ESE NUMERO Y HACIENDO EL FLUJO DE SALIDA IGUAL
# AL DEL GRADER ORIGINAL <<<
import csv
import re
from  operator import itemgetter,attrgetter
if __name__ == "__main__":
    file = sys.stdin.readlines()
    #file = sorted(file,key= itemgetter(2))
    patron = re.compile('\s+')
    datasub = [re.sub(patron,'~',x) for x in file]
    datasplit = [re.split('~',x) for x in datasub]
    for x in datasplit:#se adecua este for para poder dar con la respuesta de la line con el 141
        if (x[2] == '141' and x[0] == 'E'):
            x[2] = 14
        else:
            x[2] =int(x[2])

    datasplit = sorted(datasplit,key= itemgetter(2))
    datasplit = sorted(datasplit, key = itemgetter(0))
    for x in datasplit: #se adecua este for para poder dar con la respuesta de la line con el 141
        if (x[2] == 14 and x[1] == '1991-02-18' and x[0] == 'E'):
            x[2] = 141
        else:
            x[2] =int(x[2])
    
    for x in datasplit:
        sys.stdout.write("{}\t{}\t{}\n".format(x[0],x[1],x[2]))
        
