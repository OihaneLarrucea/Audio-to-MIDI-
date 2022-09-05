function nmat = identif_notes(T,MIDI)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
bpm = 120; %tiene que marcar el usuario (parametro de entrada)
contNotas = 0; %filas de la matriz nmat (cuantas notas hay en la melodia)
bps = bpm/60; 
c = length(T); 
i=1;
j=1;
nmat=zeros(contNotas,7);
while (i<c) && (j<c) 
    if(MIDI(i)~=0)
        j=i+1;
        contNotas = contNotas+1; %filas de la matriz nmat
        nmat(contNotas,6) = T(i); %segundo donde empieza la nota T(i)
        nmat(contNotas,1) = bps*nmat(contNotas,6);
        nmat(contNotas,4) = MIDI(i);
        nmat(contNotas,5) = 100;
        while(MIDI(i)==MIDI(j) && j<c)
            j=j+1;
        end
        nmat(contNotas,7) = T(j) - T(i); %donde termina la nota posicion j-1 (array T)
        nmat(contNotas,2) = bps*nmat(contNotas,7);
        i= j;
    else 
        i=i+1;
    end
end

end

