% ===============================================
% Autor: Javier Rosas
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que define operadores lógicos básicos
%              (AND, OR, NAND, NOR, XOR, IMPLICACIÓN, EQUIVALENCIA) y
%              genera tablas de verdad para expresiones usando estos
%              operadores.
% ===============================================

% -------- Definición de operadores lógicos -----
and(A, B) :- A, B.
or(A, _) :- A.
or(_, B) :- B.
nand(A, B) :- \+ (A, B).
nor(A, B) :- \+ (A; B).
xor(A, B) :- A, \+ B; \+ A, B.
impl(A, B) :- \+ A; B.
equ(A, B) :- A, B; \+ A, \+ B.

% -------- Generación de tablas de verdad -------
% Genera una tabla de verdad para una expresión lógica en dos variables.
truth_table(Expr) :-
    write('A     B     Result'), nl,
    write('-------------------'), nl,
    (   (A = true ; A = false),
        (B = true ; B = false),
        Expr =.. [Op, A, B],     % Descompone Expr para formar la llamada con los valores de A y B
        (call(Op, A, B) -> Result = true ; Result = false),
        write(A), write('  '), write(B), write('  '), write(Result), nl,
        fail
    ;   true).

% Ejemplo de uso:
% Generar tabla de verdad para el operador XOR:
% ?- truth_table(xor(A, B)).
%
% Generar tabla de verdad para la implicación (A -> B):
% ?- truth_table(impl(A, B)).
% ----------------------------------------------
