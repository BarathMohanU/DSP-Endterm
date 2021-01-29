% Recording and storing audio
Fs = 8000; %16kHZ
nbits = 16; %bit depth for each sample
myRecObj = audiorecorder(Fs, nbits, 1); % 16kHz
duration = 2; %speech length in seconds
disp('Start speaking.')
recordblocking(myRecObj, duration);
disp('End of Recording.');
play(myRecObj);
y = getaudiodata(myRecObj);
save('data.mat','y');
plot(y);