




[y,fs] = audioread ("Audio File.wav");
num_of_samples = length(y);
time = linspace(0, num_of_samples/fs, num_of_samples);
figure
plot(time,y)
title ("Time Domain")
xlabel ( "Time" )
ylabel ( "Amplitude" )
grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = linspace (0,fs,num_of_samples);
Y = fft (y,num_of_samples);
figure
plot(f,Y)
title( "Frequancy Domain" );
xlabel( "Frequancy" );
ylabel( "Magnitude" );
grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% High Pass Filter in time domain
cutoff_frequency = 500;
filter_order = 100;
% Design the high-pass filter using fir1
b = fir1(filter_order, cutoff_frequency / (fs/2), 'high');
% Apply the high-pass filter to the audio signal
filtered_audio_time_domain = filter(b, 1, y);
figure
plot(time,filtered_audio_time_domain);
title( "Filtered Signals in Time Domain" );
xlabel( "Frequancy" );
ylabel( "Magnitude" );
grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% High Pass Filter in Freq. domain
filtered_audio_freq_domain = fft (filtered_audio_time_domain,num_of_samples);
figure
plot(f,filtered_audio_freq_domain)
title( "Filtered Signals in Frequancy Domain" );
xlabel( "Frequancy" );
ylabel( "Magnitude" );
grid on


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Play the original and filtered audio
sound(y, fs); % Play original
pause(10); % Pause for a moment
sound(filtered_audio_time_domain, fs); % Play filtered
audiowrite( "Filtered.wav" , filtered_audio_time_domain, fs); % save audio file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

