function [S,F,T,ps,fa,L] = espectrograma(x,Fs)
% Espectrograma
% [S,F,T,ps,fa,L] = espectrograma(x,Fs);
% 
% Argumentos de entrada:
%   x = Datos muestreados del archivo de audio 
%   Fs = frecuencia de muestreo
% 
% Salida:
%   S =  Matriz de transformada de Fourier de corta duración
%   F =  Vector de frecuencias cíclicas
%   T =  Vector de instantes de tiempo
%   ps = Matriz de densidad espectral de potencia 
%   fa = vector fa de Nf puntos equidistantes en el intervalo [0,BW] 
%   BW = 4410 Hz
%   L = 4410 puntos 
% Autores
%   Profesor: Joseba Imanol Madariaga
%   Alumna: Oihane Larrucea	
% Fecha
%  2022
%© Universidad del Pais Vasco 

L = (1/10)*Fs; 
BW = Fs/10;
Nf = 1024; %genera 1024 puntos 
fa = linspace(0,BW,Nf); 
window = hanning(L); %devuelve una ventana de Hann simétrica de L puntos
[S, F, T, ps] = spectrogram(x,window,[],fa,Fs,'yaxis'); %Devuelve el espectrograma en las frecuencias cíclicas especificadas en fa

end

