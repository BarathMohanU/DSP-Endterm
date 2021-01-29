function [t,e] = UAHN(dur)

    fs = 8000;
    n = fs * dur / 1000;
    k = 10;
    f0 = 600;
    e = zeros(1,n);
    t = (0:n-1)/fs;
    phi = 2*pi*rand(1,k);
    A = rand(1,k);
    A(1) = 1;

    for i = 1:n
        for j = 1:k
            e(i) = e(i) + (A(j) * sin(2*pi*j*f0*(i-1) + phi(j)));
        end
    end

end