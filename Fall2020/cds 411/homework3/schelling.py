# schelling.py
# JM Kinser

# Oct 2019: Fixed Unhappy function

import numpy as np
import imageio

def Init(V,H,pctempty):
    global grid
    grid=np.zeros((V,H),int)
    # populate
    t1 = pctempty # first threshold
    t2 = (1-t1)/2 + t1 # second threshold
    r = np.random.rand(V,H)
    mask1 = (r>t1)*(r<=t2)
    mask2 = (r>t2)
    grid = grid + mask1 + mask2*2
	
def Init2(V,H,pctempty):
    grid=np.zeros((V,H),int)
    # populate
    t1 = pctempty # first threshold
    t2 = (1-t1)/2 + t1 # second threshold
    r = np.random.rand(V,H)
    mask1 = (r>t1)*(r<=t2)
    mask2 = (r>t2)
    grid = grid + mask1 + mask2*2
    return grid

def Init3D(V,H,pctempty):
    global grid
    grid=np.zeros((V,H,H),int)
    # populate
    t1 = pctempty # first threshold
    t2 = (1-t1)/2 + t1 # second threshold
    r = np.random.rand(V,H)
    mask1 = (r>t1)*(r<=t2)
    mask2 = (r>t2)
    grid = grid + mask1 + mask2*2

def Init4(V,H,pctempty):
    global grid
    grid=np.zeros((V,H),int)
    # populate
    t1 = pctempty # first threshold
    step = (1-t1)/4
    t2 = t1+step
    t3 = t2 + step
    t4 = t3 + step
    r = np.random.rand(V,H)
    mask1 = (r>t1)*(r<=t2)
    mask2 = (r>t2)*(r<=t3)
    mask3 = (r>t3)*(r<=t4)
    mask4 = (r>t4)
    print(step,t1,t2,t3,t4)
    grid = grid + mask1 + mask2*2 + mask3*3 + mask4*4

def Unhappy(grid):
    V,H = grid.shape
    ans = np.zeros((V,H),int)
    ans[:-1,:-1] += (grid[1:,1:] != grid[:-1,:-1])*(grid[1:,1:]!=0).astype(int)
    ans[:-1,:] += (grid[1:,:] != grid[:-1,:])*(grid[1:,:]!=0).astype(int)
    ans[:-1,1:] += (grid[1:,:-1] != grid[:-1,1:])*(grid[1:,:-1]!=0).astype(int)
    
    ans[:,1:] += (grid[:,:-1] != grid[:,1:])*(grid[:,:-1]!=0).astype(int)
    ans[:,:-1] += (grid[:,1:] != grid[:,:-1])*(grid[:,1:]!=0).astype(int)
    
    ans[1:,:-1] += (grid[:-1,1:] != grid[1:,:-1])*(grid[:-1,1:]!=0).astype(int)
    ans[1:,:] += (grid[:-1,:] != grid[1:,:])*(grid[:-1,:]!=0).astype(int)
    ans[1:,1:] += (grid[:-1,:-1] != grid[1:,1:])*(grid[1:,1:]!=0).astype(int)
    ans *= (grid != 0)
    return ans

def CollectGrumps(uhap, gamma=5):
    mask = uhap>=gamma
    v,h = mask.nonzero()
    return v,h
    
def FindEmpty(grid):
    ev,eh = (grid==0).nonzero()
    return ev,eh

def Move1Unhappy(v,h,ev,eh,grid):
    N = len(v)
    if N>0:
        me = np.random.randint(0,N)
        mover = v[me],h[me]
        M = len(ev)
        me = np.random.randint(0,M)
        newloc = ev[me],eh[me]
        # move
        grid[newloc] = grid[mover]
        grid[mover] = 0
    
def Iterate(grid):
    u = Unhappy(grid)
    v,h = CollectGrumps(u,4)
    ev,eh = FindEmpty(grid)
    Move1Unhappy(v,h,ev,eh,grid)

# imageio.imsave('dud.png',grid.astype(np.uint8))
def Go():
    Init(100,100,0.008)
    for i in range( 25 ):
        for j in range( 10000 ):
            Iterate(grid)
        u = Unhappy(grid)
        print((u>=4).sum())
        imageio.imsave('dud'+str(i) + '.png',(100*grid).astype(np.uint8))

def Go3D():
    Init3D(100,100,0.008)
    for i in range( 25 ):
        for j in range( 10000 ):
            Iterate(grid)
        u = Unhappy(grid)
        print((u>=4).sum())
        imageio.imsave('dud'+str(i) + '.png',(100*grid[:,:,50]).astype(np.uint8))


def Go4():
    Init4(100,100,0.01)
    for i in range( 10 ):
        for j in range( 500000 ):
            Iterate(grid)
        u = Unhappy(grid)
        print((u>=4).sum())
        imageio.imsave('dud'+str(i) + '.png',(100*grid).astype(np.uint8))