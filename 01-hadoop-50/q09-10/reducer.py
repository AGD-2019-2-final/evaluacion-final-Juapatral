import sys

if __name__ == '__main__':
    b=[]
    for line in sys.stdin:
        key, date, valor = line.split("\t")
        valor = int(valor)
        b.append((key,date,valor))
        
    b=sorted(b,key=lambda b: b[2])
    b = b[0:6]
    for item in b:
        sys.stdout.write("{}\t{}\t{}\n".format(item[0],item[1],item[2]))
