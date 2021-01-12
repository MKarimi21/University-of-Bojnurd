# all functions in class
import numpy as np
from statistics import stdev 
from math import sqrt


SampleArea = [[1, 2, 3, 4, 5, 6], 
              [5, 6, 4, 5, 8, 6], 
              [5, 8, 2, 6, 4, 7], 
              [6, 9, 7, 3, 4, 2],
              [5, 9, 1, 7, 5, 4], 
              [6, 3, 0, 1, 5, 6],]

def yHad():
    """
    >> yHad()
    [Avg1, Avg2, ...]
    """
    level1 = range(len(Table_3_7))
    level2 = len(Table_3_7[0])
    yHad_Array = [(sum(Table_3_7[i]) / level2) for i in level1]

    return yHad_Array

def sampleCov():
    """
    >> sampleCov()
    [size = len(Table) * len(Table)]
    """
    return np.cov(Table_3_7)

def calculateTsquar():
    """
    >> calculateTsquar()
    T-Squar
    """

    N = len(Table_3_7[0])
    
    difrenceY = np.array(yHad()) - Table_mu

    transposDif = np.transpose(difrenceY)

    invSampl = np.linalg.inv(sampleCov())

    part1 = np.dot(transposDif, invSampl)

    part2 = np.dot(part1, difrenceY)

    TSquar = N * part2
    

    return TSquar

def student_t():
    """
    >> student_t()
    [t1, t2, ...]
    """
    level1 = len(Table_3_7[0])
    St_T= [(yHad()[i] - Table_mu[i]) / (stdev(Table_3_7[i]) / sqrt(level1)) for i in range(4)]

    

    return St_T



# Result = "============= Result ============="

# print("{}\nY Had is: \n{} \nSample Covariance: \n{} \nT-Square is: \n{}".format(Result, yHad(), sampleCov(), calculateTsquar()))


# for i in range(4):
#     print("\nT-Student {} is: \n{}".format(str(i+1), student_t()[i]))
