#!/usr/bin/env python3

import shutil
import sys



def convert(num):
    sizes = ["B","Kb","Mb","Gb","Tb","Pb"]
    cont = 0
    while num>1024:
        num = num/1024
        cont = cont+1
    return str(round(num,2))+sizes[cont]

def getUsed(folder):
    total, used, free = shutil.disk_usage(folder)
    return used

def main():
    res = ""
    for i in range(1,len(sys.argv)):
        res = res + sys.argv[i]+ " " +convert(getUsed(sys.argv[i]))+"  "
    print(res)
    

if __name__ == "__main__":
    main()

