coefEnv_pf = fi(112,0,8,7);
coefEnv_int = coefEnv_pf.int; % convierte a entero


% Ejemplo de envío y recepción de caracteres

s = serial('COM5');
set(s,'BaudRate',115200);  % Se configura la velocidad
s.Parity='even';          % Paridad
s.ByteOrder = 'littleEndian';
fopen(s);
fprintf(s,coefEnv_int,'int8')      % Se envía la secuencia de caracteres '*IDN?', que sería una solicitud de 
                        % datos de identificación del dispositivo
out = fscanf(s);        % Se muestran por pantalla todos los datos recibidos

% Cierre y eliminación del puerto
fclose(s)           
delete(s)
clear s
fclose(instrfind)

