% coef=fi(112,0,7);
% coef=coef.bin;

% Se crea un objeto s tipo puerto serie
s = serial('COM5'); % Puerto
s.Baudrate = 115200 ;    % Velocidad
s.StopBits=1;            % Bits de stop
s.Parity='even';          % Paridad
s.ByteOrder = 'littleEndian';   
% Ejemplo de casos de ByteOrder:
% Hexadecimal value 4F52 is to be stored in device memory. 
% Using big-endian format, 4F is stored first in the lower storage address. 
% Using little-endian, 52 is stored first in the lower storage address.


fopen(s)


% Envía todos los datos, los formatea como int16 (agrupa de a dos bytes)
fwrite(s, 28781)
%fwrite(s, ['m'],'int16')
out = fscanf(s)
fclose(s)