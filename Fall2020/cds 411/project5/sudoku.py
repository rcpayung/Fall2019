# -*- coding: utf-8 -*-
# sodoku.py
"""
Created on Wed Apr  6 14:46:11 2016
Modified 4.26.19
@author: jkinser
"""

import numpy as np

# standard architecture
def Architecture1():
    groups = []
    x = np.array((0,1,2,3,4,5,6,7,8))
    for i in range( 9 ):
        groups.append( list(x + i*9))
    for i in range(9):
        groups.append( list(x*9 + i) )
    x = np.array( (0,1,2,9,10,11,18,19,20))
    for i in (0,27,54):
        for j in (0,3,6):
            groups.append(list(x+i+j))
    return groups

def Architecture2():
    groups = []
    x = np.array((0,1,2,3,4,5,6,7,8))
    for i in range( 9 ):
        groups.append( list(x + i*9))
    for i in range(9):
        groups.append( list(x*9 + i) )
    groups.append(( 0, 1, 2, 9,10,18,19,20,29))
    groups.append(( 3, 4, 5,11,12,13,14,15,22))
    groups.append(( 6, 7, 8,16,17,24,25,26,33))
    groups.append((21,23,30,31,32,39,40,41,49))
    groups.append((27,28,36,37,38,47,48,56,57))
    groups.append((34,35,42,43,44,50,51,59,60))
    groups.append((45,46,54,55,63,64,72,73,74))
    groups.append((58,65,66,67,68,69,75,76,77))
    groups.append((52,53,61,62,70,71,78,79,80))
    return groups

def ConvertMat( mat ):
    # convert a matrix to a dictionary of boxes
    dct = {}
    # box = [answer,[choices]]
    k = 0
    V,H = mat.shape
    for i in range(V):
        for j in range(H):
            if mat[i,j] == -1:
                box = [-1,[1,2,3,4,5,6,7,8,9]]
            else:
                box = [mat[i,j],[]]
            dct[k] = box
            k += 1
    return dct

    
def AnswersInGroup( dct, groupsi ):
    # answers already set in a single group: groups[i]
    ans = []
    for i in groupsi:
        if dct[i][0] != -1:
            ans.append( dct[i][0] )
    return ans

def RemovalInGroup( aig, dct, groupsi ):
    # remove choices in group if answers are set
    # aig from AnswersInGroup
    for i in groupsi:
        # consider each answer
        for j in aig:
            if j in dct[i][1]:
                # j is a set answer and it exists in block dct[i]
                dct[i][1].remove(j)
                    
def FindSolos(dct):
    ct = 0
    for i in dct.keys():
        if dct[i][0]==-1 and len(dct[i][1])==1:
            ct += 1
            dct[i][0] = dct[i][1].pop(0)
    return ct  # if 0 then there were no changes

def Rule1( dct, groups ):
    for g in groups:
        aig = AnswersInGroup(dct,g)
        RemovalInGroup(aig,dct,g)
    ct = FindSolos(dct)
    return ct


def SingleSolutions(dct,groupsi ):
    # in this group, are there any squares with a single solution?
    # gather all of the candidate answers
    cand = []
    for i in groupsi:
        cand.extend( dct[i][1] )
        candunique = list(set(cand))
    # if a candidate exists only once then put it in a list
    hit = []
    for i in candunique:
        if cand.count(i)==1:
            hit.append( i )
    # find and set these
    for i in groupsi:
        for j in hit:
            if j in dct[i][1]:
                # you found it
                #print ('Proxy',i,j,dct[i])
                dct[i][0] = j
                dct[i][1] = []

def AllSingles( dct, groups ):
    hits = []
    for g in groups:
        a = SingleSolutions(dct,g)
        print (a)
        hits.extend( a )
    return hits

def GoSingle( hits, dct ):
    # for each single,
    for i,q  in hits:
        #print ('Proxy',i,q,dct[i])
        dct[i][0] = q
        dct[i][1] = []
        
def Rule2( dct, groups ):
    # for each group
    hits = [] # will contain those boxes that have single solutions
    for g in groups:
        # get candidates
        cands = []
        for i in g:
            if dct[i][0] == -1:
                cands.extend( dct[i][1] )
        # get unique candidates
        unq = list( set( cands ))
        # for each unique candidate
        for q in unq:
            # if the count is exactly 1
            if cands.count( q ) == 1:
                # then there is only one location for this solution
                for i in g:
                    if q in dct[i][1]:
                        hits.append( (i,q) )
    GoSingle(hits,dct)


