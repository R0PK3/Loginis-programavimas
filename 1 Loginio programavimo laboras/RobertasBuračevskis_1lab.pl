% Robertas Buraèevskis, 2110543, 3 PS. 1 uþduotis, 3;27;31;44 var.

%asmenys
asmuo(petras,vyras,75,filmai).
asmuo(marija,moteris,73,siuvinejimas).
asmuo(rolandas,vyras,50,zvejojimas).
asmuo(deividas,vyras,51,lenktynes).
asmuo(aukse,moteris,49,filmai).
asmuo(ignas,vyras,40,medziokle).
asmuo(ieva,moteris,40,gaminimas).
asmuo(tomas,vyras,25,zaidimai).
asmuo(guste,moteris,26,skaitymas).
asmuo(andrius,vyras,28,programavimas).
asmuo(sandra,moteris,25,keliavimas).
asmuo(gytis,vyras,20,dainavimas).
asmuo(evelina,moteris,25,dainavimas).
asmuo(markas,vyras,3,zaidimai).
asmuo(greta,moteris,2,zaidimai).
asmuo(nojus,vyras,5,sokimas).
asmuo(tadas,vyras,1,zaidimai).
asmuo(saule,moteris,2,zaidimai).
%mamos
mama(marija,rolandas).
mama(marija,aukse).
mama(marija,ignas).
mama(aukse,guste).
mama(aukse,andrius).
mama(ieva,gytis).
mama(guste,markas).
mama(guste,greta).
mama(sandra,nojus).
mama(evelina,tadas).
mama(evelina,saule).
%poros
pora(petras,marija).
pora(deividas,aukse).
pora(ignas,ieva).
pora(tomas,guste).
pora(andrius,sandra).
pora(gytis,evelina).

%papildomi predikatai
tevas(Tevas,Vaikas):-
    mama(Mama,Vaikas),
    pora(Tevas,Mama).
tevai(TevasMama,Vaikas):-
    tevas(TevasMama,Vaikas).
tevai(TevasMama,Vaikas):-
    mama(TevasMama,Vaikas).

%dukra
dukra(Dukra,TevasMama):-
    asmuo(Dukra,moteris,_,_),
    tevai(TevasMama,Dukra).
%vedes
vedes(Vedes) :-
    pora(Vedes,_).
%vyras yra paciame jegu zydejime
vpjz(Vyras) :-
    asmuo(Vyras, vyras, Amzius, _),
    Amzius >= 25, Amzius =< 60.
%asmuo atsvente n sukakciu
at_suk(Asmuo,N):-
    asmuo(Asmuo,_,Amzius,_),
    ApvaliosSukaktys = N*10,
    Amzius >= ApvaliosSukaktys,
    Amzius <(ApvaliosSukaktys+10).



/*
 dukra(greta,guste). - true
 dukra(markas,guste). - false
 dukra(saule,gytis). - true

 vedes(rolandas). - false
 vedes(sandra). - false
 vedes(deividas) - true

 25<=X<=60
 vpjz(petras). - false
 vpjz(guste). - false
 vpjz(tomas). - true.

 at_suk(petras,7). - true.
 at_suk(marija,6). - false.
 at_suk(nojus,0). - true.

*/
