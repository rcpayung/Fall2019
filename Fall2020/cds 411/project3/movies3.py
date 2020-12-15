# movies.py
# JM Kinser
# version 3

import pandas
import numpy as np

def ReadData(fname):
    df = pandas.read_excel(fname,sheet_name='movies')
    movies = df.values
    df = pandas.read_excel(fname,sheet_name='actors')
    actors = df.values
    df = pandas.read_excel(fname,sheet_name='isin')
    isin = df.values.astype(int)
    return movies, actors, isin

# ########### Analysis Functions #################

# average:   avg = sum(inlist)/len(inlist)

def CombineLists( list1, list2 ):
    s1 = set(list1)
    s3 = s1.intersection( list2 )
    outlist = list( s3 )
    return outlist


# ########### Single input single output #################

def TitleFromMid( movies, mid ):
    tt = ''
    ndx = (movies[:,0]==mid).nonzero()[0]
    if len(ndx)>0:
        tt = movies[ndx[0]][1]
    return tt

def MidFromTitle( movies, title ):
    mid = 0
    ndx = (movies[:,1]==title).nonzero()[0]
    if len(ndx)>0:
        mid = movies[ndx[0]][0]
    return mid
    
def AidFromName( actors, firstname, lastname):
    aid = -1
    ndx1 = (actors[:,1]==firstname).nonzero()[0]
    ndx2 = (actors[:,2]==lastname).nonzero()[0]
    ndx = CombineLists( ndx1, ndx2 )
    if len(ndx)>0:
        aid = actors[ndx[0]][0]
    return aid

def NameFromAid( actors, aid ):
    ndx = (actors[:,0]==aid).nonzero()[0][0]
    return actors[ndx,1],actors[ndx,2]


# Single Input - Multiple Output
def AidsFromMid( isin, mid ):
    ndx = (isin[:,1]==mid).nonzero()[0]
    aids = isin[ndx,2]
    return aids

def MidsFromAid( isin, aid ):
    ndx = (isin[:,2]==aid).nonzero()[0]
    mids = isin[ndx,1]
    return mids

def AidsFromMids(isin, mids):
    aids = [];
    for i in mids:
        aidsInside = AidsFromMid(isin,i);
        aidsInside = aidsInside.flatten();
        for j in aidsInside:
            if (j in aids):
                pass;
            else:
                aids.append(j);
    return aids;

def MidsFromAids(isin, aids):
    mids = [];
    for i in aids:
        midsInside = MidsFromAid(isin,i);
        midsInside = midsInside.flatten();
        for j in midsInside:
            if (j in mids):
                pass;
            else:
                mids.append(j);
    return mids;

# Multiple Inputa - Multiple Output
def NamesFromAids( actors, aids ):
    names = []
    for a in aids:
        names.append( NameFromAid(actors,a))
    return names

def TitlesFromMids( movies, mids ):
    titles = []
    for m in mids:
        titles.append( TitleFromMid(movies,m))
    return titles

