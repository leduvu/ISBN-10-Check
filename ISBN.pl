%---------------------------------
% Aufgabe 5 - Semesteraufgaben 2013
% Le Duyen Sandra, Vu - 768693
%---------------------------------	
	
% Die Anfrage "start." gibt eine Beispielanfrage und dessen Ausgabe heraus.

start :-
	write('Anfrage: isbn_ok(3-203-76013-4).').


%----------------------------------
% "isbn(X)" ist ein einstelliges Prädikat, welches eine 10 stellige ISBN auf ihre Gültigkeit prüft,
% indem sie die Laengenrestriktion prüft.
%
% "phrase(Eingabe,Liste)" ist ein zweistelliges Prädikat, welches auf die DCG Regeln zugreift
% und die Eingabe in die festgelgte Listenform generiert bzw. mit der festgelgten 
% Listenform abgleicht.
%----------------------------------

isbn(X) :- phrase(isbn,X), laenge(X,13), !.

%----------------------------------
% "laenge(Liste,Laenge)" ist ein zweistelliges Prädikat, welches die Länge einer Liste ermittelt.
%----------------------------------

laenge([],0).							% trivialer Fall: Die Länge einer leeren Liste ist 0.
laenge([_Kopf|Rest],Laenge) :-				
	laenge(Rest,Laenge1),				% rekursiver Fall: zählt so lange bis die Liste leer ist
  	Laenge is Laenge1+1.				% Jeder Buchstabe hat die Länge 1, diese werden miteinander
  										% addiert.
  			
%----------------------------------  										
% LAENGENRESTRIKTIONEN 
% DCG Regeln
%----------------------------------

%----------------------------------
% ISBN: 10 stellig, mit Bindestrichen 13 stellig
% Beispiel: isbn(['0',-,'3','2','1',-,'4','1','7','4','6',-,'6']).
%----------------------------------

isbn --> gruppennummer,bindestrich,verlagsnummer,bindestrich,titelnummer,bindestrich,pruefziffer.

%----------------------------------
% Gruppennummer: 1-5 stellig
%----------------------------------

gruppennummer --> [Zahl], {zahl(Zahl)}.						% 1 stellig

gruppennummer --> [Zahl1,Zahl2], 							% 2 stellig
	{zahl(Zahl1), zahl(Zahl2)}.

gruppennummer --> [Zahl1,Zahl2,Zahl3], 						% 3 stellig usw.
	{zahl(Zahl1), zahl(Zahl2), zahl(Zahl3)}.
	
gruppennummer --> [Zahl1,Zahl2,Zahl3,Zahl4], 
	{zahl(Zahl1), zahl(Zahl2), zahl(Zahl3), zahl(Zahl4)}.
	 
gruppennummer --> [Zahl1,Zahl2,Zahl3,Zahl4,Zahl5], 
	{zahl(Zahl1), zahl(Zahl2), zahl(Zahl3), zahl(Zahl4), zahl(Zahl5)}. 
  
%----------------------------------
% Verlagsnummer: 2-7 stellig
%----------------------------------

verlagsnummer --> [Zahl1,Zahl2], 
	{zahl(Zahl1), zahl(Zahl2)}. 
	
verlagsnummer --> [Zahl1,Zahl2,Zahl3], 
	{zahl(Zahl1), zahl(Zahl2), zahl(Zahl3)}.
	
verlagsnummer --> [Zahl1,Zahl2,Zahl3,Zahl4], 
	{zahl(Zahl1), zahl(Zahl2), zahl(Zahl3), zahl(Zahl4)}.
	
verlagsnummer --> [Zahl1,Zahl2,Zahl3,Zahl4,Zahl5], 
	{zahl(Zahl1), zahl(Zahl2), zahl(Zahl3), zahl(Zahl4), zahl(Zahl5)}.
	
verlagsnummer --> [Zahl1,Zahl2,Zahl3,Zahl4,Zahl5,Zahl6], 
	{zahl(Zahl1), zahl(Zahl2), zahl(Zahl3), zahl(Zahl4), zahl(Zahl5), zahl(Zahl6)}.
	
verlagsnummer --> [Zahl1,Zahl2,Zahl3,Zahl4,Zahl5,Zahl6,Zahl7], 
	{zahl(Zahl1), zahl(Zahl2), zahl(Zahl3), zahl(Zahl4), zahl(Zahl5), zahl(Zahl6), zahl(Zahl7)}.

%----------------------------------	
% Titelnummer: 1-6 stellig
%----------------------------------

titelnummer --> [Zahl], {zahl(Zahl)}.

