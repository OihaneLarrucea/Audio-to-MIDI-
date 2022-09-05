function [N,X_mag] = FFT(x)
% Transformada de Fourier
% [N,X_mag] = FFT(x);  

X = fft(x);
X_mag = abs(X); %modulo de X
%X_den = (X_mag.^2)/5000; %Densidad espectral de potencia 
N = length(x); %Numero de elementos

end

