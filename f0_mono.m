function  hz = f0_mono(ps,fa,T)
% Frecuencias fundamentales
% hz = f0_mono(ps,fa,T);
% Deteccion de frecuencias fundamentales en una melodia silbada. Ya que una
% melodia silbada no tiene armonicos. 
% Para detectar las fercuencias fundamentales teniendo en cuenta los
% armonicos( en caso de melodia tarareada), habria que tener en cuenta: 
% Distancia minima entre picos minimo la de la frecuencia fundamental: distancia entre
% frecfund y armonico1 : 2*f - f = f ; 3*f - 2*f = f -> f0. 
% La idea seria que si se cumple que la distancia de la frecFundamental con
% la de los armonicos es f0, sera porque hay nota cantada, y por tanto se
% guardara el f0(n), si no se descartara. 
% Habria que tener en cuenta tambien la energia (ps). Normalmente cuando se
% empieza a cantar la energia es mayor que cuando se alarga esa nota, por
% lo utilizando ps, podriamos suponer que cuando es mayor es inicio de
% nota y en ese tramo hay una frecuencia fundamental que nos interesa. 

c = length(T);

for i = 1:c
     [pks,locs] = findpeaks(ps(:,i),fa); % buscar picos en cada columna
     [valor posicion] = max(pks); % guardar valor y posicion del maximo valor de pks
     hz(i) = locs(posicion); % locs = frecuencia, se guarda en f0 (posicion para saber en que trama T)
end

end

