function n = exportarMIDI(nmat,bpm)
% Exportar archivo MIDI (.mid)
% n = exportarMIDI(nmat,bpm);
% 
% Crea archivo midi a partir de la matriz nmat y el tempo bpm
%
% Argumentos de entrada:
%   nmat = matriz de notas 
%   bpm = beats per minute 
% Salida:
%   n = Archivo MIDI (.mid) 

ofname = input('Introduce el nombre del archivo midi (.mid):\n','s');
n = writemidi(nmat,ofname,bpm);
end

