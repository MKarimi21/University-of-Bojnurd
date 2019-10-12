import copy


def take_input():
    """Accepts the size of the chess board"""

    while True:
        try:
            size = int(input('What is the size of the chessboard? n = \n'))
            if size == 1:
                print("Trivial solution, choose a board size of atleast 4")
            if size <= 3:
                print("Enter a value such that size>=4")
                continue
            return size
        except ValueError:
            print("Invalid value entered. Enter again")


def get_board(size):
    """Returns an n by n board"""
    board = [0]*size
    for ix in range(size):
        board[ix] = [0]*size
    return board


def print_solutions(solutions, size):
    """Prints all the solutions in user friendly way"""
    for sol in solutions:
        for row in sol:
            print(row)
        print()


def is_safe(board, row, col, size):
    """Check if it's safe to place a queen at board[x][y]"""

    #check row on left side
    for iy in range(col):
        if board[row][iy] == 1:
            return False

    ix, iy = row, col
    while ix >= 0 and iy >= 0:
        if board[ix][iy] == 1:
            return False
        ix -= 1
        iy -= 1

    jx, jy = row, col
    while jx < size and jy >= 0:
        if board[jx][jy] == 1:
            return False
        jx += 1
        jy -= 1

    return True


def solve(board, col, size):
    """Use backtracking to find all solutions"""
    #base case
    if col >= size:
        return

    for i in range(size):
        if is_safe(board, i, col, size):
            board[i][col] = 1
            if col == size-1:
                add_solution(board)
                board[i][col] = 0
                return
            solve(board, col+1, size)
            #backtrack
            board[i][col] = 0


def add_solution(board):
    """Saves the board state to the global variable 'solutions'"""
    global solutions
    saved_board = copy.deepcopy(board)
    solutions.append(saved_board)

def testSolu(size):
    """New Subject to: 1/4 queen every 4 place in chess from Dr. H Karimi in Uiversity of Bojnurd"""
    testArr = []
    testArr2 = []
    testArr3 = []
    testArr4 = []
    global finalArr
    global counter
    global w
    sumArrOne = 0
    sumArrTwo = 0
    sumArrTree = 0
    sumArrFour = 0
    for z in range(0,len(solutions)):
        for i in range(0,size):
            for j in range(0,size):
                if i < int((size/2)) and j < int((size/2)):
                    testArr += str(solutions[z][i][j])
                if i < (size/2) and j > (size/2)-1:
                    testArr2 += str(solutions[z][i][j])
                if i > (size/2)-1 and j < (size/2) :
                    testArr3 += str(solutions[z][i][j])
                if i > (size/2)-1 and j > (size/2)-1 :
                    testArr4 += str(solutions[z][i][j])

        for i in range(0,len(testArr)):
            sumArrOne += int(testArr[i])
        for i in range(0, len(testArr)):
            sumArrTwo += int(testArr[i])
        for i in range(0,len(testArr)):
            sumArrTree += int(testArr[i])
        for i in range(0,len(testArr)):
            sumArrFour += int(testArr[i])
        
        if sumArrOne and sumArrTwo and sumArrTree and sumArrFour == int((size/4)):
            finalArr.append(z)
            counter +=1
        testArr = []
        testArr2 = []
        testArr3 = []
        testArr4 = []
        sumArrOne = 0
        sumArrTwo = 0
        sumArrTree = 0
        sumArrFour = 0
        


size = take_input()
counter = 0
board = get_board(size)
finalArr = []
solutions = []
w =0
solve(board, 0, size)
testSolu(size)
theLastOfArr = []
for i in finalArr:
    theLastOfArr.append(solutions[i])
print_solutions(theLastOfArr, size)
print("Total solutions of Four = {}".format(counter))
print("Total solutions = {}".format(len(solutions)))

