% ===============================================
% Autor: Javier Rosas
% Fecha: 27 de octubre de 2024
% Descripción: Programa en Prolog que calcula el
%              máximo común divisor (MCD) de dos
%              números utilizando el algoritmo de
%              Euclides, y verifica si dos números
%              son coprimos. Dos números son coprimos
%              si su MCD es 1.
% ===============================================

% -------- Código en Prolog --------------------
% Predicado gcd(X, Y, G) que calcula el máximo
% común divisor G de los números X e Y usando el
% algoritmo de Euclides.

% Caso base: si el segundo argumento es 0, el MCD es el primer argumento.
gcd(X, 0, X) :- 
    X > 0.

% Caso recursivo: calcula el residuo de X dividido por Y y continúa el proceso.
gcd(X, Y, G) :- 
    Y > 0, 
    R is X mod Y, 
    gcd(Y, R, G).

% Predicado coprime(X, Y) que determina si los
% números X e Y son coprimos. Dos números son
% coprimos si su maximo común divisor es 1.

coprime(X, Y) :- 
    gcd(X, Y, 1).

% Ejemplos de uso:
% ?- gcd(48, 18, G).
% G = 6.
%
% ?- coprime(15, 28).
% true.
%
% ?- coprime(12, 18).
% false.
% ----------------------------------------------
