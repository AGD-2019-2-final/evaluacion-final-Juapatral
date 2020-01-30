import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":

    curkey = None
    lista = []

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        key, val = line.split("\t")
        val = int(val)
        
        
        

        if key == curkey:
            ##
            ## No se ha cambiado de clave. Aca se
            ## acumulan los valores para la misma clave.
            ##
            lista.append(val)

        else:
            ##
            ## Se cambio de clave. Se reinicia el
            ## acumulador.
            ##
            if curkey is not None:
                ##
                ## una vez se han reducido todos los elementos
                ## con la misma clave se imprime el resultado en
                ## el flujo de salida
                ##
                lista.sort()
                lista = [str(val) for val in lista]
                datos = ','.join(lista)
                sys.stdout.write("{}\t{}\n".format(curkey, datos))
                lista = []

            curkey = key
            lista.append(val)
            
    lista.sort()
    lista = [str(val) for val in lista]
    datos = ','.join(lista)
    sys.stdout.write("{}\t{}\n".format(curkey, datos))