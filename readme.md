# (EEG) Band Power Calculation Using Python and Matlab
this repo provides the methods to calculate eeg band power within the window.

### Demo data
window length: 2s
sampling rate: 200Hz

### Band Power Calculation
We want to calculation the power of each following bands:

```
bands = {
    'delta': (0.1, 4),
    'theta': (4, 8),
    'alpha': (8, 12),
    'beta1': (12, 18),
    'beta2': (18, 30),
    'beta3': (30, 40),
    'gamma': (40, 50),
}
```
We will first calculate the power spectral density (PSD) of a signal and then integrate it numerically. The primary different part is, Python commonly uses Simpson's rule, while MATLAB uses the rectangle approximation method. These different approaches can lead to slight variations in the final integral value.