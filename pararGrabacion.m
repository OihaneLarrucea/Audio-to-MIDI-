function [x,t] = pararGrabacion(recorder)
% Para de grabar 
% x = pararGrabacion(recorder);
% Para la grabacion y almacena los datos en x

% Variables de entrada:
%   recorder = Objeto para grabacion de audio 
%
% Variables de salida:
%   x = array (double) con datos de audio grabados 
%
% Autores
%   Profesor: Joseba Imanol Madariaga
%   Alumna: Oihane Larrucea	
% Fecha
%  2022
%© Universidad del Pais Vasco 

Fs = 44100; 
stop(recorder);
x = getaudiodata(recorder);
t =(0:length(x)-1)/Fs;
end

