
close all;
clear all; 
clc;

%% Tempo
bpm = Tempo();

%% Cargar/Grabar audio 
[x,Fs] = menuAudio();

%% Convertir audio a midi
[nmat,m,T,m2] = audio2midi(bpm,x,Fs);

%% PLOTS

%Grafico de señal de audio en el tiempo
figure(2)
subplot(2,2,1)
plot(x);
title('Señal de audio en el tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');

%Frecuencias fundamentales
subplot(2,2,2)
plot(T,m);
title("Estimacion del tono");
xlabel("Tiempo (s)");
ylabel("Tono (Hz)");
grid on

%Notas MIDI
subplot(2,2,4)
pianoroll(nmat,'hold','sec');
hold on
plot(T,m2,'b');

%% Escuhar archivo en MIDI
playsound(nmat)

%% Exportar archivo MIDI (.mid)
n = exportarMIDI(nmat,bpm);


        