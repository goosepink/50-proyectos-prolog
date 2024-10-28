% ===============================================
% Autor: Javier Rosas
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que genera una tabla de verdad para
%              una expresión lógica en dos variables. A y B son las
%              variables lógicas, y Expr es la expresión lógica que se
%              evalúa.
% ===============================================

% -------- Código en Prolog --------------------
% Genera una tabla de verdad para una expresión lógica en dos variables.
table(A, B, Expr) :-
    (A = true ; A = false),
    (B = true ; B = false),
    write(A), write(' '), write(B), write(' '),
    (call(Expr) -> Result = true ; Result = false),
    write(Result), nl, fail.
table(_, _, _). % Para finalizar la tabla de verdad sin éxito adicional.

% Ejemplo de uso:
% ?- table(A, B, (A, B)).
% true true true
% true false false
% false true false
% false false false
% ----------------------------------------------
