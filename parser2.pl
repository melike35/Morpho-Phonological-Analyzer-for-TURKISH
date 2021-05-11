:-op(1000, xfy, ==>).
 
% LEXICON
n(g) ==> [girl].
n(h) ==> [homework].
v(Y^X^did(X,Y)) ==> [did].

%PHRASE STRUCTURE RULES
s(Sem) ==> n(Subj), vp(Subj^Sem).
vp(Sem) ==> v(Obj^Sem), n(Obj).

% SHIFT-REDUCE PARSER
% Base
sr_parse([s(Sem)], []):- writeln(Sem).
sr_parse([s(Sem)], []):- assert(Sem).


% Shift
sr_parse(Stack, [Word|Words]):-  (Cat ==> [Word]),  sr_parse([Cat|Stack], Words).

% Reduce
sr_parse([Y,X|Rest], String):-  (Z ==> X, Y),  sr_parse([Z|Rest], String).
sr_parse([X|Rest], String):-   (Y ==> X),   sr_parse([Y|Rest], String).



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
