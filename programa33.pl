% ===============================================
% Autor: Javier Rosas
% Fecha: 27 de octubre de 2024
% Descripción: Programa en Prolog que calcula el
%              máximo común divisor (MCD) de dos
%              números utilizando el algoritmo de
%              Euclides, y verifica si dos números
%              son coprimos. Además, calcula la
%              función totiente de Euler (φ), que
%              cuenta cuántos números menores que M
%              son coprimos con M.
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
% coprimos si su máximo común divisor es 1.
coprime(X, Y) :- 
    gcd(X, Y, 1).

% Predicado totient(M, Phi) que calcula la función
% totiente de Euler para un número M. Phi es el
% resultado que cuenta los números coprimos menores
% que M.

totient(1, 1).
totient(M, Phi) :- 
    M > 1, 
    totient_acc(M, M, 0, Phi).

% Caso base: cuando K llega a 0, devuelve el acumulador.
totient_acc(_, 0, Acc, Acc).

% Caso recursivo: si K es coprimo con M, incrementa el acumulador.
totient_acc(M, K, Acc, Phi) :- 
    K > 0, 
    coprime(M, K), 
    Acc1 is Acc + 1, 
    K1 is K - 1, 
    totient_acc(M, K1, Acc1, Phi).

% Caso recursivo: si K no es coprimo con M, solo decrementa K.
totient_acc(M, K, Acc, Phi) :- 
    K > 0, 
    \+ coprime(M, K), 
    K1 is K - 1, 
    totient_acc(M, K1, Acc, Phi).

% Ejemplo de uso:
% ?- gcd(48, 18, G).
% G = 6.
%
% ?- coprime(15, 28).
% true.
%
% ?- coprime(12, 18).
% false.
%
% ?- totient(9, Phi).
% Phi = 6.
%
% ?- totient(10, Phi).
% Phi = 4.
% ----------------------------------------------
