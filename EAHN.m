function [t,e] = EAHN(dur)

    fs = 8000;
    n = fs * dur / 1000;
    k = 10;
    f0 = 600;
    e = zeros(1,n);
    Ak = 1;
    t = (1:n)/fs;
    phi = 2*pi*rand(1,k);

    for i = 1:n
        for j = 1:k
            e(i) = e(i) + (Ak * sin(2*pi*j*f0*i + phi(j)));
        end
    end
    
end