#+++++++++++++++++++++++++++++++++++++++++++++++++++
#
# --------------------------------------------------
#|  Combinatrial-Optimazing-Mostafa-Karimi-Part01  |
#|         Python Library for this Class           |
#|              Version: 1.0.1                     |
# --------------------------------------------------
# 
# for first use and develope it:
#     https://github.com/MKarimi21/University-of-Bojnurd/tree/master/Combinatorial-Optimization
# 
# !Notic!: insert numpy and random function for befor
#          needed to do not install numpy and random
#          this library and Class and Solid Method for
#          inputing number.
#                                           -M Karimi-
#+++++++++++++++++++++++++++++++++++++++++++++++++++

# import Numpy and Random Library
import numpy as np
import random as rd

# Number of argument
n = int(input("How many argument from 0: "))



# Swap Method in Combinatrial Optimazing Class - Dr Karimi


def swapPosition(n):
    '''
    Swap Position: swapPosition(integer number)  
    swapPosition(n) -> change our random flow to new position
    
    this function try to change position from random position
    (simple flow by random number) to new position with choose 
    2 position of simple place.
    
    Notic! We must install Numpy Library to run it
    Make shure to install numpy by CMD or Terminal with
    $ pip3 install numpy
    $ pip3 install random
    
    @@ Mostafa Karimi @@
    
    '''
    
    swap =  np.random.permutation(n + 1)
    swap_rand = np.insert(swap, n + 1, swap[0])
    print("Our flow : {}".format(swap_rand))
    v = rd.sample(list(swap), 2)
    print("Random Swap Position Between: first random select pos {} in Swap list is {} and second pos {} is {}".format(int(v[0]+1), swap_rand[int(v[0])], int(v[1]+1), swap_rand[int(v[1])]) )
    
    swap[v[0]], swap[v[1]] = swap[v[1]], swap[v[0]]
    swap = np.insert(swap, n+1,swap[0])

    print("New position is: {}".format(swap) )
    return swap


# 2-Opt Method in Combinatrial Optimazing Class - Dr Karimi


def optTwo(n):
    '''
    2-Opt Position: optTow(integer number)  
    optTwo(n) -> change our random flow to new flow
    
    this function try to change graph from random position
    (simple flow by random number) to new flow with choose 
    2 position of simple place.
    
    Notic! We must install Numpy Library to run it
    Make shure to install numpy by CMD or Terminal with
    $ pip3 install numpy
    $ pip3 install random
    
    @@ Mostafa Karimi @@
    
    '''
    
    optTwo =  np.random.permutation(n + 1)
    swap_rand = np.insert(optTwo, n + 1, optTwo[0])
    print("Our flow : {}".format(swap_rand) )
    
    v = rd.sample(list(optTwo), 2)
    vMax = max(int(v[0]), int(v[1]))
    vMin = min(int(v[0]), int(v[1]))
    print("We change flow position [{} to {}] with [{} to {}]".format(swap_rand[vMin], swap_rand[vMin+1], swap_rand[vMax], swap_rand[vMax+1]))
    
    # is not optimize, we use just 3 list for this function but use 5 list
    # we don't need opt min and max becuse is over need
    # develope and optimize for next time - Mostafa Karimi
    
    list1 = optTwo[0:vMin]
    
    optTwoMin = optTwo[vMin:vMin+1]
    
    reversList = list(reversed(optTwo[vMin+1:vMax]))

    optTwoMax = optTwo[vMax:vMax+1]
    
    list2 = optTwo[vMax+1:]
    
    finalList1 = list(list1) + list(optTwoMax) + reversList + list(optTwoMin) + list(list2) 
    
    finalList = np.insert(finalList1, n + 1, finalList1[0])
    print("And now, is new flow is {}".format(finalList))
    
    return optTwo


# Rverse (Inversion) Method in Combinatrial Optimazing Class - Dr Karimi

def reverseList(n):
    '''
    Reverse Position: reverseList(integer number)  
    reverseList(n) -> reverse 2 random position from first list
    
    this function try to reverse select random number from first
    list and reversed 2 position from our random select position
    by select random number
    
    Notic! We must install Numpy Library to run it
    Make shure to install numpy by CMD or Terminal with
    $ pip3 install numpy
    $ pip3 install random
    
    @@ Mostafa Karimi @@
    
    '''
    
    firstList = np.random.permutation(n + 1)
    print(firstList)
    v = rd.sample(list(firstList), 2)

    vMax = max(int(v[0]), int(v[1]))
    vMin = min(int(v[0]), int(v[1]))

    print("First position from {} to {}".format(vMin+1, vMax+1))

    list1 = firstList[0:vMin]
    list2 = firstList[vMax+1:]
    reveList = list(reversed(firstList[vMin:vMax+1]))
    finalList = list(list1) + reveList + list(list2)

    print("Our new flow is: ", list1 , " | " ,"and resolve ", reveList, " | and else ", list2)
    print("And merge: ", finalList)
    
    return 

# Insertion Method in Combinatrial Optimazing Class - Dr Karimi

def invers(n):
    '''
    Inverse Position: inverse(integer number)  
    invers(n) -> insert number from position to new position
    
    this function try to insert number from first position to new
    position by select random number from first list and delet old
    position from first list
    
    Notic! We must install Numpy Library to run it
    Make shure to install numpy by CMD or Terminal with
    $ pip3 install numpy
    $ pip3 install random
    
    @@ Mostafa Karimi @@
    
    '''
    firstList = np.random.permutation(n + 1)
    print("First List is: {}".format(firstList))
    v = rd.sample(list(firstList), 2)
   
    vMax = max(int(v[0]), int(v[1]))
    vMin = min(int(v[0]), int(v[1]))
    
   
    
    
    invers = np.insert(firstList, vMin, firstList[vMax])
    invers = np.delete(invers, vMax +1)
   
    print("Do, argument {} move to position {}".format(firstList[vMax], vMin + 1))
    print("Invers to {}".format(invers))
    
    return invers


c = swapPosition(n)