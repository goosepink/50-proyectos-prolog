% ===============================================
% Autor: Javier Rosas
% Fecha: 27 de octubre de 2024
% Descripción: Programa en Prolog que calcula el
%              máximo común divisor (MCD) de dos
%              números utilizando el algoritmo de
%              Euclides. El algoritmo consiste en
%              dividir el número mayor entre el
%              número menor y continuar el proceso
%              con el resto de la división, hasta
%              que el resto sea cero. En ese punto,
%              el divisor es el MCD.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% class Program
% {
%     // Función para calcular el MCD usando el algoritmo de Euclides.
%     static int Gcd(int a, int b)
%     {
%         while (b != 0)
%         {
%             int temp = b;
%             b = a % b;
%             a = temp;
%         }
%         return a;
%     }
% 
%     static void Main()
%     {
%         int num1 = 48, num2 = 18;
%         int resultado = Gcd(num1, num2);
% 
%         Console.WriteLine("El MCD de " + num1 + " y " + num2 + " es: " + resultado);
%     }
% }
% ----------------------------------------------

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

% Ejemplo de uso:
% ?- gcd(48, 18, G).
% G = 6.
% ----------------------------------------------
