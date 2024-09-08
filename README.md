# Monster Battling Game in Prolog

This project is a prolog-based knowledge system that represents the mechanics of a fictional monster battling game. 
It is part of the F29AI Artificial Intelligence and Intelligent Agents CW1 at Heriot-Watt University.
It includes knowledge about five monsters, their types, moves, and the effectiveness of these moves against other monsters. 
The program is capable of answering queries about the monsters, their moves, and which moves are more effective in battle.

## Project Structure

The repository contains the following files:

- `monster.pl`: This is the main Prolog file that encodes the knowledge base about the monsters, their types, moves, and the effectiveness of those moves.
- `output.txt`: This file contains sample queries and their answers based on the Prolog program.

## Monster Details

There are five monsters in this game:
1. **annihilape** - Type: Ghost
2. **espathra** - Type: Psychic
3. **flamigo** - Type: Fighting
4. **lechonk** - Type: Normal
5. **mabosstiff** - Type: Dark

Each monster has four moves, and the moves themselves are assigned to one of five types: psychic, fighting, dark, ghost, and normal.
<img width="916" alt="image" src="https://github.com/user-attachments/assets/51a922a6-6b42-42c4-a571-3447e64cb864">


## Move Effectiveness

Move effectiveness is based on the interaction between the move type and the monster's type. For example:
- a fighting type move is weak against psychic type monsters
- a dark type move is strong against ghost type monsters
  
Combinations that aren’t strong, weak, or superweak are ordinary

<img width="916" alt="image" src="https://github.com/user-attachments/assets/c977c514-6c49-4440-b180-3cea5f05cd9e">

These relationships are encoded in Prolog using facts and rules.

## Prolog Facts and Rules

### Facts
- **basicType(t)**: Represents that `t` is a basic type (e.g., psychic, fighting, etc.).
- **monster(mo,t)**: Represents that `mo` is a monster of type `t`.
- **move(mv,t)**: Represents that `mv` is a move of type `t`.
- **monsterMove(mo,mv)**: Represents that `mo` is a monster that can use the move `mv`.
- **typeEffectiveness(e,t1,t2)**: Represents the effectiveness `e` of a move of type `t1` against a monster of type `t2`.

### Rules
- **moreEffective(e1,e2)**: Represents that effectiveness `e1` is more effective than `e2`.
- **moreEffectiveThan(E1,E2)**: Recursively checks the effectiveness of one move over another.
- **monsterMoveMatch(T, MO1, MO2, MV)**: Finds if two monsters share a move of type `T`.
- **moreEffectiveMoveType(MV1, MV2, T)**: Determines which move is more effective against a specific monster type.
- **moreEffectiveMove(MO1, MV1, MO2, MV2)**: Determines if one monster's move is more effective than another's in battle.

### How to Run:
Ensure you have Prolog installed on your system.
```shell
swipl
```
Once you enter the Prolog shell, load the program:
```prolog
['monster.pl'].
```

And then from there, enter your queries.

## Example Queries

Here are some example queries you can run:

1. **Find the type of a specific monster:**
   ```prolog
   ?- monster(annihilape, ghost).
   true.
   ```
   
2. List all moves of a certain type:
   ```prolog
   ?- move(Move, fighting).
   Move = lowKick ;
   Move = closeCombat.
   ```
   
3. Find the monsters that have a certain move:
   ```prolog
   ?- monsterMove(Monster, bodySlam).
   Monster = annihilape ;
   Monster = lechonk ;
   Monster = mabosstiff.
   ```
   
4. Check move effectiveness:
   ```prolog
   ?- typeEffectiveness(strong, fighting, dark).
    true.
   ```
   
## License

This project is licensed under Heriot-Watt University's student coursework guidelines. Unauthorized distribution or use of this code is prohibited.
