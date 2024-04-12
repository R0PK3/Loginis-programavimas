%Robertas Buracevskis, 2110543, 3 PS, 3 uzduotis, 1.12;2.2;3.6;4.7 var.

%skirk_teig_neig

skirk_teig_neig([],[],[]).
skirk_teig_neig([H|T],[H|R1T],R2):-
    H>0,
    skirk_teig_neig(T,R1T,R2), !.
skirk_teig_neig([H|T],R1,[H|R2T]):-
    H<0,
    skirk_teig_neig(T,R1,R2T), !.
skirk_teig_neig([0|T],R1,R2):-
    skirk_teig_neig(T,R1,R2), !.

%apjungti

apjungti([],[]).
apjungti([S|Ss],R):-
    apjungti(Ss,R1),
    !,
    concat(S,R1,R).

concat([],A,A).
concat([E|A],B,[E|AB]):-
    concat(A,B,AB).

%rusiuoti

rusiuoti(S, R) :-
    rikiuoti(S, [], R).

rikiuoti([], Rest, Rest).
rikiuoti([X|Tail], Rest, R) :-
    iterpti(X, Rest, NewRest),
    rikiuoti(Tail, NewRest, R),!.

iterpti(X, [], [X]).
iterpti(X, [Y|Tail], [X,Y|Tail]) :- X =< Y, !.
iterpti(X, [Y|Tail], [Y|Result]) :- X > Y,iterpti(X, Tail, Result).

%i_dvejet

i_dvejet(Des,Dvej):-
    dvej_i_des(Des,0,DvejNumber),
    des_i_sar(DvejNumber,Dvej), !.

dvej_i_des([],A,A).
dvej_i_des([H|T],A,Des):-
    NaujasA is A * 10 + H,
    dvej_i_des(T,NaujasA,Des).

des_i_sar(0,[]).
des_i_sar(N,Sar):-
    konvertuoti(N,[],Sar).

konvertuoti(0,A,A).
konvertuoti(N,A,Sar):-
    N > 0,
    Skait is N mod 2,
    NaujasA is (N - Skait) // 2, %dalinimas be liekanos
    konvertuoti(NaujasA, [Skait | A],Sar).

%testai
% ?-skirk_teig_neig([5,-1,-4,3,0],R1,R2).
% ?-skirk_teig_neig([],R1,R2).
% ?-skirk_teig_neig([-81,0,0,5,3,-8,78],R1,R2).
%
%?-apjungti([[a,b],[c],[d,[e,f], g]],R).
%?-apjungti([[1],[2],[3],[4]],R).
%?-apjungti([],R).
%?-apjungti(I,[a,b]).
%
%?-rusiuoti([1,23,5,1,2],R).
%?-rusiuoti([],R).
%?-rusiuoti([-816,-5,0,1,78],R).
%
%?-is_dvejet([1,0,0,0,1,0,1,1],Des).
%?-is_dvejet([],Des).
%?-is_dvejet([1,1,1,1],Des).


