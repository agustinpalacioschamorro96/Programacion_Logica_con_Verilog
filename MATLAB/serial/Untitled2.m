% Senal a enviar
Fs = 1000000; % frecuencia de muestreo supuesta
Fcutoff = 1000; % frecuencia de corte del filtro
% Generación de los coeficientes
coef = fir1(15,Fcutoff/((2*pi*Fs)/2));
coefEnv_pf = fi(coef,1,16,15);
coefEnv_int = coefEnv_pf.int % convierte a entero

for i=1:16
    if(coefEnv_int(i)>0)
    fprintf('\ncoef%d = 12''d%d;\n',i-1,coefEnv_int(i))
    else
    fprintf('\ncoef%d= - 12''d%d;\n',i-1,coefEnv_int(i))  
    end
end