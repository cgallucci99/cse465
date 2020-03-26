% parse.pl

noun([sun]).
noun([children]).

verb([shines]).
verb([illuminates]).

article([the]).
article([a]).

adjective([big]).
adjective([yellow]).

adverb([brightly]).

sentence(S) :- append(NP, VP, S), np(NP), vp(VP).

np([ART|NP]) :- article([ART]), np2(NP).
np(NP) :- np2(NP).

np2(NP2) :- noun(NP2).
np2(NP2) :- np3(NP2, 10).

np3(NP,_) :- noun(NP).
np3([ADJ|NP], N) :- adjective([ADJ]), N >= 1, np3(NP, N - 1). 

vp(VP) :- verb(VP).
vp([VERB|ADV]) :- verb([VERB]), adverb(ADV).

