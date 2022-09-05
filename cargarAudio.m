function [x,Fs,t] = cargarAudio()
% Carga archivo de audio
% [x,Fs] = cargarAudio();
% Abre un cuadro de diálogo modal que enumera los archivos de la carpeta actual. 
% Permite al usuario seleccionar o introducir el nombre de un archivo. Si el archivo existe y es válido, 
% devuelve el nombre del archivo cuando el usuario hace clic en Abrir. 
% Con audioread, lee los datos del archivo llamado filename. 
%
% Variables de entrada:
%   no hay
%
% Variables de salida:
%	x = Datos muestreados del archivo filename
%   t = tiempo de duracion del audio en segundos 
%   Fs = Frecuencia de muestreo 
%
% Autores
%   Profesor: Joseba Imanol Madariaga
%   Alumna: Oihane Larrucea	
% Fecha
%  2022
%© Universidad del Pais Vasco 

[filename,pathAudio] = uigetfile('*.mp3;*.wav','Selecciona archivo de audio mp3 o wav','');

if filename == 0
    msgbox('No has seleccionado ningun audio','Error');
    return
end

[x,Fs] = audioread([pathAudio filename]);
t =(0:length(x)-1)/Fs;
end

