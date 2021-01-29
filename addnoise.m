function noisy_sig = addnoise(sig, noise, db)

    Esig = sum(sig.^2);
    Enoise = sum(noise.^2);
    const = sqrt((10^(-db/10))*(Esig/Enoise));

    noise = noise*const;
    noisy_sig = sig + noise;

end