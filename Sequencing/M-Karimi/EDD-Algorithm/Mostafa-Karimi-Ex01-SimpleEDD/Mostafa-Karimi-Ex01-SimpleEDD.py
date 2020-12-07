# Earliest Due Date (EDD) Agorithm 
# Teacher: Dr. Ziaee
# Student: Mostafa Karimi
# Vrsion 1.0.1
 
# welcome text
 
WText = ''' 
               Hello, Welcome to My App!:D
            
             Earliest Due Date (EDD) Agorithm 
                  
                    Teacher: Dr. Ziaee
                    Student: Mostafa Karimi
                    Vrsion 1.0.1 
                    '''
 
print(WText)
 
# input data
 
n_job = int(input("How Many Job? Please Enter : "))
 
EDD_A = []
 
for i in range(0, n_job):
  EDD_Inp = []
  print("\t------- job {} -------".format(i+1))
  EDD_Inp.append(int(i+1))
  EDD_Inp.append(int(input("Input time of job # {:3}    : ".format(str(i+1)))))
  EDD_Inp.append(int(input("Input due time of job # {:3}: ".format(str(i+1)))))
  EDD_A.append(EDD_Inp)
  
# sorting by due time
 
for k in range(n_job):
  for j in range(int(len(EDD_A))-1):
    if EDD_A[j][2] > EDD_A[j+1][2]:
      EDD_A[j], EDD_A[j+1] = EDD_A[j+1], EDD_A[j]
 
 
# calculate Cj
 
EDD_A[0].append(EDD_A[0][1])
EDD_A[1].append(EDD_A[0][1]+EDD_A[1][1])
 
for i in range(2, len(EDD_A)):
  EDD_A[i].append(EDD_A[i][1]+EDD_A[i-1][3])
 
# calculate Lj
 
for i in range(len(EDD_A)):
  EDD_A[i].append(EDD_A[i][3]-EDD_A[i][2])

#calculate Tj
#  
for i in range(len(EDD_A)):
  if EDD_A[i][4] > 0:
    EDD_A[i].append(EDD_A[i][4])
  else:
    EDD_A[i].append(0)
 

# Out Put #1 
#  
char = "-"

print("\n{0} Result {0}\n".format(char*8)) 

print("Sequencing of Job\t t\tdue\t C\t L\t T")


for i in range(len(EDD_A)):
    print("\t{:2}\t\t{:2}\t{:2}\t{:2}\t{:2}\t{:2}\n".format(EDD_A[i][0], EDD_A[i][1], EDD_A[i][2], EDD_A[i][3], EDD_A[i][4], EDD_A[i][5]))

# calculate Avg Tardiness

t_total = 0
for i in range(len(EDD_A)):
  t_total += EDD_A[i][5]
 
t_avg = t_total / n_job

# Out Put #2

print("\n{0}\n".format(char*24)) 
print("Average Tardiness: {}".format(t_avg))
print("\n{0}   End  {0}\n".format(char*8))