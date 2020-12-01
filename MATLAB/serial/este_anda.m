% Ejemplo de envío y recepción de caracteres

s = serial('COM5');
set(s,'BaudRate',115200);  % Se configura la velocidad
s.Parity='even';          % Paridad
s.ByteOrder = 'littleEndian';
fopen(s);
fprintf(s,'m')      % Se envía la secuencia de caracteres '*IDN?', que sería una solicitud de 
                        % datos de identificación del dispositivo
out = fscanf(s);        % Se muestran por pantalla todos los datos recibidos

% Cierre y eliminación del puerto
fclose(s)           
delete(s)
clear s
fclose(instrfind)