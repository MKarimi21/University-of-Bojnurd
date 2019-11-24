# BIP Algarithm
# (6y_1)+(3y_2)-(5y_3)+(2y_4)+(7y_5)-(4y_6)<=15  y_1to6 is binary

valueB = 15

valueNum = [6, 3, -5, 2, 7, -4]
token = True
xx = 1
while token:
    
    print('Step ', xx, ':', valueNum)
    M =  []
    S = []
    listParams = []
    sumM = 0
    for i in range(0,len(valueNum)):
        if valueNum[i]>0:
            M.append(valueNum[i])
            sumM += valueNum[i]
    mPositB = sumM - int(valueB)
    # S 
    for j in range(0,len(valueNum)):
        if abs(valueNum[j])>mPositB:
            S.append(valueNum[j])
            listParams.append(j)
    if len(S)>0:
        if S[0]>0:
            aNew = sumM - valueB
            valueB = sumM - valueNum[listParams[0]]
            valueNum[listParams[0]] = aNew
        else:
            aNew = valueB - sumM
            valueNum[listParams[0]] = aNew

    else:
        print ('Finally Answer')
        token = False
    xx+=1


print (valueNum , '<=', valueB)        

