# Nombre del intérprete de Prolog
PROLOG = swipl

# Objetivo para ejecutar todos los programas
run_all: run_programa1 run_programa2 run_programa3 run_programa4 run_programa5 \
         run_programa6 run_programa7 run_programa8 run_programa9 run_programa10 \
         run_programa11 run_programa12 run_programa13 run_programa14 run_programa15 \
         run_programa16 run_programa17 run_programa18 run_programa19 run_programa20 \
         run_programa21 run_programa22 run_programa23 run_programa24 run_programa25 \
         run_programa26 run_programa27 run_programa28 run_programa29 run_programa30 \
         run_programa31 run_programa32 run_programa33 run_programa34 run_programa35 \
         run_programa36 run_programa37 run_programa38 run_programa39 run_programa40 \
         run_programa41 run_programa42 run_programa43 run_programa44 run_programa45 \
         run_programa46 run_programa47 run_programa48 run_programa49 run_programa50

# Reglas para ejecutar cada programa individualmente
run_programa1:
	$(PROLOG) -s programa1.pl -g "my_last(X, [a, b, c, d]), writeln(X), halt."

run_programa2:
	$(PROLOG) -s programa2.pl -g "penultimate(X, [1, 2, 3, 4]), writeln(X), halt."

run_programa3:
	$(PROLOG) -s programa3.pl -g "element_at(X, [10, 20, 30, 40, 50], 3), writeln(X),halt."

run_programa4:
	$(PROLOG) -s programa4.pl -g "list_length([1, 2, 3, 4, 5], N),writeln(N), halt."

run_programa5:
	$(PROLOG) -s programa5.pl -g "reverse_list([1, 2, 3, 4, 5], R),writeln(R), halt."

run_programa6:
	$(PROLOG) -s programa6.pl -g "((palindrome([r, a, d, a, r])-> writeln('true')); writeln('false')), halt."

run_programa7:
	$(PROLOG) -s programa7.pl -g "my_flatten([1, [2, 3], 4, [5, [6, 7]]], Flat),writeln(Flat), halt."

run_programa8:
	$(PROLOG) -s programa8.pl -g "compress([a, a, b, b, c, a, a, a], R),writeln(R), halt."

run_programa9:
	$(PROLOG) -s programa9.pl -g "pack([a, a, b, b, c, a, a, a], R),writeln(R), halt."

run_programa10:
	$(PROLOG) -s programa10.pl -g "encode([a, a, b, b, c, a, a, a], R),writeln(R), halt."

run_programa11:
	$(PROLOG) -s programa11.pl -g "encode_modified([a, a, b, b, c, a, a, a], R),writeln(R), halt."

run_programa12:
	$(PROLOG) -s programa12.pl -g "decode([[2, a], [2, b], [1, c], [3, a]], R),writeln(R), halt."

run_programa13:
	$(PROLOG) -s programa13.pl -g "encode_direct([a, a, b, b, c, a, a, a], R),writeln(R), halt."

run_programa14:
	$(PROLOG) -s programa14.pl -g "dupli([a, b, c], R),writeln(R), halt."

run_programa15:
	$(PROLOG) -s programa15.pl -g "dupli([a, b, c], 3, R),writeln(R), halt."

run_programa16:
	$(PROLOG) -s programa16.pl -g "drop([a, b, c, d, e, f, g], 3, R),writeln(R), halt."

run_programa17:
	$(PROLOG) -s programa17.pl -g "split([a, b, c, d, e, f, g], 3, L1, L2),writeln(L1),writeln(L2), halt."

run_programa18:
	$(PROLOG) -s programa18.pl -g "slice([a, b, c, d, e, f, g], 2, 5, R),writeln(R), halt."

run_programa19:
	$(PROLOG) -s programa19.pl -g "rotate([a, b, c, d, e, f, g], 3, R),writeln(R), halt."

run_programa20:
	$(PROLOG) -s programa20.pl -g "remove_at(X, [a, b, c, d, e], 3, R),writeln(R), halt."

run_programa21:
	$(PROLOG) -s programa21.pl -g "insert_at(x, [a, b, c, d], 3, R),writeln(R), halt."

run_programa22:
	$(PROLOG) -s programa22.pl -g "range(4, 9, R),writeln(R), halt."

run_programa23:
	$(PROLOG) -s programa23.pl -g "rnd_select([a, b, c, d, e], 3, R),writeln(R), halt."

run_programa24:
	$(PROLOG) -s programa24.pl -g "lotto(6, 49, L),writeln(L), halt."

