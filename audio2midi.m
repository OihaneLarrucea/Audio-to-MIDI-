function [nmat,m,T,m2] = audio2midi(bpm,x,Fs)
% Conversor de audio a MIDI
%[nmat,m,T] = audio2midi(bpm,x,Fs);
% Funcion que llama a todas las funciones necesarias para realizar la
% conversion de audio a MIDI. Funcion creada para llamar a todas las funciones relacionadas con la conversion, facilmente 
% en la creacion de la aplicacion con Matlab App Designer (App.mlapp). 
%
% Variables de entrada:
%   x = Datos muestreados del archivo de audio 
%   Fs = Frecuencia de muestreo
%   bpm = Tempo en bits por minuto
%
% Variable de salida:
%   nmat = matriz de notas 
%   m = array de notas midi en todos los tramos de tiempo (salida de la funcion hz2midi.m)
%   T = Vector de instantes de tiempo
%   m2 = vector de notas midi en los instantes de tiempo que se detecta
%   como nota MIDI, por tanto los silencios tendran valor nan 
%
% Autores
%   Profesor: Joseba Imanol Madariaga
%   Alumna: Oihane Larrucea	
% Fecha
%  2022
%© Universidad del Pais Vasco 

% Espectrograma
[S,F,T,ps,fa,L] = espectrograma(x,Fs);
% Identificar frecuencias fundamentales
hz = f0_pitch(x,Fs,L);
% Energia
Energia = sum(ps);
% Convierte las notas (hz) en notas midi
m = hz2midi(hz);
% Crea array de notas, duracion y inicio de nota (onset)
[notes,dur,onset,velocity,m2] = notasMIDI(T,m,Energia);
% Crear Matriz nmat (MIDI)
nmat = createnmat2(bpm,notes,dur,onset,velocity,1);

end

