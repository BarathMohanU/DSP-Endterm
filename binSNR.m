function SNR = binSNR(sig)
    L = 8000;
    Fs = 8000;
    f = Fs*(0:(L))/L;

    power = fft(sig).*conj(fft(sig));

    Enoise = 0;
    Esig = 0;

    for i=1:length(f)-1
        if mod(f(i),600) == 0
            Enoise = Enoise + power(i);
        else
            Esig = Esig + power(i);
        end
    end
    
    SNR = 10*log10(Esig/Enoise);
    
end