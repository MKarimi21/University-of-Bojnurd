# BIP Algarithm
# A*(Y_Number) <= B


valueB = int(input('Insert B value in intejer format = '))
N = int(input('Insert number of coefficient of variation in integer format = '))
valueNum = []
k = 1
breakToken = True
while breakToken:
    try:
        V = int(input('Insert number %d = '%(k)))
        if type(V) is int :
            valueNum.append(V)
        if V == 00 :
            breakToken = False
    except:
        print('Invalid Syntax!, again run program!!') # check validation after
    if k==N :
        breakToken = False
    else:
        k += 1

    
    
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


