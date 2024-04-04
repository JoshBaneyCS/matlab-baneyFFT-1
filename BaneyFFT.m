%Joshua Baney
%03 April 2024
%FFT project (Self learning Matlab project)
%Computer Science & Electrical Engineering Student

%This Project takes in an input from a microphone device and performs the
%built in FFT function in Matlab and outputs 2 graphs. (1) Frequency v.
%Magnitude. (2) Frequency v. Time. It does this with 2 recordings and shows
%a comparison of the 2. 


% Initialize audio input
Fs = 44100; % Sampling frequency
duration = 5; % Duration of recording in seconds

% Record first audio from microphone
recObj1 = audiorecorder(Fs, 16, 1); % 16-bit, 1 channel (mono)
disp('Start speaking for recording 1...')
recordblocking(recObj1, duration);
disp('End of recording for recording 1.');

% Get the recorded data for recording 1
audioData1 = getaudiodata(recObj1);

% Record second audio from microphone
recObj2 = audiorecorder(Fs, 16, 1); % 16-bit, 1 channel (mono)
disp('Start speaking for recording 2...')
recordblocking(recObj2, duration);
disp('End of recording for recording 2.');

% Get the recorded data for recording 2
audioData2 = getaudiodata(recObj2);

% Perform FFT for recording 1
N1 = length(audioData1);
frequencies1 = linspace(20, 20000, N1/2); % Frequency range from 20 Hz to 20 kHz
magnitude1 = abs(fft(audioData1)/N1); % Compute magnitude of FFT

% Perform FFT for recording 2
N2 = length(audioData2);
frequencies2 = linspace(20, 20000, N2/2); % Frequency range from 20 Hz to 20 kHz
magnitude2 = abs(fft(audioData2)/N2); % Compute magnitude of FFT

% Plot frequency vs. magnitude for recording 1
figure;
subplot(3,2,1);
plot(frequencies1, magnitude1(1:N1/2));
title('Recording 1: Frequency vs. Magnitude');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Plot frequency vs. time for recording 1
subplot(3,2,2);
time1 = (0:N1-1)/Fs;
plot(time1, audioData1);
title('Recording 1: Time Domain Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot frequency vs. magnitude for recording 2
subplot(3,2,3);
plot(frequencies2, magnitude2(1:N2/2));
title('Recording 2: Frequency vs. Magnitude');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Plot frequency vs. time for recording 2
subplot(3,2,4);
time2 = (0:N2-1)/Fs;
plot(time2, audioData2);
title('Recording 2: Time Domain Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Combine audio data from both recordings
combinedAudio = audioData1 + audioData2;

% Perform FFT for combined audio
N_combined = length(combinedAudio);
frequencies_combined = linspace(20, 20000, N_combined/2); % Frequency range from 20 Hz to 20 kHz
magnitude_combined = abs(fft(combinedAudio)/N_combined); % Compute magnitude of FFT

% Plot frequency vs. magnitude for combined audio
subplot(3,2,[5,6]);
plot(frequencies_combined, magnitude_combined(1:N_combined/2));
title('Combined Recordings: Frequency vs. Magnitude');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Adjust subplot spacing
tight_subplot(3,2,[5,6], [0.1,0.1]);
