# this code is to cross validate the bandpower calculation between python and matlab

import numpy as np
import scipy
from scipy.integrate import simpson

def bandspower(x, fs, bands):
    res = {}
    f, Pxx = scipy.signal.periodogram(x, window='hann', fs=fs)
    for band, (low, high) in bands.items():
        ind_min = np.argmax(f >= low)
        ind_max = np.argmax(f >= high)
        p = simpson(Pxx[ind_min:ind_max], f[ind_min:ind_max])
        res[band] = p

    return res

if __name__ == '__main__':
    bands = {
        'delta': (0.1, 4),
        'theta': (4, 8),
        'alpha': (8, 12),
        'beta1': (12, 18),
        'beta2': (18, 30),
        'beta3': (30, 40),
        'gamma': (40, 50),
    }
    data = np.loadtxt('./test_sig.txt')
    fs = 200

    res = bandspower(data, fs, bands)
    print(res)