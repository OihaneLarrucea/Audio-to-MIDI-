function hz = f0_pitch(x,Fs,L)
%Frecuencias fundamentales   
%[hz,thz] = f0_pitch(x,Fs,L);
%Calcula las frecuencias fundamentales y crea un array hz con las
%frecuencias detectadas en x utilizando la funcion pitch.
%Se utiliza la funcion histcounts para limitar el rango de frecuencias a
%detectar. Una vez se limita el rango se vuelve a calcular las frecuencias
%fundamentales obteniendo como resultado hz.
%
% Variables de entrada:
%   x = Datos muestreados del archivo de audio 
%   Fs = Frecuencia de muestreo
%   L = 4410 puntos
%
% Variable de salida:
%   hz = Frecuencias fundamentales
%
% Autores
%   Profesor: Joseba Imanol Madariaga
%   Alumna: Oihane Larrucea	
% Fecha
%  2022
%© Universidad del Pais Vasco 

edges = (0:100:2500);
r1 = 20.1;
r2 = 2500;
range = [r1 r2];
[hz,idx] = pitch(x,Fs,'WindowLength',L,'OverlapLength',L/2,'Range',range);  
[hist,edges] = histcounts(hz,edges);

i=length(hist)-1;
j= 2;
while (i>1) 
    if(hist(i)<5 && hist(i+1)==0 && hist(i-1)~=0)
        r2 = edges(i+1);
    end
    i = i-1;
end

range = [r1 r2];
[hz,idx] = pitch(x,Fs,'WindowLength',L,'OverlapLength',L/2,'Range',range);

hz = transpose(hz);  

end

