function nmat = createnmat2(bpm,notes,dur,onset,velocity,ch)
% Crea una matriz con las variables de entrada
% nmat = createnmat2(bpm,notes,dur,onset,velocity,ch);
% Funcion que crea una matriz nmat con las variables de entrada.  
% 
%
% Variables de entrada:
%   bpm = Tempo de la cancion (beats per minute)
%	notes = vector de notas 
%	dur  = vector de duracion de las notas (segundos) 
%   onset = vector de tiempo de inicio de cada nota (segundos)
%	velocity = vector de velocidad de las notas (0-127)
%	ch = canal (default 1)
%
% Variable de salida:
%	nmat = matriz de notas
%
%
% Authors:
%  Date		Time	Prog	Note
% 26.1.2003	18:44	TE	Created under MATLAB 5.3 (PC)
%© Part of the MIDI Toolbox, Copyright © 2004, University of Jyvaskyla, Finland
% See License.txt
%
% Modificado por:
% Autores
%   Profesor: Joseba Imanol Madariaga
%   Alumna: Oihane Larrucea	
% Fecha
%  2022
%© Universidad del Pais Vasco 


% Notas
notenro = size(notes,2);
% Duraciones
dur_t = dur;
% Velocidades
vel_t = velocity;
% Canal
ch_t = repmat(ch,notenro,1);
%Onset
bps = bpm/60;

notes = notes';
dur_t = dur_t';
onset = onset';
vel_t = vel_t';


onsetb = onset * bps;
dur_tb = dur_t * bps;

% onset(beats)	dur(beats)	ch	pitch	velocity	onset(secs)	dur(secs)

nmat = [onsetb dur_tb ch_t notes vel_t onset dur_t];  

end
