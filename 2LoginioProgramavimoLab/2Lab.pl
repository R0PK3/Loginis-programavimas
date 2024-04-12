%Robertas Buracevskis, 2110543, 3 PS, 2 uzduotis, 1.2;4.3 var.

kelias(vilnius,kaunas,100).
kelias(kaunas,klaipeda,200).
kelias(vilnius,panevezys,200).
kelias(panevezys,kaunas,100).
kelias(panevezys,klaipeda,250).
kelias(panevezys,siauliai,50).
kelias(klaipeda,taurage, 70).
kelias(kaunas, taurage, 100).


%ar yra tiesioginis kelias is miesto X i miesta Y su atstumu L.

galima_nuvaziuoti(X,Y,L):-
   kelias(X,Y,L).

% Ar galima pasiekti miesta Y is miesto X per tarpinius miestus Z.
% Atstumai sumuojami ir lyginami su L
galima_nuvaziuoti(X,Y,L):-
    kelias(X,Z,L1),
    galima_nuvaziuoti(Z,Y,L2),
    L is L1 + L2.

% Pn =  2Pn-1 + Pn-2
pell(0,0).
pell(1,1).
pell(N,Pell):-
    N > 1,   %kad nebutu neigiamu skaiciu
    N1 is N - 1, %Apskaiciuojam n-1
    N2 is N - 2, %Apskaiciuojam n-2
    pell(N1,Pel1), %skaiciuojam Pn-1
    pell(N2,Pel2), %skaiciuojam Pn-2
    Pell is 2* Pel1 + Pel2. %skaiciuojam galutini pelo skaiciu

% galima_nuvaziuoti(vilnius,klaipeda,X).
% galima_nuvaziuoti(vilnius,siauliai,200). - false
% galima_nuvaziuoti(kaunas,taurage,100). - true

%pell(11,X). - 5741
%pell(X, 5741). - error
%pell(1,X). - 1