titelnummer --> [Zahl1,Zahl2], 
	{zahl(Zahl1), zahl(Zahl2)}. 
	
titelnummer --> [Zahl1,Zahl2,Zahl3], 
	{zahl(Zahl1), zahl(Zahl2), zahl(Zahl3)}.
	
titelnummer --> [Zahl1,Zahl2,Zahl3,Zahl4], 
	{zahl(Zahl1), zahl(Zahl2), zahl(Zahl3), zahl(Zahl4)}.
	
titelnummer --> [Zahl1,Zahl2,Zahl3,Zahl4,Zahl5], 
	{zahl(Zahl1), zahl(Zahl2), zahl(Zahl3), zahl(Zahl4), zahl(Zahl5)}.
	
titelnummer --> [Zahl1,Zahl2,Zahl3,Zahl4,Zahl5,Zahl6], 
	{zahl(Zahl1), zahl(Zahl2), zahl(Zahl3), zahl(Zahl4), zahl(Zahl5), zahl(Zahl6)}.
	
titelsnummer --> [Zahl1,Zahl2,Zahl3,Zahl4,Zahl5,Zahl6,Zahl7], 
	{zahl(Zahl1), zahl(Zahl2), zahl(Zahl3), zahl(Zahl4), zahl(Zahl5), zahl(Zahl6), zahl(Zahl7)}. 
	
%----------------------------------
% Prüfziffer: 1 stellig
%----------------------------------

pruefziffer --> [Zahl], {zahl(Zahl)}.

%----------------------------------
% Bindestrich
%----------------------------------

bindestrich --> ['-'].

%----------------------------------
% Lexikon
%----------------------------------

zahl('0').
zahl('1').
zahl('2').
zahl('3').
zahl('4').
zahl('5').
zahl('6').
zahl('7').
zahl('8').
zahl('9').

%----------------------------------	
% "isbn_ok(ISBN)" ist ein einstelliges Prädikat, welches eine 10 stellige ISBN auf seine Richtigkeit prüft,
% dem es die Prüfziffer berechnet und kontrolliert.
%----------------------------------
% "atom_chars(Wort,Liste)" ist ein zweistelliges Prädikat, welches die Eingabe in eine Liste verwandelt.
% "atom_number(AtomNummer,Nummer)" ist ein zweistelliges Prädikat, welches Nummern der Form '1' zu 1 umwandelt.
% "mod(Summe,Zahl)" ist ein zweistelliges Prädikat für die Modulo-Division.
%----------------------------------

isbn_ok(Eingabe) :-
	
	atom_chars(Eingabe,A), 				% Die Eingabe wird in eine Liste umgewandelt.					
	isbn(A),							% Diese Liste wird durch das Prädikat isbn/1 auf Längenrestriktion
										% geprüft.
	delete(A,-,B),  					% Ist dies positiv verlaufen, dann werden die Bindestriche aus der
										% Liste gelöscht (eingebautes Prädikat). Es entstehz eine neue Liste.
	B = [Element1,						% Jedes Element bekommt eine Variable zugeteilt.
	Element2,
	Element3,
	Element4,
	Element5,
	Element6,
	Element7,
	Element8,
	Element9,
	Element10], 
	 
	atom_number(Element1,Code),	% Mit atom_number werden die Apostrophe entfernt, sodass
	atom_number(Element2,Code1),	% mit den Zahlen ganz normal gerechnet werden kann.
	atom_number(Element3,Code2),
	atom_number(Element4,Code3),
	atom_number(Element5,Code4),
	atom_number(Element6,Code5),
 	atom_number(Element7,Code6),
	atom_number(Element8,Code7),
	atom_number(Element9,Code8),
	atom_number(Element10,Pruefziffer),
	
	Zahl2 is Code1 * 2,			% Die Zahlen werden mit N+1 multipliziert. Begonnen wird mit n=2.
	Zahl3 is Code2 * 3,			% Da die erste Ziffer mit 1 multipliziert wird und somit gleich
	Zahl4 is Code3 * 4,			% bleibt.
	Zahl5 is Code4 * 5,
	Zahl6 is Code5 * 6,
	Zahl7 is Code6 * 7,
	Zahl8 is Code7 * 8,
	Zahl9 is Code8 * 9,
	Summe is Code + Zahl2 + Zahl3 + Zahl4 + Zahl5 + Zahl6 + Zahl7 + Zahl8 + Zahl9,
	Pruefziffer is mod(Summe,11), !.	% Die Prüfziffer wird mit dem Modalwert verglichen.