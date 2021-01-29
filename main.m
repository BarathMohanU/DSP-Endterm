%% a

figure;
for i =1:4
    [t,e] = EAHN(20);
    subplot(2,2,i); plot(t,e);
end

%% b

figure;
for i =1:4
    [t,e] = UAHN(20);
    subplot(2,2,i); plot(t,e);
end

%% c

figure;
load('data.mat');
y = y(8001:16000)';
t = (1:8000)/8000;
plot(t,y); title('Original signal'); figure;
db = [0, 5, 10, 15];
l = 1;

for i=1:length(db)
    for j = 1:2
        [~,e] = EAHN(1000);
        noisy_sig = addnoise(y, e, db(i));
        subplot(length(db),2,l); plot(t,noisy_sig); title(sprintf('SNR %d Realization %d',db(i),j));
        l = l+1;
    end
end
sgtitle('EAHN');

%% d

figure;
load('data.mat');
y = y(8001:16000)';
t = (1:8000)/8000;
db = [0, 5, 10, 15];
l = 1;

for i=1:length(db)
    for j = 1:2
        [~,e] = UAHN(1000);
        noisy_sig = addnoise(y, e, db(i));
        subplot(length(db),2,l); plot(t,noisy_sig); title(sprintf('SNR %d Realization %d',db(i),j));
        l = l+1;
    end
end
sgtitle('UAHN');

%% e

load('data.mat');
y = y(8001:16000)';
db = [0, 5, 10, 15];

for i=1:length(db)
    for j=1:10
        [~,e] = EAHN(1000);
        noisy_sig = addnoise(y, e, db(i));
        SNR(j) = binSNR(noisy_sig);
    end
    fprintf('The mean SNR is %0.2f (actual SNR = %d) with a standard deviation %0.2f\n', mean(SNR), db(i), std(SNR));
end

%% f

load('data.mat');
y = y(8001:16000)';
db = [0, 5, 10, 15];

for i=1:length(db)
    for j=1:10
        [~,e] = UAHN(1000);
        noisy_sig = addnoise(y, e, db(i));
        SNR(j) = binSNR(noisy_sig);
    end
    fprintf('The mean SNR is %0.2f db (actual SNR = %d db), with a standard deviation %0.2f\n', mean(SNR), db(i), std(SNR));
end