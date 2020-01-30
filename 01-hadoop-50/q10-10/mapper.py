import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":
    ## itera sobre cada linea de codigo recibida
    ## a traves del flujo de entrada
    ##
    for line in sys.stdin:
        
        prueba = line.split("\t")
        #prueba2 = prueba[1].replace("\r", " r").replace(" r", "")
        #sys.stdout.write("{}".format(prueba2))
        prueba[1] = prueba[1].replace("\r", " r").replace(" r", "").replace("\n", "").split(",")
        #sys.stdout.write("{}".format(prueba[1]))
        prueba[0] = ((prueba[0] + ' ') * len(prueba[1])).split()
        prueba2 = [*zip(prueba[1], prueba[0])]
        for par in prueba2:    

            ##
            ## escribe al flujo estandar de salida
            ##
            sys.stdout.write("{}\t{}\n".format(par[0], par[1]))

