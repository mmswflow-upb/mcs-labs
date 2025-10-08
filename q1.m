% Constants
c = 3e8; % Speed of light (m/s)
d = 1000; % Example distance (in meters)
frequencies = [1e6, 4e6, 12e6, 100e6, 900e6, 1e9]; % Frequencies (in Hz)

% Calculate propagation losses for each frequency at the same distance
G_T = 1; % Antenna gain for transmitter (isotropic)
G_R = 1; % Antenna gain for receiver (isotropic)
FreeSpaceLoss = zeros(length(frequencies), 1); % Initialize loss array

for i = 1:length(frequencies)
    FreeSpaceLoss(i) = 10*log10(G_T * G_R * (c / (4 * pi * d * frequencies(i)))^2);
end

% Plot the loss as a function of frequency (log scale)
figure;
semilogx(frequencies, FreeSpaceLoss, '-o', 'LineWidth', 2);
xlabel('Frequency (Hz)');
ylabel('Free Space Loss (dB)');
title('Free Space Propagation Loss vs Frequency');
grid on;

% Slope calculation: The slope in dB per decade
slope = (FreeSpaceLoss(end) - FreeSpaceLoss(1)) / log10(frequencies(end) / frequencies(1));
fprintf('The slope for free space propagation loss variation with frequency is: %.2f dB/decade\n', slope);
