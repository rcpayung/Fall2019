# marray.py

import numpy as np
import pandas
from statsmodels.nonparametric.smoothers_lowess import lowess

def NormGeneExp(fname):
    data = pandas.read_excel(fname)
    dv = data.values
    ch1 = dv[1650:1650+1600,8] - dv[1650:1650+1600,9]
    ch2 = dv[1650:1650+1600,20] - dv[1650:1650+1600,21]
    glist = []
    for i in range(len(ch1)):
        if ch1[i] > 0 and ch2[i]>0:
            glist.append(( dv[i+1650,5],dv[i+1650,8],dv[i+1650,9],dv[i+1650,20], dv[i+1650,21],i))
    N = len(glist)
    ch1 = np.zeros(N)
    ch2 = np.zeros(N)
    i = 0
    for k in range(len(glist)):
        ch1[i] = glist[k][1]-glist[k][2]
        ch2[i] = glist[k][3]-glist[k][4]
        i += 1
    rgratio = ch1/ch2
    intensity = (ch1 + ch2)/2
    M = np.log2(rgratio.astype(float))
    A = np.log2(intensity.astype(float))
    ag = A.argsort()
    A2 = A[ag]
    M2 = M[ag]
    filtered = lowess(M2,A2, is_sorted=True, frac=0.03125, it=0)
    yy = M2 - filtered[:,1]
    return yy,glist, A
