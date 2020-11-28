% En este ejemplo se genera una lista de coeficientes
% para un fultro FIR. También se genera una señal de datos que se desea filtrar.
% La señal se filtra internamente (en el script) para luego poder comparar los datos.
% Se genera un vector con los coeficientes seguidos de los datos.
% Se configura el puerto y se envían los datos



%% Inicialización
clear all

%% Generacion de datos a enviar
% datos
N = 512;

% Senal a enviar
f1 = 500;   % se usan dos senos, esta es la frecuencia de uno
f2 = 20000; % frecuencia del otro seno
Fs = 48000; % frecuencia de muestreo supuesta

% genera dos senos
SR = dsp.SineWave('Frequency',[f1,f2],'SampleRate',Fs,...
    'SamplesPerFrame',N);

datosEnv = sum(SR(),2); % Suma las señales senoidales


%% Generacion de coeficientes

Fcutoff = 1000; % frecuencia de corte del filtro


% Generación de los coeficientes
coef = fir1(8,Fcutoff/(Fs/2));


%% Filtrado de la señal

% será de utilidad para luego comparar con los resultados obtenidos en la FPGA

% Visualizador de espectros
plot_filt = dsp.SpectrumAnalyzer('SampleRate',Fs,'PlotAsTwoSidedSpectrum',...
    false,'ShowLegend',true,'YLimits',[-120 30],...
    'Title','Input Signal (Channel 1) Output Signal (Channel 2)');

 testFIR  = dsp.FIRFilter('NumeratorSource', 'Input port', ...
            'FullPrecisionOverride', false, ...
            'ProductDataType', 'Full precision', ... % default
            'AccumulatorDataType', 'Custom', ...
            'CustomAccumulatorDataType', numerictype(1,16,15), ...
            'OutputDataType', 'Custom', ...
            'CustomOutputDataType', numerictype(1,16,15));


for k = 1:50
   input = sum(SR(),2); % Add the two sinusoids together
   filteredOutput = testFIR(input, coef); % Filter
   plot_filt([input,filteredOutput]); % Visualize
end

figure
plot([input,filteredOutput]); % Visualizar


%% Envio de datos

% En este caso, se usa el formato IQ1.15, que sería S(16,15)
datosEnv_pf = fi(datosEnv,1,16,15);  % convierte los datos generados a tipo de datos punto fijo


% Ejemplos de cómo se obtienen los datos en diferentes formatos
datosEnv_int = datosEnv_pf.int;  % convierte a entero
datosEnv_bin = datosEnv_pf.bin;  % convierte a binario (comp2)
 
 
% Se hace los mismo para los coeficientes
coefEnv_pf = fi(coef,1,16,15);
coefEnv_int = coefEnv_pf.int; % convierte a entero

% Se genera el vector a enviar
datosTotales = [coefEnv_int, datosEnv_int']  % concatena coeficientes con datos


% Se crea un objeto s tipo puerto serie
s = serial('/dev/tty1'); % Puerto
s.Baudrate = 115200 ;    % Velocidad
s.StopBits=1;            % Bits de stop
s.Parity='odd';          % Paridad
s.ByteOrder = 'littleEndian';   
% Ejemplo de casos de ByteOrder:
% Hexadecimal value 4F52 is to be stored in device memory. 
% Using big-endian format, 4F is stored first in the lower storage address. 
% Using little-endian, 52 is stored first in the lower storage address.


fopen(s)


% Envía todos los datos, los formatea como int16 (agrupa de a dos bytes)
fwrite(s, datosTotales, 'int16')

fclose(s)
