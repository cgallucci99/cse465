/*
Answers to non-coding questions:

a. What are antecedents? Consequences?
        An antecedent is the “if” part of an if-else clause. A consequence is the “else” part, or what happens when the antecedent is true.
b. Give general (not rigorous) definitions of resolution and unification.
        Resolution is what allows for inferences to be made from existing propositions. Unification is trying to find the proper values for variables to make a proposition true.
c. What are the forms of Horn clauses.
        Horn clauses either have a single atomic proposition as the consequence or have no consequence.
d. Explain what is wrong with the Prolog statement K is K + 1.
        If K already has a value, it cannot be assigned a new value like 1 plus itself.

*/

/*
Something that you should be aware of:

Legal comparisons: >, <, >=
Illegal: <=

So, the following are allowable:

3 > 0.
0 < 3.
3 >= 3.

But the following is not:

3 <= 5.

For this, you should:

5 >= 3.
*/

/*
The real roots of Ax^2+Bx+C=0 are returned in the list named ROOTS. If there are
two roots, they are arranged in ascending order.

Successful queries:
 quadratic(2.0,5.0,2.0,L).     % L=[-2.0,-0.5]
 quadratic(1.0,0.0,0.0,L).     % L=[0.0]
 quadratic(1.0,3.0,-4.0,L).    % L=[-4.0,1.0]

Failed queries:
 quadratic(2.0,5.0,2.0,[]). 
*/

quadratic(A, B, C, [R1,R2|[]]) :- checkRoots(A,B,C,R1), checkRoots(A,B,C,R2), R2 > R1.
quadratic(A, B, C, [R1|[]]) :- checkRoots(A,B,C,R1).
checkRoots(A,B,C,ROOT) :- ROOT is (-B+sqrt(B*B-4*A*C))/(2*A).
checkRoots(A,B,C,ROOT) :- ROOT is (-B-sqrt(B*B-4*A*C))/(2*A).

/*
The input is 6 instaniated integer values. Query succeeds
if the volume of the first cube is > the volume of the second.

Successful queries:
 isLargerCube(2,2,2,1,3,2).
 isLargerCube(2,2,20,5,3,2).

Failed queries:
 isLargerCube(1,3,2,2,2,2).
 isLargerCube(2,2,2,2,2,2).
*/

isLargerCube(W1, L1, H1, W2, L2, H2) :- isLargerCube(W1, L1, H1, W2, L2, H2, V1, V2), V1 > V2.
isLargerCube(W1, L1, H1, W2, L2, H2, V1, V2) :- V1 is W1 * L1 * H1, V2 is W2 * L2 * H2.


/*
Input is 3 instantiated integers. The 4th parameter is
bound to the clamped value. See description in previous
assignment.

Successful queries:
clamp(1, 0, 2, X).	 % X = 1
clamp(-1, 0, 2, X).	 % X = 0
clamp(10, 0, 2, X).	 % X = 2

Failed queries:
clamp(1, 0, 2, 4).
*/

clamp(V, LO, _, VP) :- V < LO, VP = LO.
clamp(V, _, HI, VP) :- V > HI, VP = HI.
clamp(V, LO, HI, VP) :- V >= LO, HI >= V, VP = V.


/*
Succeeds if the all the elements of the incoming
flat list are the same value.
Successful queries:
isConstant([]).
isConstant([1,1]).
isConstant([a,a,a]).

Failed queries:
isConstant([a,a,1]).
isConstant([a,1,a]).
*/
isConstant([]).
isConstant([_]).
isConstant([X, Y|T]) :- X = Y, isConstant([Y|T]).

/*
First parameter is an instantiated, flat list of integers.
The second parameter is then bound to a list containing
only the positive values.

Successful queries:
positives([], L).	% L = []
positives([1], L).	% L = [1]
positives([-1], L).	% L = []
positives([-1,2,5,-9,4,0], L).	% L = [2,5,4]

Failed queries:
positives([-1], [-1]).
*/

positives([],[]).
positives([H|T], POS) :- H > 0, append([H], POS2, POS), positives(T, POS2).
positives([H|T], POS) :- 0 >= H, append([], POS2, POS), positives(T, POS2).

/*
Succeeds if the list of integers can be cleaved into two sublists that both sum to
the same value.

Successful queries:
 splitable([1,2,3,4,10]).
 splitable([2,1,1]).
 splitable([0]).

Unsuccessful queries:
 splitable([1,4,8]).
 splitable([1,3,2]).
 splitable([2,2,1,1]).
*/

%splitable(L) :- splitable(L,S1,S2).


splitable([H|T]) :- sum([H], S1), sum(T, S2), S1=:=S2.
splitable([H|T]) :- splitable2([H],T).

splitable2(L1, [H|T]) :- append([H], L1, R), sum(R, S1), sum(T, S2), S1 =:= S2.
splitable2(L1, [H|T]) :- append([H], L1, R), splitable2(R, T).

sum([], S) :- S is 0.
sum([H|T], S) :- sum(T, S2), S is H + S2.

