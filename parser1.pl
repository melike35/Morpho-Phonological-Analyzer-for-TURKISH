:-op(1000, xfy, ==>).

%"The girl did homework at the home"

%LEXICON

n-->[girl].
n-->[homework].
n-->[home].

d-->[the].
d-->[the].
p-->[at].

v-->[did].

%PHRASE STRUCTURE RULES

s-->dp,vp.

vp-->v,dp.

vp-->vp, pp.

pp-->p, dp.

dp-->d, np.

dp-->np.

np-->n.

% SHIFT-REDUCE PARSER
% Base
sr_parse([s], []).

% Shift
sr_parse(Stack, [Word|Words]):-
   (Cat ==> [Word]),
   sr_parse([Cat|Stack], Words).

% Reduce
sr_parse([Y,X|Rest], String):-
   (Z ==> X, Y),
   sr_parse([Z|Rest], String).

sr_parse([X|Rest], String):-
   (Y ==> X),
   sr_parse([Y|Rest], String).






