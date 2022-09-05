function [x,Fs] = menuAudio()
% Menu de Audio
% 1.- Cargar archivo de audio desde la carpeta actual
% 2.- Grabar Audio con Fs = 44100 Hz y introducir nombre del archivo .wav 
%
% Argumentos de entrada:
%   no hay
%
% Salida:
%   x = Datos muestreados del archivo filename 
%   Fs = Frecuencia de muestreo (Fs = 44100 Hz)
%
% Autores
%   Profesor: Joseba Imanol Madariaga
%   Alumna: Oihane Larrucea	
% Fecha
%  2022
%© Universidad del Pais Vasco 

    k = menu('Elige una opcion','Cargar Audio','Grabar Audio');
    switch(k)
        case 1
            % Cargar Audio
            [x,Fs] = cargarAudio();
        case 2
            %Grabar Audio
            [recorder,Fs] = grabarAudio();
            pause
            x = pararGrabacion(recorder);
            filename = input('Introduce el nombre del archivo .wav: ','s');
            audiowrite(filename,x,Fs); 
    end
end

