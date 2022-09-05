function [recorder,Fs] = grabarAudio()
% Graba Audio 
% [recorder,Fs] = grabarAudio();
% Graba datos de audio desde un dispositivo de entrada (como un microfono),
% con una frecuencia de muestreo (Fs) de 44100 Hz, bits por muestra 24 y 1 canal. 
% Variables de entrada:
%   no hay
%
% Variables de salida:
%	recorder = objeto para grabacion de audio 
%   Fs = frecuencia de muestreo
% 
% Autores
%   Profesor: Joseba Imanol Madariaga
%   Alumna: Oihane Larrucea	
% Fecha
%  2022
%© Universidad del Pais Vasco 

Fs = 44100; 
recorder = audiorecorder(Fs,24,1);
record(recorder);
end
