function [notes,dur,onset,velocity,m2] = notasMIDI(T,m,Energia)
% Notas MIDI
% Identifica notas, duracion de cada nota y inicio de la nota
% [notes,dur,onset,velocity,m2] = notasMIDI(T,m,Energia);
% Utilizando el array m (notas midi identificadas en cada tramo T, durante 
% todo el tiempo de grabacion), identifica los tramos con la misma nota, su
% duracion y tiempo de inicio de cada nota, haciendo uso de un filtro. 
% 
% Ejemplo:
% filtro  nan    0,08   0,08  ....   0,08   nan   0,09    0    ...   nan     0,2     0,1   
% i        1      2      3    ....    18    19     20     21   ...    43      44      45
% m      56.61  56,9   56,61   ...  57,03  58,57  58,67  58,67  ...  59,65   59,85   59,75   
%       1.nota --------------------------- 2.nota ------------------3.nota
%       
% 
% Variables de entrada: 
%   T = vector de instantes de tiempo (segundos)
%   m = array de notas midi en todos los tramos de tiempo (salida de la funcion hz2midi.m)
%   Energia = Densidad espectral de potencia de cada tramo de tiempos de la señal 
%
% Variables de salida: 
%	notes = array de notas MIDI   
%   dur = array de duracion de cada nota (segundos)
%   onset = array de inicio de cada nota (segundos)
%   velocity = array de velocidad de cada nota (0-127)
%   m2 = array de notas MIDI en los tramos de tiempo donde se detecta nota
%   MIDI (notes). Los silencios tendran valor nan en ese instante de tiempo
%
% Autores
%   Profesor: Joseba Imanol Madariaga
%   Alumna: Oihane Larrucea	
% Fecha
%  2022
%© Universidad del Pais Vasco 

c = length(T); 
m2 = m;
i=1; % indice para recorrer vector filtro 
cont = 0; % contador de notas en la melodia 
final=1;
filtro = filter([1 -1],1,m);
filtro = abs(filtro);

filtro(filtro>0.5)=nan;

if(~isnan(filtro(i)))
    start=i;
end

while (i<c)
    if(~isnan(filtro(i)) && isnan(filtro(i-1)))
        start = i-1;
        j=i+1;
        while(~isnan(filtro(j)) && j<c)
            j=j+1;
        end
        final = j-1;
        
    if((T(final)-T(start))~=0)
        cont = cont + 1;
        notes(cont) = mean(m(start:final));
        dur(cont) = T(final)-T(start);
        v(cont) = mean(Energia(start:final));
        onset(cont) = T(start);
        
        velocity = 127*(v/max(v));
        notes = round(notes);
    end

    i = final+1;

    else
        m2(i)=nan;
        i = i+1;
    end
    
end
    
end




        




