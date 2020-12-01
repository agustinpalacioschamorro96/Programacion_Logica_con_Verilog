% En este ejemplo, se reciben 800 datos, los datos se toman como enteros de 8 bits


% recibir_datos.m
clc, clear all, close all

instrreset  % Borra y reinicia todos los puertos, evita problemas cuando no se cierran correctamente

x = zeros(800,1); 

s = serial('com5','BaudRate',115200,'InputBufferSize',800);
s.Parity='even';          % Paridad
s.ByteOrder = 'littleEndian';

% Crea un una variable tipo puerto
%   '/dev/ttyUSB1' indica el puerto, se reemplaza por COM1, COM2...
%   'InputBufferSize' se puede usar cuando se reciben muchos datos consecutivos

fopen(s);
% Se conecta al puerto, ningún otro software lo puede usar hasta que se cierre

x = fread(s,800,'int8')
% Comienza a leer
%   Espera a leer 800 dato para continuar
%   Los datos leídos los considera como int8
%   x va a ser un vector con 800 valores

fclose(s);
% Cierra el puerto, recordar hacerlo siempre luego de un fopen()




