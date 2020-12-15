# bacon2.py
# JM Kinser
# April 2013
# July 2018 - Removed all need for SQL

#%%
import numpy as np
import floyd
import movies3 as mvs
#%%
def Load(aname='../texbook/data/actors.csv', iname='../texbook/data/isin.csv', mname='../texbook/data/movies.csv' ):
    actors = mvs.LoadActors(aname)
    actorsdct = {}
    for i in actors:
        aid = int(i[0])
        actorsdct[aid] = i[1], i[2]
    isin = mvs.LoadIsin(iname)
    movies = mvs.LoadMovies(mname)
    return movies, isin, actors, actorsdct
#%%
## Create G
def MakeG( isin ):
    ## list of unique aids + sort
    mat = np.array( isin )
    t = mat[:,2]+0
    aids = np.array(list(set(t)))
    ## allocate G
    N = len(aids)
    G = np.zeros((N+1,N+1))
    ## for each actor
    for i in aids:
        ## get mids
        mids = mvs.MidsFromAid(isin, i)
        ## aids from actor's movies
        aids2 = mvs.AidsFromMids( isin, mids )
        # populate G
        for a in aids2:
            G[i-1, a-1] = 1
    ## return G
    return G
#%%
def TestFloyd():
    G = np.zeros((6,6)) + 999999999
    G[0,1] = G[1,0] = 4
    G[0,2] = G[2,0] = 2
    G[1,2] = G[2,1] = 5
    G[1,3] = G[3,1] = 10
    G[2,4] = G[4,2] = 3
    G[3,4] = G[4,3] = 4
    G[3,5] = G[5,3] = 11
    for i in range(6):
        G[i,i] = 0
    p = np.zeros((6,6))
    for i in range( 6 ):
        p[i] = i
    f,p = floyd.FastFloydP(G,p)
    return f,p
#%%
# make an image out of G
def RunFloyd( G ):
    # need large values for disconnects
    GG = np.zeros( G.shape )
    GG = G + (1-G)*9999999
    ndx = np.indices( GG.shape )
    pp = (G * ndx[0]).astype(int)
    g,p = floyd.FastFloydP( GG,pp )
    return g,p


