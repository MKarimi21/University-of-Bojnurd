import sys
import numpy as np


def permute(a, l, r):
    if l == r:
        print(toString(a))
    else:
        for i in range(l, r+1):
            a[l], a[i] = a[i], a[l]
            permute(a, l+1, r)
            a[l], a[i] = a[i], a[l]


a = int(input("Number of n ? "))
arrOne = np.zeros((a+1,3),dtype=object)
arrOne[0][2] = "T"
arrOne[0][1] = "DUE"
arrOne[0][0] = "Job"
for i in range (1,a+1):
    dueNumber = input("Due Number Job "+str(i)+" Pls : ")
    arrOne[i][1] = dueNumber
    tNumber = input("T Number Job "+str(i)+" Pls : ")
    arrOne[i][2]=tNumber
    arrOne[i][0] = "Job "+str(i)

arrTwo = np.zeros((a+3, 2), dtype=object)


print(arrOne)
