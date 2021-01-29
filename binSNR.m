function SNR = binSNR(sig)

    L = length(sig);
    Fs = 8000;
    f = Fs*(0:(L-1))/L;

    power = fft(sig).*conj(fft(sig));

    Enoise = 0;
    Esig = 0;
    range = [599,0,1];
    
    for i=1:length(f)
        if sum(mod(f(i),600) == range) == 1
            Enoise = Enoise + power(i);
        else
            Esig = Esig + power(i);
        end
    end
    
    SNR = 10*log10(Esig/Enoise);
    
end