run_programa25:
	$(PROLOG) -s programa25.pl -g "rnd_permu([a, b, c, d], P),writeln(P), halt."

run_programa26:
	$(PROLOG) -s programa26.pl -g "combinations(2, [a, b, c, d], Combs),writeln(Combs), halt."

run_programa27:
	$(PROLOG) -s programa27.pl -g "groups([2, 3], [a, b, c, d, e], Grupos),writeln(Grupos), halt."

run_programa28:
	$(PROLOG) -s programa28.pl -g "lsort([[1, 2, 3], [4, 5], [6]], S),writeln(S), halt."

run_programa29:
	$(PROLOG) -s programa29.pl -g "length_frequency([[a], [b, c], [d, e, f], [g], [h, i]], F),writeln(F), halt."

run_programa30:
	$(PROLOG) -s programa30.pl -g "((is_prime(29) -> writeln('true')); writeln('false')), halt."

run_programa31:
	$(PROLOG) -s programa31.pl -g "gcd(48, 18, G),writeln(G), halt."

run_programa32:
	$(PROLOG) -s programa32.pl -g "((coprime(15, 28) -> writeln('true')); writeln('false')), halt."

run_programa33:
	$(PROLOG) -s programa33.pl -g "totient(9, Phi),writeln(Phi), halt."

run_programa34:
	$(PROLOG) -s programa34.pl -g "test_factorizacion, halt."

run_programa35:
	$(PROLOG) -s programa35.pl -g "factores_multiplicidad(100, F),writeln(F), halt."

run_programa36:
	$(PROLOG) -s programa36.pl -g "totient_improved(10, Phi),writeln(Phi), halt."

run_programa37:
	$(PROLOG) -s programa37.pl -g "prime_list(10, 30, Primes),writeln(Primes), halt."

run_programa38:
	$(PROLOG) -s programa38.pl -g "goldbach(28, [P1, P2]),writeln(P1),writeln(P2), halt."

run_programa39:
	$(PROLOG) -s programa39.pl -g "goldbach_list(10, 30, L),writeln(L), halt."

run_programa40:
	$(PROLOG) -s programa40.pl -g "table(A, B, (A, B)), halt."

run_programa41:
	$(PROLOG) -s programa41.pl -g "truth_table(xor(A, B)), halt."

run_programa42:
	$(PROLOG) -s programa42.pl -g "gray(3, C),writeln(C), halt."

run_programa43:
	$(PROLOG) -s programa43.pl -g "huffman([fr(a, 5), fr(b, 9), fr(c, 12), fr(d, 13), fr(e, 16), fr(f, 45)], Hs),writeln(Hs), halt."

run_programa44:
	$(PROLOG) -s programa44.pl -g "((istree(t(a, t(b, nil, nil), t(c, nil, nil))) -> writeln('true')); writeln('false')), halt."

run_programa45:
	$(PROLOG) -s programa45.pl -g " cbal_tree(3, T),writeln(T), halt."

run_programa46:
	$(PROLOG) -s programa46.pl -g "test_arboles, halt."

run_programa47:
	$(PROLOG) -s programa47.pl -g "construct([3, 1, 4, 1, 5, 9], Tree),writeln(Tree), halt."

run_programa48:
	$(PROLOG) -s programa48.pl -g "sym_cbal_trees(3, Trees),writeln(Trees), halt."

run_programa49:
	$(PROLOG) -s programa49.pl -g "hbal_tree(1, Tree),writeln(Tree), halt."

run_programa50:
	$(PROLOG) -s programa50.pl -g "hbal_tree_nodes(3, Tree),writeln(Tree), halt."

# Objetivo para limpiar archivos generados (si aplica)
clean:
	del *.qlf

# Declarar que los objetivos no están asociados a un archivo real
.PHONY: run_all run_programa1 run_programa2 run_programa3 run_programa4 run_programa5 \
        run_programa6 run_programa7 run_programa8 run_programa9 run_programa10 \
        run_programa11 run_programa12 run_programa13 run_programa14 run_programa15 \
        run_programa16 run_programa17 run_programa18 run_programa19 run_programa20 \
        run_programa21 run_programa22 run_programa23 run_programa24 run_programa25 \
        run_programa26 run_programa27 run_programa28 run_programa29 run_programa30 \
        run_programa31 run_programa32 run_programa33 run_programa34 run_programa35 \
        run_programa36 run_programa37 run_programa38 run_programa39 run_programa40 \
        run_programa41 run_programa42 run_programa43 run_programa44 run_programa45 \
        run_programa46 run_programa47 run_programa48 run_programa49 run_programa50 clean
