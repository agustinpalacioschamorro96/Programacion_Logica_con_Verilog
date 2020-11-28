% Ejemplo de envío y recepción de caracteres

s = serial('COM1');
set(s,'BaudRate',4800);  % Se configura la velocidad
fopen(s);
fprintf(s,'*IDN?')      % Se envía la secuencia de caracteres '*IDN?', que sería una solicitud de 
                        % datos de identificación del dispositivo
out = fscanf(s);        % Se muestran por pantalla todos los datos recibidos

% Cierre y eliminación del puerto
fclose(s)           
delete(s)
clear s