/*
The first parameter is an instantiate list of atoms.
The second parameters is an atom. The third parameter
is then instanitated to the original list, but with
all instances of the given value (i.e., second parameter)
removed.

Successful queries:
 removeAll([], a, []).
 removeAll([], a, L).        % L = []
 removeAll([a], a, L).       % L = []
 removeAll([a,b,c], d, L).   % L = [a,b,c]
 removeAll([a,a,c,a], a, L). % L = [c]

Unsuccessful queries:
 removeAll([], a, [a]).
*/

removeAll([], _, []).

removeAll([H|T], V, NEWLST) :- H=V, removeAll(T, V, NEWLST2), append([], NEWLST2, NEWLST).
removeAll([H|T], V, NEWLST) :- H\=V, removeAll(T, V, NEWLST2), append([H], NEWLST2, NEWLST).

/*
Here are the parental relationships (see Google Docs file "GenerationNames"
located in the homework folder). The abbreviations used are based on females:
         D = daughther, A = aunt, N = niece, M = mother
So, ggm corresponds to great-grandmother. gn corresponds to great niece.
The following definitions are given to you for testing purposes. Your code 
should also work for other sets of people. The family tree cannot have cycles.
*/

parent(gggm, ggm).
parent(ggm, gm).
parent(gm, m).
parent(m, self).
parent(self, d).
parent(d, gd).

parent(gggm, gga). parent(gga, c12a). parent(c12a, c21a). parent(c21a, c3).
parent(ggm, ga). parent(ga, c11a). parent(c11a, c2).
parent(gm, a). parent(a, c1).

parent(m, s).

parent(s, n). parent(n, gn).
parent(c1, c11b). parent(c11b, c12b).

parent(c2, c21b). parent(c21b, c22).
parent(c3, c31). parent(c31, c32).

/*
Succeeds if P1 and P2 are Mth cousins N times removed.
M and N will be bound to integers when the query is issued.
You can add "parent" facts but you can't change those
that have been provided.

Successful queries:
 mthCousinNTimesRemoved(self, c3, 3, 0).
 mthCousinNTimesRemoved(self, c31, 3, 1).
 mthCousinNTimesRemoved(self, c32, 3, 2).

 mthCousinNTimesRemoved(self, c2, 2, 0).
 mthCousinNTimesRemoved(self, c21a, 2, 1).
 mthCousinNTimesRemoved(self, c21b, 2, 1).
 mthCousinNTimesRemoved(self, c22, 2, 2).

 mthCousinNTimesRemoved(self, c1, 1, 0).
 mthCousinNTimesRemoved(self, c11a, 1, 1).
 mthCousinNTimesRemoved(self, c11b, 1, 1).
 mthCousinNTimesRemoved(self, c12a, 1, 2).
 mthCousinNTimesRemoved(self, c12b, 1, 2).

 mthCousinNTimesRemoved(c1, c2, 2, 0).
 mthCousinNTimesRemoved(c2, c1, 2, 0).
 mthCousinNTimesRemoved(c11b, c32, 4, 1).
 mthCousinNTimesRemoved(c32, c11b, 4, 1).

Sample unsuccessful queries:
 mthCousinNTimesRemoved(self, gn, 1, 2).
 mthCousinNTimesRemoved(self, s, 1, 0).
 mthCousinNTimesRemoved(gd, ggm, 1, 1).
*/

mthCousinNTimesRemoved(X, Y, M, N) :- M=0, N=0, parent(P,X), parent(P,Y), X \== Y.
mthCousinNTimesRemoved(X, Y, M, N) :- M > 0, N>=0, parent(P,X), parent(P2,Y), M2 is M-1, mthCousinNTimesRemoved(P, P2, M2,N).
mthCousinNTimesRemoved(X, Y, M, N) :- M=0, N > 0, parent(P, Y), N2 is N-1, mthCousinNTimesRemoved(X, P, 0,N2).
mthCousinNTimesRemoved(X, Y, M, N) :- M=0, N > 0, parent(P, X), N2 is N-1, mthCousinNTimesRemoved(P, Y, 0,N2).

/*
Nim is a two-player, turn-taking, game using three piles of
objects. Each player can pick up any number of items from
exactly one pile. The game ends when all the objects are
removed; the last player to move loses the game.

Write a prolog rule to determine if the current player can
win the game, if they play the game perfectly. This Prolog
rule will succeed if a winning if it is possible. The query
will have the form: nim(P1, P2, P3), where P1, P2, and P3 are
parameters instantiated to non-negative integers. These values
correspond to the number of objects in the three piles. If a win
is possible, the rule should succeed; otherwise, it should fail.
Here are some examples:

Successful queries:
 nim(2, 0, 0).
 nim(2, 1, 0).
 nim(1, 2, 2).
 nim(2, 2, 3).

Unsuccessful queries:
 nim(1, 0, 0).
 nim(1, 1, 1).

Your code should work for starting piles containing any number of
objects; however, only piles with original sizes of 10 and fewer
will be tested.
*/

nim(P1, P2, P3) :- fail.