def EndGame(dct):
    # if all boxes have a solution then return True
    answ = 0
    for k in dct.keys():
        if dct[k][0] == -1:
            answ +=1
    return answ

def PrintSolution(dct):
    k = 0
    for i in range(9):
        for j in range(9):
            print(dct[k][0],end=' ')
            k = k+ 1
        print('')

def Sudoku(dct,groups):
    ok = True
    while ok:
        end1 = EndGame(dct)
        Rule1( dct, groups )
        #ct = FindSolos(dct)
        #print('a',end1)
        end2 = EndGame(dct)
        if end2 == 0:
            break # you win
        if end1==end2:
            hits=Rule2(dct,groups)
            #GoSingle(hits,dct)
            end3 = EndGame(dct)
            #print('b',end2)
            if end1==end3:
                break
    PrintSolution(dct)
	
def SwapCells(puzzle,val1,val2):
    ans = puzzle + 0
    v,h = (puzzle==val1).nonzero()
    ans[v,h] = val2
    v,h = (puzzle==val2).nonzero()
    ans[v,h] = val1
    return ans
	
def SwapBlockRows(puzzle, rndx1, rndx2 ):
    if rndx1 not in (0,3,6) or rndx2 not in (0,3,6):
        print('Index input must be 0,3,or 6')
        return 0
    ans = puzzle + 0
    for i in range(3):
        ans[[rndx1+i,rndx2+i]] = ans[[rndx2+i,rndx1+i]]
    return ans

# a[[2,0]] = a[[0,2]] # rows ::: a[:,[2,0]] = a[:,[0,2]] # columns
# puzzle2 = np.rot90(puzzle,1) 
# p2 = np.fliplr(puzzle); p3 = np.flipud(puzzle)

def TrivialSolution():
    puzzle = np.zeros((9,9),int)
    puzzle[0] = (1,2,3,4,5,6,7,8,9)
    puzzle[1] = (4,5,6,7,8,9,1,2,3)
    puzzle[2] = (7,8,9,1,2,3,4,5,6)
    puzzle[3] = (2,3,4,5,6,7,8,9,1)
    puzzle[4] = (5,6,7,8,9,1,2,3,4)
    puzzle[5] = (8,9,1,2,3,4,5,6,7)
    puzzle[6] = (3,4,5,6,7,8,9,1,2)
    puzzle[7] = (6,7,8,9,1,2,3,4,5)
    puzzle[8] = (9,1,2,3,4,5,6,7,8)
    return puzzle

def RemoveRandomCell(puzzle):
    v,h = (puzzle!=-1).nonzero()
    ndx = list(range(len(v)))
    r = np.random.choice(ndx)
    puzzle[v[r],h[r]] = -1
	
def CreatePuzzle():
    puz = TrivialSolution(); groups = Architecture1()
    ok = True;     oldpuz = puz + 0
    while ok:
        RemoveRandomCell(puz)
        dct = ConvertMat(puz)
        Sudoku(dct,groups)
        a = EndGame(dct)
        if a!=0:
            ok=False;    print(oldpuz)
        else:
            oldpuz = puz + 0


def Puzzle1():
    mat = np.array( (
        (-1,-1,7,9,6,2,4,-1,-1),
        (9,-1,-1,-1,1,-1,-1,-1,2),
        (-1,1,-1,8,5,3,-1,6,-1),
        (5,-1,-1,4,7,9,-1,-1,1),
        (-1,-1,-1,-1,8,-1,-1,-1,-1),
        (4,-1,-1,3,2,1,-1,-1,7),
        (-1,9,-1,2,4,8,-1,5,-1),
        (6,-1,-1,-1,3,-1,-1,-1,8),
        (-1,-1,8,6,9,5,1,-1,-1) ) )
    dct = ConvertMat(mat)
    return dct        

