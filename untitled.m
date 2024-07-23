% 讀取 CSV 文件
data = importdata('./test_sig.txt');
eeg_window = data(1, :);

% 取樣頻率（根據實際情況設置）
fs = 200; % 假設取樣頻率為 1000 Hz

% 設置頻帶範圍
bands = {
    'delta', [0.1, 4];
    'theta', [4, 8];
    'alpha', [8, 12];
    'beta1', [12, 18];
    'beta2', [18, 30];
    'beta3', [30, 40];
    'gamma', [40, 50];
};

% 計算功率譜密度
[Pxx, f] = periodogram(eeg_window, hann(length(eeg_window)), [], fs);

% 初始化功率結果
power_band = zeros(size(bands, 1), 1);

% 計算每個頻帶的功率
for i = 1:size(bands, 1)
    band = bands{i, 2};
    band_power = bandpower(Pxx, f, band, "psd");
    power_band(i) = band_power;
    fprintf('Band %s Power: %f\n', bands{i, 1}, band_power);
end