/*
Rayyan Shariff
H00363892

1.
Basic type facts*/
basicType(psychic).
basicType(fighting).
basicType(dark).
basicType(ghost).
basicType(normal).

/*Assigning monsterType to each Monster*/
monster(annihilape, ghost).
monster(espathra, psychic).
monster(flamingo, fighting).
monster(lechonk, normal).
monster(mabosstiff, dark).

/*Assigning each move a type*/
move(lowKick, fighting).
move(shadowPunch, ghost).
move(rageFist, ghost).
move(bodySlam, normal).

move(psybeam, psychic).
move(quickAttack, normal).
move(shadowBall, ghost).

move(payback, dark).
move(megakick, normal).
move(closeCombat, fighting).

move(tackle, normal).
move(takeDown, normal).
move(zenHeadbutt, psychic).

move(snarl, dark).
move(lick, ghost).
move(bite, dark).

/*Assigning monsters moves*/
monsterMove(annihilape, lowKick).
monsterMove(annihilape, shadowPunch).
monsterMove(annihilape, rageFist).
monsterMove(annihilape, bodySlam).

monsterMove(espathra, psybeam).
monsterMove(espathra, quickAttack).
monsterMove(espathra, lowKick).
monsterMove(espathra, shadowBall).

monsterMove(flamingo, lowKick).
monsterMove(flamingo, payback).
monsterMove(flamingo, megakick).
monsterMove(flamingo, closeCombat).

monsterMove(lechonk, tackle).
monsterMove(lechonk, takeDown).
monsterMove(lechonk, zenHeadbutt).
monsterMove(lechonk, bodySlam).

monsterMove(mabosstiff, snarl).
monsterMove(mabosstiff, lick).
monsterMove(mabosstiff, bite).
monsterMove(mabosstiff, bodySlam).

/*
2. Effectivness of one monster move used on another monster type information
*/
/*psychic move effectiveness*/
typeEffectiveness(weak, psychic, psychic).
typeEffectiveness(strong, psychic, fighting).
typeEffectiveness(superweak, psychic, dark).
typeEffectiveness(ordinary, psychic, ghost).
typeEffectiveness(ordinary, psychic, normal).

/*fighting move effectiveness*/
typeEffectiveness(weak, fighting, psychic).
typeEffectiveness(ordinary, fighting, fighting).
typeEffectiveness(strong, fighting, dark).
typeEffectiveness(superweak, fighting, ghost).
typeEffectiveness(strong, fighting, normal).

/*dark move effectiveness*/
typeEffectiveness(strong, dark, psychic).
typeEffectiveness(weak, dark, fighting).
typeEffectiveness(weak, dark, dark).
typeEffectiveness(strong, dark, ghost).
typeEffectiveness(ordinary, dark, normal).

/*ghost move effectiveness*/
typeEffectiveness(strong, ghost, psychic).
typeEffectiveness(ordinary, ghost, fighting).
typeEffectiveness(weak, ghost, dark).
typeEffectiveness(strong, ghost, ghost).
typeEffectiveness(superweak, ghost, normal).

/*normal move effectiveness*/
typeEffectiveness(ordinary, normal, psychic).
typeEffectiveness(ordinary, normal, fighting).
typeEffectiveness(ordinary, normal, dark).
typeEffectiveness(superweak, normal, ghost).
typeEffectiveness(ordinary, normal, normal).


/*
3. effectiveness order information
*/
moreEffective(strong, ordinary).
moreEffective(ordinary, weak).
moreEffective(weak, superweak).

/*
4. transitive effectiveness information
*/
moreEffectiveThan(E1, E2) :- moreEffective(E1, E2).
moreEffectiveThan(E1, E2) :- moreEffective(E1, X),  moreEffectiveThan(X, E2). 

/*
5. checks whether two monsters have the same move of a given type

 checks if T is a valid basic monster type
 checks if MO1 is a valid monster of type T1. 
 checks if MO2 is a valid monster of type T2. 
 checks if MV is a valid move of type T. 
 It verifies that the move MV is associated with the monster MO1
 It verifies that the move MV is associated with the monster MO2
*/
monsterMoveMatch(T, MO1, MO2, MV) :- 
    basicType(T), 
    monster(MO1, T1), 
    monster(MO2, T2), 
    move(MV, T), 
    monsterMove(MO1, MV), 
    monsterMove(MO2, MV). 
/*
6. checks if one move MV1 is more effective than another move MV2 against a specific monster type T

 checks if MV1 is a valid move and retrieves its associated type, which is stored in T1
 checks if MV2 is a valid move and retrieves its associated type, stored in T2
 calculates the effectiveness of MV1 against the monster type T. It uses the typeEffectiveness facts to determine this effectiveness and stores the result in E1.
 calculates the effectiveness of MV2 against the monster type T and stores the result in E2.
 checks if E1 is more effective than E2 according to the predefined effectiveness hierarchy

*/
moreEffectiveMoveType(MV1, MV2, T) :-
    move(MV1, T1), 
    move(MV2, T2), 
    typeEffectiveness(E1, T1, T),  
    typeEffectiveness(E2, T2, T),  
    moreEffectiveThan(E1, E2).  

/*
7. checks if a monster MO1 using a specific move MV1 is more effective against another monster MO2 using a different move MV2

 checks the type of monster MO1 and assigns it to T1.
 checks the type of monster MO2 and assigns it to T2
 verifies that MO1 knows the move MV1
 verifies that MO2 knows the move MV2.
 checks if MV1 is a valid move for the type T1 of MO1
 checks if MV2 is a valid move for the type T2 of MO2.
 calculates the effectiveness of MV1 against the type of MO2 (T2). It uses the typeEffectiveness facts to determine this effectiveness and stores the result in E1.
 calculates the effectiveness of MV2 against the type of MO1 (T1) and stores the result in E2.
 checks if the effectiveness of MV1 (against MO2) is greater than the effectiveness of MV2 (against MO1) according to the predefined effectiveness hierarchy
*/
moreEffectiveMove(MO1, MV1, MO2, MV2) :-
    monster(MO1, T1),  
    monster(MO2, T2),  
    monsterMove(MO1, MV1),  
    monsterMove(MO2, MV2), 
    move(MV1, T1),    
    move(MV2, T2),  
    typeEffectiveness(E1, T1, T2),  
    typeEffectiveness(E2, T2, T1), 
    moreEffectiveThan(E1, E2).