def Puzzle2():
    mat = np.array( ( 
        (-1,1,-1,4,9,-1,7,-1,-1),
        (-1,-1,-1,-1,7,-1,8,-1,6),
        (2,3,-1,-1,-1,-1,-1,-1,-1),
        (-1,-1,-1,-1,-1,-1,-1,-1,5),
        (6,9,-1,-1,5,-1,-1,1,7),
        (7,-1,-1,-1,-1,-1,-1,-1,-1),
        (-1,-1,-1,-1,-1,-1,-1,9,8),
        (4,-1,5,-1,-1,-1,-1,-1,-1),
        (-1,-1,1,-1,8,4,-1,7,-1) )    
    )
    dct = ConvertMat(mat)
    return dct        
    
def Puzzle3():
    # Use GroupsType2 !!!!!!!!
    mat = np.array( ( 
        ( 5,-1,-1,-1,-1,-1,-1,-1, 7),
        (-1,-1,-1,-1,-1,-1,-1,-1,-1),
        (-1, 2,-1, 5,-1, 6,-1, 9,-1),
        (-1, 9,-1, 4,-1, 3,-1, 7,-1),
        (-1,-1,-1,-1,-1,-1,-1,-1,-1),
        (-1, 7, 2,-1,-1,-1, 9, 4,-1),
        (-1, 8,-1,-1,-1,-1,-1, 3,-1),
        (-1,-1,-1, 2,-1, 5,-1,-1,-1),
        ( 9,-1,-1,-1,-1,-1,-1,-1, 6)
    ))
    dct = ConvertMat(mat)
    return dct        
    

# Hard
def Puzzle337():
    mat = np.array( (
        (4,-1,1,-1,-1,6,-1,-1,-1),
        (-1,5,-1,-1,-1,7,-1,-1,-1),
        (-1,8,-1,-1,-1,-1,5,4,3),
        (1,-1,-1,9,-1,-1,4,-1,2),
        (-1,-1,2,-1,7,-1,3,-1,-1),
        (6,-1,5,-1,-1,1,-1,-1,7),
        (5,6,9,-1,-1,-1,-1,8,-1),
        (-1,-1,-1,7,-1,-1,-1,3,-1),
        (-1,-1,-1,5,-1,-1,6,-1,9)) )
    dct = ConvertMat(mat)
    return dct        

def Puzzle338():
    mat = np.array( (
        (9,-1,-1,-1,-1,4,3,-1,-1),
        (4,1,-1,-1,-1,-1,-1,6,-1),
        (-1,-1,-1,-1,5,8,-1,4,2),
        (-1,-1,-1,-1,-1,3,7,1,-1),
        (3,-1,-1,-1,2,-1,-1,-1,4),
        (-1,7,9,6,-1,-1,-1,-1,-1),
        (5,9,-1,3,7,-1,-1,-1,-1),
        (-1,8,-1,-1,-1,-1,-1,3,5),
        (-1,-1,3,8,-1,-1,-1,-1,9)))
    dct = ConvertMat(mat)
    return dct        

def Puzzle339():
    mat = np.array( (
        (6,-1,-1,8,-1,-1,-1,4,1),
        (4,-1,-1,-1,-1,-1,-1,-1,-1),
        (-1,1,2,4,-1,-1,9,-1,-1),
        (7,-1,1,3,5,-1,-1,-1,-1),
        (-1,-1,9,-1,-1,-1,5,-1,-1),
        (-1,-1,-1,-1,8,9,1,-1,7),
        (-1,-1,5,-1,-1,2,6,8,-1),
        (-1,-1,-1,-1,-1,-1,-1,-1,9),
        (8,4,-1,-1,-1,7,-1,-1,5)) )
    dct = ConvertMat(mat)
    return dct        
    
# Hard
def Puzzle340():
    mat = np.array( (
        (-1,1,-1,5,-1,-1,-1,6,7),
        (-1,8,-1,9,7,-1,-1,-1,-1),
        (-1,-1,2,-1,-1,-1,-1,-1,-1),
        (5,-1,-1,6,-1,-1,-1,-1,4),
        (8,-1,-1,7,-1,4,-1,-1,2),
        (2,-1,-1,-1,-1,3,-1,-1,9),
        (-1,-1,-1,-1,-1,-1,7,-1,-1),
        (-1,-1,-1,-1,3,6,-1,2,-1),
        (9,4,-1,-1,-1,7,-1,1,-1)))
    dct = ConvertMat(mat)
    return dct        

            
#mat, groups = Puzzle1()
#dct = ConvertMat(mat)
#Sudoku(dct,groups)
#print(EndGame(dct))