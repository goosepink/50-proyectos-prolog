% ===============================================
% Autor: Javier Rosas
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que genera el código Gray de N bits.
%              La secuencia de código Gray es una secuencia binaria en la
%              que dos valores consecutivos difieren en solo un bit.
% ===============================================

% -------- Generación de código Gray -----------
% Caso base: el código Gray de 1 bit es ['0', '1'].
gray(1, ['0', '1']).

% Caso recursivo: para N > 1, genera el código Gray de N bits.
gray(N, C) :-
    N > 1,
    N1 is N - 1,
    gray(N1, C1),                 % Genera el código Gray de N-1 bits.
    maplist(atom_concat('0'), C1, C0),  % Prepara la primera mitad con prefijo '0'.
    reverse(C1, C1R),             % Invierte C1 para la segunda mitad.
    maplist(atom_concat('1'), C1R, C1G), % Prepara la segunda mitad con prefijo '1'.
    append(C0, C1G, C).           % Une ambas mitades para formar el código Gray de N bits.

% Ejemplo de uso:
% ?- gray(3, C).
% C = ['000', '001', '011', '010', '110', '111', '101', '100'].
% ----------------------------------------------
